#include "defines.h"
#include "../include/event_data.h"
#include "../include/field_player_avatar.h"
#include "../include/overworld.h"
#include "../include/script.h"
#include "../include/string_util.h"
#include "../include/constants/game_stat.h"
#include "../include/constants/songs.h"

#include "../include/new/courier_quest.h"
#include "../include/new/sky_mount.h"
/*
courier_quest.c
	the "Consegna lampo" side quest: the player rides the officer's Rapidash (a ground sky mount,
	sky_mount.c) to bring a parcel to the scientist on Percorso 4 within COURIER_QUEST_MAX_STEPS steps.
	While delivering:
		- the player is on the bike (bike speed and music) with Rapidash drawn under them,
		- B and Select ask whether to give up (EventScript_CourierQuest_AskQuit),
		- warps into buildings are stopped and ask the same (EventScript_CourierQuest_AskQuitIndoor),
		- the Cut trees' temporary flag stays set on every map, so no tree can block the way,
		- warnings come at COURIER_QUEST_WARNING_1/2 steps left, and running out of steps fails the quest
		  (EventScript_CourierQuest_TooLate).
	VAR_COURIER_STATE: 0 = not delivering, 1 = delivering, 2 = delivered (the officer gives the reward).
*/

#ifdef VAR_COURIER_STATE

#define COURIER_STATE_NONE 0
#define COURIER_STATE_DELIVERING 1
#define COURIER_STATE_DELIVERED 2

extern const u8 EventScript_CourierQuest_AskQuit[];
extern const u8 EventScript_CourierQuest_AskQuitIndoor[];
extern const u8 EventScript_CourierQuest_Warning[];
extern const u8 EventScript_CourierQuest_TooLate[];

u32 __attribute__((long_call)) GetGameStat(u8 index);
void __attribute__((long_call)) Overworld_SetSavedMusic(u16 song);
void __attribute__((long_call)) Overworld_ClearSavedMusic(void);
void __attribute__((long_call)) Overworld_ChangeMusicTo(u16 song);
void __attribute__((long_call)) Overworld_PlaySpecialMapMusic(void);
void __attribute__((long_call)) SetPlayerAvatarTransitionFlags(u16 transitionFlags);
bool8 __attribute__((long_call)) IsMapTypeIndoors(u8 mapType);

//FireRed's warp layout (CFRU's struct WarpEvent names the fields differently)
struct CourierWarp
{
	s16 x, y;
	u8 elevation;
	u8 warpId;
	u8 mapNum;
	u8 mapGroup;
};

bool8 IsCourierQuestActive(void)
{
	return VarGet(VAR_COURIER_STATE) == COURIER_STATE_DELIVERING;
}

static u32 GetStepsLeft(void)
{
	u32 start = VarGet(VAR_COURIER_START_STEPS) | (VarGet(VAR_COURIER_START_STEPS + 1) << 16);
	u32 walked = GetGameStat(GAME_STAT_STEPS) - start;
	return (walked >= COURIER_QUEST_MAX_STEPS) ? 0 : COURIER_QUEST_MAX_STEPS - walked;
}

//[BUFFER1] = the step limit, for the officer's explanation
void CourierQuest_BufferMaxSteps(void)
{
	ConvertIntToDecimalStringN(gStringVar1, COURIER_QUEST_MAX_STEPS, STR_CONV_MODE_LEFT_ALIGN, 4);
}

//The officer hands over the parcel: on Rapidash, with the bike music, and the clock starts
void CourierQuest_Start(void)
{
	u32 steps = GetGameStat(GAME_STAT_STEPS);

	VarSet(VAR_COURIER_STATE, COURIER_STATE_DELIVERING);
	VarSet(VAR_COURIER_START_STEPS, steps & 0xFFFF);
	VarSet(VAR_COURIER_START_STEPS + 1, steps >> 16);
	FlagSet(FLAG_CUT_TREES_TEMP);

	SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_MACH_BIKE);
	Overworld_SetSavedMusic(BGM_CYCLING);
	Overworld_ChangeMusicTo(BGM_CYCLING);
	VarSet(VAR_SKY_MOUNT, COURIER_QUEST_MOUNT);
	SkyMount_Start(); //After the bike, which gave the player the bike sprite
}

//Off Rapidash, back to walking and the map's music
static void GetOffRapidash(void)
{
	SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
	SkyMount_End();
	Overworld_ClearSavedMusic();
	Overworld_PlaySpecialMapMusic();
}

//Given up or too late: the quest can be started again from the officer
void CourierQuest_Cancel(void)
{
	GetOffRapidash();
	VarSet(VAR_COURIER_STATE, COURIER_STATE_NONE);
}

//The parcel reached the scientist: the officer gives the reward next time
void CourierQuest_Deliver(void)
{
	GetOffRapidash();
	VarSet(VAR_COURIER_STATE, COURIER_STATE_DELIVERED);
}

//Called on every map load (RunOnTransitionMapScript), after the game cleared the temporary flags and the saved music
void CourierQuest_OnMapLoad(void)
{
	if (IsCourierQuestActive())
	{
		FlagSet(FLAG_CUT_TREES_TEMP); //Cut trees stay cut for the whole delivery
		Overworld_SetSavedMusic(BGM_CYCLING); //So the bike music comes back after a battle on this map
	}
}

//Called after every step (TryStartStepCountScript): a script to run, or NULL
const u8* CourierQuest_OnStep(void)
{
	u32 left;

	if (!IsCourierQuestActive())
		return NULL;

	left = GetStepsLeft();
	if (left == 0)
		return EventScript_CourierQuest_TooLate;

	if (left == COURIER_QUEST_WARNING_1 || left == COURIER_QUEST_WARNING_2)
	{
		ConvertIntToDecimalStringN(gStringVar1, left, STR_CONV_MODE_LEFT_ALIGN, 4);
		return EventScript_CourierQuest_Warning;
	}

	return NULL;
}

//Called when the player presses B or Select on the field: TRUE if the question was asked instead
bool8 CourierQuest_TryAskQuit(void)
{
	if (!IsCourierQuestActive())
		return FALSE;

	ScriptContext1_SetupScript(EventScript_CourierQuest_AskQuit);
	return TRUE;
}

//Called by FireRed's warp lookup (hook at 0x806DC30) for doors, stairs and warp tiles.
//TRUE stops a warp into a building while delivering, and asks whether to give up instead.
bool8 CourierQuest_IsWarpBlocked(const struct MapHeader* mapHeader, const struct MapPosition* position)
{
	const struct CourierWarp* warps;
	const struct MapHeader* target;

	if (!IsCourierQuestActive())
		return FALSE;

	warps = (const struct CourierWarp*) mapHeader->events->warps;
	for (u32 i = 0; i < mapHeader->events->warpCount; ++i)
	{
		const struct CourierWarp* warp = &warps[i];

		if (warp->x != position->x - 7 || warp->y != position->y - 7)
			continue;
		if (warp->elevation != (u8) position->height && warp->elevation != 0)
			continue;
		if (warp->mapNum == 0x7F) //Dynamic warp: back to where the player came from, never a building here
			return FALSE;

		target = Overworld_GetMapHeaderByGroupAndId(warp->mapGroup, warp->mapNum);
		if (target == NULL || !IsMapTypeIndoors(target->mapType))
			return FALSE;

		ScriptContext1_SetupScript(EventScript_CourierQuest_AskQuitIndoor);
		return TRUE;
	}

	return FALSE;
}

#else

bool8 IsCourierQuestActive(void) { return FALSE; }
void CourierQuest_OnMapLoad(void) {}
const u8* CourierQuest_OnStep(void) { return NULL; }
bool8 CourierQuest_TryAskQuit(void) { return FALSE; }

#endif
