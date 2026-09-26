#include "defines.h"
#include "../include/event_object_movement.h"
#include "../include/field_door.h"
#include "../include/field_effect.h"
#include "../include/field_player_avatar.h"
#include "../include/field_screen_effect.h"
#include "../include/field_weather.h"
#include "../include/fieldmap.h"
#include "../include/fldeff_misc.h"
#include "../include/item.h"
#include "../include/metatile_behavior.h"
#include "../include/overworld.h"
#include "../include/pokemon.h"
#include "../include/script.h"
#include "../include/constants/event_object_movement_constants.h"
#include "../include/constants/event_objects.h"
#include "../include/constants/songs.h"
#include "../include/constants/species.h"

#include "../include/new/character_customization.h"
#include "../include/new/item.h"
#include "../include/new/follow_me.h"
#include "../include/new/frontier.h"
#include "../include/new/util.h"
#include "../include/new/overworld.h"

/**
 * \file follow_me.c
 * \brief Functions for NPCs following the player.
 */

//This file's functions:
static u8 GetFollowerMapObjId(void);
static u16 GetFollowerSprite(void);
static void TryUpdateFollowerSpriteUnderwater(void);
static void Task_ReallowPlayerMovement(u8 taskId);
static u8 DetermineFollowerDirection(struct EventObject* player, struct EventObject* follower);
static void PlayerLogCoordinates(struct EventObject* player);
static u8 DetermineFollowerState(struct EventObject* follower, u8 state, u8 direction);
static bool8 IsStateMovement(u8 state);
static bool8 PlayerIsUnderAndFacingWaterfall(void);
static u8 ReturnFollowerDelayedState(u8 direction);
static void SetSurfJump(void);
static void Task_BindSurfBlobToFollower(u8 taskId);
static void SetUpSurfBlobFieldEffect(struct EventObject* npc);
static void SetSurfDismount(void);
static void Task_FinishSurfDismount(u8 taskId);
static void Task_FollowerOutOfDoor(u8 taskId);
static void Task_FollowerHandleIndoorStairs(u8 taskId);
static void Task_FollowerHandleEscalator(u8 taskId);
static void Task_FollowerHandleEscalatorFinish(u8 taskId);
static void CalculateFollowerEscalatorTrajectoryUp(struct Task *task);
static void CalculateFollowerEscalatorTrajectoryDown(struct Task *task);
static void SetFollowerSprite(u8 spriteIndex);
static void GetFollowerTemplate(struct EventObjectTemplate* template);
static void SpawnFollowerAvatar(void);
static bool8 IsFollowerMon(void);
static u16 GetFollowerMonGfxIdFromParty(void);
static void SetUpFollowerMonState(u16 gfxId);
static void RemoveFollowerMon(void);
static void TurnNPCIntoFollower(u8 localId, u8 followerFlags);

#define MOVEMENT_INVALID 0xFE

#define FOLLOWER_MON_MAP_GROUP 0xFF //Stored in gFollowerState.map.group to mark a follower created at runtime (has no map template)
#define FOLLOWER_MON_NONE 0xFFFF
#define FOLLOWER_MON_FLAGS (FOLLOWER_FLAG_CAN_BIKE | FOLLOWER_FLAG_CAN_LEAVE_ROUTE | FOLLOWER_FLAG_CAN_SURF | FOLLOWER_FLAG_CAN_WATERFALL \
						  | FOLLOWER_FLAG_CAN_DIVE | FOLLOWER_FLAG_CAN_ROCK_CLIMB)

extern const u8 EventScript_FollowerMon[];

enum
{
	FOLLOWER_SPRITE_INDEX_NORMAL,
	FOLLOWER_SPRITE_INDEX_BIKE,
	FOLLOWER_SPRITE_INDEX_SURF,
	FOLLOWER_SPRITE_INDEX_UNDERWATER,
};

enum
{
	SURF_BLOB_STATE_NONE,
	SURF_BLOB_STATE_GET_ON,
	SURF_BLOB_STATE_ON,
	SURF_BLOB_STATE_GET_OFF,
	SURF_BLOB_STATE_HIDDEN_ON,
};

struct FollowerSprites
{
	u16 normalId;
	u16 bikeId;
	u16 surfId;
	u16 underwaterId;
};

static const struct FollowerSprites gFollowerAlternateSprites[] =
{
	//FORMAT:
	//{WALKING/RUNNING SPRITE ID, BIKING SPRITE ID, SURFING SPRITE ID},
	//EXAMPLE: {MALE PLAYER WALKING, MALE PLAYER BIKING, MALE PLAYER SURFING},
	{0, 1, 2, 2},

	#ifdef UNBOUND
	{EVENT_OBJ_GFX_JOGGER, EVENT_OBJ_GFX_CYCLIST_M, EVENT_OBJ_GFX_SWIMMER_M, EVENT_OBJ_GFX_SWIMMER_F}, //For debugging
	{EVENT_OBJ_GFX_COLLECTOR, EVENT_OBJ_GFX_CYCLIST_M, EVENT_OBJ_GFX_SWIMMER_M, EVENT_OBJ_GFX_SWIMMER_F}, //For debugging
	#endif
};

struct FollowerMon
{
	u16 species;
	u16 gfxId;
};

//Pokemon that follow the player when FLAG_FOLLOWER_POKEMON is set.
//The first party member found in this table is the one that follows.
static const struct FollowerMon sFollowerMons[] =
{
	{SPECIES_AXEW,    111}, //NPC111
	{SPECIES_FRAXURE, 111}, //Placeholder until its own sprite is made
	{SPECIES_HAXORUS, 111}, //Placeholder until its own sprite is made
};

//General Utility
u8 GetFollowerObjectId(void)
{
	if (!gFollowerState.inProgress)
		return EVENT_OBJECTS_COUNT;

	return gFollowerState.objId;
}

u8 GetFollowerLocalId(void)
{
	if (!gFollowerState.inProgress)
		return 0;

	return gEventObjects[gFollowerState.objId].localId;
}

const u8* GetFollowerScriptPointer(void)
{
	if (!gFollowerState.inProgress)
		return NULL;

	return gFollowerState.script;
}

void HideFollower(void)
{
	if (!gFollowerState.inProgress)
		return;

	if (gFollowerState.createSurfBlob == SURF_BLOB_STATE_ON || gFollowerState.createSurfBlob == SURF_BLOB_STATE_GET_OFF)
	{
		BindFieldEffectToSprite(gEventObjects[GetFollowerMapObjId()].fieldEffectSpriteId, 2);
		DestroySprite(&gSprites[gEventObjects[GetFollowerMapObjId()].fieldEffectSpriteId]);
		gEventObjects[GetFollowerMapObjId()].fieldEffectSpriteId = 0; //Unbind
		gFollowerState.createSurfBlob = SURF_BLOB_STATE_HIDDEN_ON;
	}

	gEventObjects[GetFollowerMapObjId()].invisible = TRUE;
}

void IsFollowerStoppingRockClimb(void)
{
	gSpecialVar_LastResult = FALSE;
	if (!gFollowerState.inProgress)
		return;

	gSpecialVar_LastResult = (gFollowerState.flags & FOLLOWER_FLAG_CAN_ROCK_CLIMB) == 0;
}

void FollowMe_SetIndicatorToComeOutDoor(void)
{
	if (gFollowerState.inProgress)
		gFollowerState.comeOutDoorStairs = 1;
}

void FollowMe_SetIndicatorToRecreateSurfBlob(void)
{
	if (gFollowerState.inProgress)
		gFollowerState.createSurfBlob = SURF_BLOB_STATE_HIDDEN_ON;
}

void FollowMe_TryRemoveFollowerOnWhiteOut(void)
{
	if (gFollowerState.inProgress)
	{
		if (gFollowerState.flags & FOLLOWER_FLAG_CLEAR_ON_WHITE_OUT)
			gFollowerState.inProgress = FALSE;
	}
}

static u8 GetFollowerMapObjId(void)
{
	return gFollowerState.objId;
}

static u16 GetFollowerSprite(void)
{
	switch (gFollowerState.currentSprite) {
		case FOLLOWER_SPRITE_INDEX_BIKE:
			for (u32 i = 0; i < ARRAY_COUNT(gFollowerAlternateSprites); ++i)
			{
				if (gFollowerAlternateSprites[i].normalId == gFollowerState.gfxId)
					return gFollowerAlternateSprites[i].bikeId;
			}
			break;
		case FOLLOWER_SPRITE_INDEX_SURF:
			for (u32 i = 0; i < ARRAY_COUNT(gFollowerAlternateSprites); ++i)
			{
				if (gFollowerAlternateSprites[i].normalId == gFollowerState.gfxId)
					return gFollowerAlternateSprites[i].surfId;
			}
			break;
		case FOLLOWER_SPRITE_INDEX_UNDERWATER:
			for (u32 i = 0; i < ARRAY_COUNT(gFollowerAlternateSprites); ++i)
			{
				if (gFollowerAlternateSprites[i].normalId == gFollowerState.gfxId)
					return gFollowerAlternateSprites[i].underwaterId;
			}
			break;
	}

	return gFollowerState.gfxId;
}

static void TryUpdateFollowerSpriteUnderwater(void)
{
	if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && gFollowerState.inProgress)
	{
		struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
		SetFollowerSprite(FOLLOWER_SPRITE_INDEX_UNDERWATER);

		follower = &gEventObjects[GetFollowerMapObjId()]; //Can change on reload sprite
		follower->fieldEffectSpriteId = DoBobbingFieldEffect(follower->spriteId);
	}
}

//Hooked in: the follower always takes the player's elevation, so it's never drawn
//over the player when they're on tiles of different heights (eg. going down a slope)
void EventObjectUpdateZCoord(struct EventObject* eventObj)
{
	if (gFollowerState.inProgress
	&& eventObj == &gEventObjects[GetFollowerMapObjId()]
	&& eventObj->localId == gFollowerState.map.id)
	{
		struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
		eventObj->currentElevation = player->currentElevation;
		eventObj->elevation = player->elevation;
		return;
	}

	//Vanilla
	u8 currElevation = MapGridGetZCoordAt(eventObj->currentCoords.x, eventObj->currentCoords.y);
	u8 prevElevation = MapGridGetZCoordAt(eventObj->previousCoords.x, eventObj->previousCoords.y);

	if (currElevation == 0xF || prevElevation == 0xF)
		return;

	eventObj->currentElevation = currElevation;

	if (currElevation != 0 && currElevation != 0xF)
		eventObj->elevation = currElevation;
}

//Sideways stairs patch in the ROM: on tile behaviours 0xB0-0xB5, left/right steps are replaced by
//the patch's movement actions 0xAA-0xB5. These move the NPC diagonally based on the tile it's standing on.
#define MB_SIDEWAYS_STAIRS_FIRST 0xB0
#define MB_SIDEWAYS_STAIRS_LAST 0xB5

enum
{
	SIDEWAYS_STAIRS_SPEED_WALK,
	SIDEWAYS_STAIRS_SPEED_FAST, //Bike, or running without running frames
	SIDEWAYS_STAIRS_SPEED_RUN,
	SIDEWAYS_STAIRS_SPEED_COUNT,
};

//Copy of the patch's table: [speed][tile behaviour - 0xB0] = {left action, right action}
//0 means the step is straight on that tile
static const u8 sSidewaysStairsActions[SIDEWAYS_STAIRS_SPEED_COUNT][MB_SIDEWAYS_STAIRS_LAST - MB_SIDEWAYS_STAIRS_FIRST + 1][2] =
{
	[SIDEWAYS_STAIRS_SPEED_WALK] = {{0xAC, 0xAB}, {0xAC, 0}, {0, 0xAB}, {0xAA, 0xAD}, {0, 0xAD}, {0xAA, 0}},
	[SIDEWAYS_STAIRS_SPEED_FAST] = {{0xB4, 0xB3}, {0xB4, 0}, {0, 0xB3}, {0xB2, 0xB5}, {0, 0xB5}, {0xB2, 0}},
	[SIDEWAYS_STAIRS_SPEED_RUN]  = {{0xB1, 0xAF}, {0xB1, 0}, {0, 0xAF}, {0xAE, 0xB0}, {0, 0xB0}, {0xAE, 0}},
};

//Turns the player's sideways stairs action into the regular action of the same speed
static u8 SidewaysStairsActionToRegularAction(u8 state)
{
	switch (state) {
		case 0xAA ... 0xAD:
			return MOVEMENT_ACTION_WALK_NORMAL_LEFT;
		case 0xAE ... 0xB1:
			return MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_LEFT; //Running
		case 0xB2 ... 0xB5:
			return MOVEMENT_ACTION_SLIDE_SLOW_LEFT; //Bike
	}

	return state;
}

//The follower steps on the same tiles the player did, so picking the action from its own tile
//makes it go diagonally exactly where the player did
static u8 GetFollowerSidewaysStairsAction(struct EventObject* follower, u8 newState)
{
	u8 speed, isRight;
	u8 behaviour = follower->currentMetatileBehavior;

	if (behaviour < MB_SIDEWAYS_STAIRS_FIRST || behaviour > MB_SIDEWAYS_STAIRS_LAST)
		return newState;

	switch (newState) {
		case MOVEMENT_ACTION_WALK_NORMAL_LEFT:
		case MOVEMENT_ACTION_WALK_NORMAL_RIGHT:
			speed = SIDEWAYS_STAIRS_SPEED_WALK;
			isRight = newState == MOVEMENT_ACTION_WALK_NORMAL_RIGHT;
			break;
		case MOVEMENT_ACTION_WALK_FAST_LEFT:
		case MOVEMENT_ACTION_WALK_FAST_RIGHT:
			speed = SIDEWAYS_STAIRS_SPEED_FAST;
			isRight = newState == MOVEMENT_ACTION_WALK_FAST_RIGHT;
			break;
		case MOVEMENT_ACTION_SLIDE_SLOW_LEFT:
		case MOVEMENT_ACTION_SLIDE_SLOW_RIGHT:
			speed = SIDEWAYS_STAIRS_SPEED_FAST; //The patch slows the bike down on stairs
			isRight = newState == MOVEMENT_ACTION_SLIDE_SLOW_RIGHT;
			break;
		case MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_LEFT: //Only used when the follower has running frames
		case MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_RIGHT:
			speed = SIDEWAYS_STAIRS_SPEED_RUN;
			isRight = newState == MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_RIGHT;
			break;
		default:
			return newState; //Not a left/right step
	}

	u8 stairsAction = sSidewaysStairsActions[speed][behaviour - MB_SIDEWAYS_STAIRS_FIRST][isRight];
	return stairsAction != 0 ? stairsAction : newState;
}

//Actual Follow Me
void FollowMe(struct EventObject* npc, u8 state, bool8 ignoreScriptActive)
{
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];

	if (player != npc) //Only when the player moves
		return;

	if (!gFollowerState.inProgress)
		return;

	if (ScriptContext2_IsEnabled() && !ignoreScriptActive)
		return; //Don't follow during a script

	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	state = SidewaysStairsActionToRegularAction(state); //The follower picks its own stairs action below

	//Check if state would cause hidden follower to reappear
	if (IsStateMovement(state) && gFollowerState.warpEnd)
	{
		gFollowerState.warpEnd = 0;

		if (gFollowerState.comeOutDoorStairs == 1)
		{
			gPlayerAvatar->preventStep = TRUE;
			u8 taskId = CreateTask(Task_FollowerOutOfDoor, 1);
			gTasks[taskId].data[0] = 0;
			gTasks[taskId].data[2] = follower->currentCoords.x;
			gTasks[taskId].data[3] = follower->currentCoords.y;
			goto RESET;
		}
		else if (gFollowerState.comeOutDoorStairs == 2)
			gFollowerState.comeOutDoorStairs = FALSE;

		follower->invisible = FALSE;
		MoveEventObjectToMapCoords(follower, player->currentCoords.x, player->currentCoords.y);
		EventObjectTurn(follower, player->facingDirection); //The follower should be facing the same direction as the player when it comes out of hiding

		if (gFollowerState.createSurfBlob == SURF_BLOB_STATE_ON || gFollowerState.createSurfBlob == SURF_BLOB_STATE_HIDDEN_ON) //Recreate surf blob
		{
			gFollowerState.createSurfBlob = SURF_BLOB_STATE_ON; //Get rid of hidden
			SetUpSurfBlobFieldEffect(follower);
			follower->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
			BindFieldEffectToSprite(follower->fieldEffectSpriteId, 1);
		}
		else
			TryUpdateFollowerSpriteUnderwater();
	}

	u8 dir = DetermineFollowerDirection(player, follower);

	if (dir == DIR_NONE)
		goto RESET;

	u8 newState = DetermineFollowerState(follower, state, dir);

	if (newState == MOVEMENT_INVALID)
		goto RESET;

	newState = GetFollowerSidewaysStairsAction(follower, newState);

	if (gFollowerState.createSurfBlob == SURF_BLOB_STATE_GET_ON) //Get on Surf Blob
	{
		gFollowerState.createSurfBlob = SURF_BLOB_STATE_ON;
		gPlayerAvatar->preventStep = TRUE; //Wait for finish
		SetSurfJump();
		goto RESET;
	}
	else if (gFollowerState.createSurfBlob == SURF_BLOB_STATE_GET_OFF) //Get off Surf Blob
	{
		gFollowerState.createSurfBlob = 0;
		gPlayerAvatar->preventStep = TRUE; //Wait for finish
		SetSurfDismount();
		goto RESET;
	}

	EventObjectClearHeldMovementIfActive(follower);
	EventObjectSetHeldMovement(follower, newState);
	PlayerLogCoordinates(player);

	*((u8*) 0x2023D6C) = newState;

	switch (newState) {
		case MOVEMENT_ACTION_JUMP_2_DOWN ... MOVEMENT_ACTION_JUMP_2_RIGHT:
		case 0x84 ... 0x87:
		case MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_NORMAL_RIGHT_UP_FACE_RIGHT:
		case MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_RUN_RIGHT_UP_FACE_RIGHT:
		case MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT:
		case 0xAA ... 0xB5: //Sideways stairs patch: slower than a regular step, so the player's next step would cut it off halfway
			CreateTask(Task_ReallowPlayerMovement, 1); //Synchronize movements on stairs and ledges
			gPlayerAvatar->preventStep = TRUE;
	}

RESET:
	EventObjectClearHeldMovementIfFinished(follower);
}

static void Task_ReallowPlayerMovement(u8 taskId)
{
	bool8 animStatus = EventObjectClearHeldMovementIfFinished(&gEventObjects[GetFollowerMapObjId()]);
	if (animStatus == 0)
	{
		if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH)
		&& EventObjectClearHeldMovementIfFinished(&gEventObjects[gPlayerAvatar->eventObjectId]))
			SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT); //Temporarily stop running
		return;
	}

	gPlayerAvatar->preventStep = FALSE;
	DestroyTask(taskId);
}

static u8 DetermineFollowerDirection(struct EventObject* player, struct EventObject* follower)
{
	//Move the follower towards the player
	s8 delta_x = follower->currentCoords.x - player->currentCoords.x;
	s8 delta_y = follower->currentCoords.y - player->currentCoords.y;

	if (delta_x < 0)
		return DIR_EAST;
	else if (delta_x > 0)
		return DIR_WEST;

	if (delta_y < 0)
		return DIR_SOUTH;
	else if (delta_y > 0)
		return DIR_NORTH;

	return DIR_NONE;
}

static void PlayerLogCoordinates(struct EventObject* player)
{
	gFollowerState.log.x = player->currentCoords.x;
	gFollowerState.log.y = player->currentCoords.y;
}

#define RETURN_STATE(state, dir) return newState == MOVEMENT_INVALID ? state + (dir - 1) : ReturnFollowerDelayedState(dir - 1);

static u8 DetermineFollowerState(struct EventObject* follower, u8 state, u8 direction)
{
	u8 newState = MOVEMENT_INVALID;

	if (IsStateMovement(state) && gFollowerState.delayedState)
		newState = gFollowerState.delayedState + direction;

	*((u8*) 0x2023D6B) = state; //For Debug

	//Clear ice tile stuff
	follower->disableAnim = FALSE; //follower->field1 &= 0xFB;

	switch (state) {
		case MOVEMENT_ACTION_WALK_SLOWEST_DOWN ... MOVEMENT_ACTION_WALK_SLOWEST_RIGHT:
			// Slow walk
			RETURN_STATE(MOVEMENT_ACTION_WALK_SLOWEST_DOWN, direction);

		case MOVEMENT_ACTION_WALK_SLOW_DOWN ... MOVEMENT_ACTION_WALK_SLOW_RIGHT:
			// Slow slow
			RETURN_STATE(MOVEMENT_ACTION_WALK_SLOW_DOWN, direction);

		case MOVEMENT_ACTION_WALK_NORMAL_DOWN ... MOVEMENT_ACTION_WALK_NORMAL_RIGHT:
			// Normal walk
			RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);

		case MOVEMENT_ACTION_JUMP_2_DOWN ... MOVEMENT_ACTION_JUMP_2_RIGHT:
			// Ledge jump
			if (((newState - direction) >= MOVEMENT_ACTION_JUMP_2_DOWN && (newState - direction) <= MOVEMENT_ACTION_JUMP_2_RIGHT)
			||  ((newState - direction) >= 0x84 && (newState - direction) <= 0x87)) //Previously jumped
			{
				newState = MOVEMENT_INVALID;
				RETURN_STATE(MOVEMENT_ACTION_JUMP_2_DOWN, direction); //Jump right away
			}

			gFollowerState.delayedState = MOVEMENT_ACTION_JUMP_2_DOWN;
			RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);

		case MOVEMENT_ACTION_WALK_FAST_DOWN ... MOVEMENT_ACTION_WALK_FAST_RIGHT:
			if (PlayerIsUnderAndFacingWaterfall())
				return MOVEMENT_INVALID;
			 //Handle ice tile (some walking animation)
			 //Set a bit to freeze the follower's animation
			if (MetatileBehavior_IsSlidingIce(follower->currentMetatileBehavior)
			||  MetatileBehavior_IsSlideAround(follower->currentMetatileBehavior))
				follower->disableAnim = TRUE;
			RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

		case MOVEMENT_ACTION_SLIDE_SLOW_DOWN ... MOVEMENT_ACTION_SLIDE_SLOW_RIGHT:
			if (PlayerIsUnderAndFacingWaterfall())
				return MOVEMENT_INVALID;
			//Slow slide or Bike Speed or Waterfall
			RETURN_STATE(MOVEMENT_ACTION_SLIDE_SLOW_DOWN, direction);

		case MOVEMENT_ACTION_SLIDE_DOWN ... MOVEMENT_ACTION_SLIDE_RIGHT:
			//Slide
			RETURN_STATE(MOVEMENT_ACTION_SLIDE_DOWN, direction);

		case MOVEMENT_ACTION_SLIDE_FAST_DOWN ... MOVEMENT_ACTION_SLIDE_FAST_DOWN:
			//Slide Fast
			RETURN_STATE(MOVEMENT_ACTION_SLIDE_FAST_DOWN, direction);

		case MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_DOWN ... MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_RIGHT:
			//Running frames
			if (gFollowerState.flags & FOLLOWER_FLAG_HAS_RUNNING_FRAMES)
				RETURN_STATE(MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_DOWN, direction);

			RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);


		case MOVEMENT_ACTION_SLIDE_LEFT_FOOT_DOWN ... MOVEMENT_ACTION_SLIDE_LEFT_FOOT_RIGHT:
			//Stairs (slow walking)
			if (gFollowerState.flags & FOLLOWER_FLAG_HAS_RUNNING_FRAMES)
			{
				//Running sideways on stairs does not use the slow
				//frames, so split this into two.
				if (direction <= DIR_NORTH)
				{
					RETURN_STATE(MOVEMENT_ACTION_SLIDE_LEFT_FOOT_DOWN, direction);
				}
				else
				{
					RETURN_STATE(MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_DOWN, direction);
				}
			}
			else
			{
				RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);
			}

		case MOVEMENT_ACTION_JUMP_SPECIAL_DOWN ... MOVEMENT_ACTION_JUMP_SPECIAL_RIGHT:
			gFollowerState.delayedState = MOVEMENT_ACTION_JUMP_SPECIAL_DOWN;
			RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);

		case MOVEMENT_ACTION_JUMP_DOWN ... MOVEMENT_ACTION_JUMP_RIGHT:
			gFollowerState.delayedState = MOVEMENT_ACTION_JUMP_DOWN;
			RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction);

		case 0x84 ... 0x87: ;
			//Ledge run
			if (((newState - direction) >= MOVEMENT_ACTION_JUMP_2_DOWN && (newState - direction) <= MOVEMENT_ACTION_JUMP_2_RIGHT)
			||  ((newState - direction) >= 0x84 && (newState - direction) <= 0x87)) //Previously jumped
			{
				newState = MOVEMENT_INVALID;
				if (gFollowerState.flags & FOLLOWER_FLAG_HAS_RUNNING_FRAMES)
				{
					RETURN_STATE(0x84, direction); //Jump right away
				}
				else
				{
					RETURN_STATE(MOVEMENT_ACTION_JUMP_2_DOWN, direction); //Jump right away
				}
			}

			if (gFollowerState.flags & FOLLOWER_FLAG_HAS_RUNNING_FRAMES)
				gFollowerState.delayedState = 0x84;
			else
				gFollowerState.delayedState = MOVEMENT_ACTION_JUMP_2_DOWN;

			if (gFollowerState.flags & FOLLOWER_FLAG_HAS_RUNNING_FRAMES)
				RETURN_STATE(MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_DOWN, direction);

			RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

		case MOVEMENT_ACTION_SPIN_PAD_DOWN ... MOVEMENT_ACTION_SPIN_PAD_RIGHT:
			//Warp pad spinning movement
			if (newState == state + direction)
			{
				newState = MOVEMENT_INVALID;
				RETURN_STATE(MOVEMENT_ACTION_SPIN_PAD_DOWN, direction);
			}

			gFollowerState.delayedState = MOVEMENT_ACTION_SPIN_PAD_DOWN;
			RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction);

		case MOVEMENT_ACTION_WALK_SLOWEST_UP_BACKWARDS ... MOVEMENT_ACTION_WALK_SLOWEST_LEFT_BACKWARDS:
			RETURN_STATE(MOVEMENT_ACTION_WALK_SLOWEST_UP_BACKWARDS, direction);

		case MOVEMENT_ACTION_WALK_SLOW_UP_BACKWARDS ... MOVEMENT_ACTION_WALK_SLOW_LEFT_BACKWARDS:
			RETURN_STATE(MOVEMENT_ACTION_WALK_SLOW_UP_BACKWARDS, direction);

		case MOVEMENT_ACTION_WALK_NORMAL_UP_BACKWARDS ... MOVEMENT_ACTION_WALK_NORMAL_LEFT_BACKWARDS:
			RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_UP_BACKWARDS, direction);

		case MOVEMENT_ACTION_WALK_FAST_UP_BACKWARDS ... MOVEMENT_ACTION_WALK_FAST_LEFT_BACKWARDS:
			RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_UP_BACKWARDS, direction);

		case MOVEMENT_ACTION_JUMP_2_UP_BACKWARDS ... MOVEMENT_ACTION_JUMP_2_LEFT_BACKWARDS:
			RETURN_STATE(MOVEMENT_ACTION_JUMP_2_UP_BACKWARDS, direction);

		case MOVEMENT_ACTION_JUMP_UP_BACKWARDS ... MOVEMENT_ACTION_JUMP_LEFT_BACKWARDS:
			RETURN_STATE(MOVEMENT_ACTION_JUMP_UP_BACKWARDS, direction);

		case MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_NORMAL_RIGHT_UP_FACE_RIGHT:
			//Walk up/down side stairs
			if (newState == state + direction) //Still walking up/down stairs same direction
			{
				newState = MOVEMENT_INVALID;
				RETURN_STATE(state, 1); //Each is its own movement
			}
			else if (newState - direction >= MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN
			&&  newState - direction <= MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT) //Change direction on stairs
			{
				gFollowerState.delayedState = state;

				//Get new state but at different speed
				newState -= direction;
				u8 simpleState = MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN;
				switch (newState) {
					case MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_NORMAL_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
					case MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_RUN_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
					case MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
				}

				newState = MOVEMENT_INVALID;
				RETURN_STATE(state, 1); //Each is its own movement
			}

			//Beginning on stairs
			gFollowerState.delayedState = state;
			RETURN_STATE(MOVEMENT_ACTION_WALK_NORMAL_DOWN, direction); //Each is its own movement

		case MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_RUN_RIGHT_UP_FACE_RIGHT: ;
			//Run up/down side stairs
			u8 delayState;
			u8 simpleState;
			u8 action;

			if (gFollowerState.flags & FOLLOWER_FLAG_HAS_RUNNING_FRAMES)
			{
				delayState = state;
				simpleState = MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN;
				action = MOVEMENT_ACTION_SLIDE_RIGHT_FOOT_DOWN;
			}
			else
			{
				delayState = (state - MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN) + MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN;
				simpleState = MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN;
				action = MOVEMENT_ACTION_WALK_FAST_DOWN;
			}

			if (newState == state + direction)
			{
				newState = MOVEMENT_INVALID;
				RETURN_STATE(delayState, 1); //Each is its own movement
			}
			else if (newState - direction >= MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN
			&&  newState - direction <= MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT)
			{
				newState -= direction;
				switch (newState) {
					case MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_NORMAL_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
					case MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_RUN_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
					case MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
				}

				gFollowerState.delayedState = delayState;
				newState = MOVEMENT_INVALID;
				RETURN_STATE(state, 1); //Each is its own movement
			}

			gFollowerState.delayedState = delayState;
			RETURN_STATE(action, direction); //Each is its own movement

		case MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT: ;
			//Bike up/down side stairs
			if (newState == state + direction)
			{
				newState = MOVEMENT_INVALID;
				RETURN_STATE(state, 1); //Each is its own movement
			}
			else if (newState - direction >= MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN
			&&  newState - direction <= MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT)
			{
				gFollowerState.delayedState = state;

				newState -= direction;
				u8 simpleState = MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN;
				switch (newState) {
					case MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_NORMAL_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
					case MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_RUN_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
					case MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT:
						state = (newState - MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN) + simpleState;
						break;
				}

				newState = MOVEMENT_INVALID;
				RETURN_STATE(state, 1); //Each is its own movement
			}

			gFollowerState.delayedState = state;
			RETURN_STATE(MOVEMENT_ACTION_WALK_FAST_DOWN, direction); //Each is its own movement

		default:
			return MOVEMENT_INVALID;
	}

	return newState;
}

static bool8 IsStateMovement(u8 state)
{
	switch (state) {
		case MOVEMENT_ACTION_FACE_DOWN:
		case MOVEMENT_ACTION_FACE_UP:
		case MOVEMENT_ACTION_FACE_LEFT:
		case MOVEMENT_ACTION_FACE_RIGHT:
		case MOVEMENT_ACTION_FACE_DOWN_FAST:
		case MOVEMENT_ACTION_FACE_UP_FAST:
		case MOVEMENT_ACTION_FACE_LEFT_FAST:
		case MOVEMENT_ACTION_FACE_RIGHT_FAST:
		case MOVEMENT_ACTION_DELAY_1:
		case MOVEMENT_ACTION_DELAY_2:
		case MOVEMENT_ACTION_DELAY_4:
		case MOVEMENT_ACTION_DELAY_8:
		case MOVEMENT_ACTION_DELAY_16:
		case MOVEMENT_ACTION_FACE_PLAYER:
		case MOVEMENT_ACTION_FACE_AWAY_PLAYER:
		case MOVEMENT_ACTION_LOCK_FACING_DIRECTION:
		case MOVEMENT_ACTION_UNLOCK_FACING_DIRECTION:
		case MOVEMENT_ACTION_SET_INVISIBLE:
		case MOVEMENT_ACTION_SET_VISIBLE:
		case MOVEMENT_ACTION_EMOTE_EXCLAMATION_MARK:
		case MOVEMENT_ACTION_EMOTE_QUESTION_MARK:
		case MOVEMENT_ACTION_EMOTE_CROSS:
		case MOVEMENT_ACTION_EMOTE_DOUBLE_EXCLAMATION_MARK:
		case MOVEMENT_ACTION_EMOTE_HAPPY:
		case MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_DOWN:
		case MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_UP:
		case MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_LEFT:
		case MOVEMENT_ACTION_WALK_IN_PLACE_NORMAL_RIGHT:
		case MOVEMENT_ACTION_WALK_IN_PLACE_FAST_DOWN:
		case MOVEMENT_ACTION_WALK_IN_PLACE_FAST_UP:
		case MOVEMENT_ACTION_WALK_IN_PLACE_FAST_LEFT:
		case MOVEMENT_ACTION_WALK_IN_PLACE_FAST_RIGHT:
		case MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_DOWN:
		case MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_UP:
		case MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_LEFT:
		case MOVEMENT_ACTION_WALK_IN_PLACE_FASTEST_RIGHT:
		case MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN:
		case MOVEMENT_ACTION_JUMP_IN_PLACE_UP:
		case MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT:
		case MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT:
		case MOVEMENT_ACTION_JUMP_IN_PLACE_DOWN_UP:
		case MOVEMENT_ACTION_JUMP_IN_PLACE_UP_DOWN:
		case MOVEMENT_ACTION_JUMP_IN_PLACE_LEFT_RIGHT:
		case MOVEMENT_ACTION_JUMP_IN_PLACE_RIGHT_LEFT:
			return FALSE;
	}

	return TRUE;
}

static bool8 PlayerIsUnderAndFacingWaterfall(void)
{
	s16 x, y;
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];

	if (!IsPlayerSurfingNorth())
		return FALSE;

	x = player->currentCoords.x;
	y = player->currentCoords.y;
	MoveCoords(DIR_NORTH, &x, &y);
	if (MetatileBehavior_IsWaterfall(MapGridGetMetatileBehaviorAt(x, y)))
		return TRUE;

	return FALSE;
}

static u8 ReturnFollowerDelayedState(u8 direction)
{
	u8 newState = gFollowerState.delayedState;
	gFollowerState.delayedState = 0;

	switch (newState) {
		case MOVEMENT_ACTION_WALK_NORMAL_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_NORMAL_RIGHT_UP_FACE_RIGHT:
		case MOVEMENT_ACTION_RUN_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_RUN_RIGHT_UP_FACE_RIGHT:
		case MOVEMENT_ACTION_WALK_FAST_LEFT_DOWN_FACE_DOWN ... MOVEMENT_ACTION_WALK_FAST_RIGHT_UP_FACE_RIGHT:
			return newState; //Each its own movement, so don't modify direction
	}

	return newState + direction;
}

#define LEDGE_FRAMES_MULTIPLIER 2

extern void (**stepspeeds[5])(struct Sprite*, u8);
extern const u16 stepspeed_seq_length[5];

void FollowMe_Ledges(struct EventObject* npc, struct Sprite* sprite, u16* ledgeFramesTbl)
{
	u8 speed;

	if (!gFollowerState.inProgress)
		return;

	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];

	if (follower == npc)
		speed = gPlayerAvatar->runningState ? 3 : 1;
	else
		speed = 0;

	//Calculate the frames for the jump
	u16 frameCount = (u16) stepspeed_seq_length[speed] * LEDGE_FRAMES_MULTIPLIER;
	ledgeFramesTbl[sprite->data[4]] = frameCount;

	//Call the step shifter
	u8 currentFrame = sprite->data[6] / LEDGE_FRAMES_MULTIPLIER;
	stepspeeds[speed][currentFrame](sprite, sprite->data[3]);
}

bool8 FollowMe_IsCollisionExempt(struct EventObject* obstacle, struct EventObject* collider)
{
	if (!gFollowerState.inProgress)
		return FALSE;

	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];

	if (obstacle == follower && collider == player)
		return TRUE;

	return FALSE;
}

void FollowMe_FollowerToWater(void)
{
	if (!gFollowerState.inProgress)
		return;

	//Prepare for making the follower do the jump and spawn the surf head
	//right in front of the follower's location.
	FollowMe(&gEventObjects[gPlayerAvatar->eventObjectId], MOVEMENT_ACTION_JUMP_DOWN, TRUE);
	gFollowerState.createSurfBlob = SURF_BLOB_STATE_GET_ON;
}

void FollowMe_BindToSurbBlobOnReloadScreen(void)
{
	if (!gFollowerState.inProgress)
		return;

	TryUpdateFollowerSpriteUnderwater();

	if (gFollowerState.createSurfBlob != SURF_BLOB_STATE_ON && gFollowerState.createSurfBlob != SURF_BLOB_STATE_GET_OFF)
		return;

	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];

	//Spawn surfhead under follower
	SetUpSurfBlobFieldEffect(follower);
	follower->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
	BindFieldEffectToSprite(follower->fieldEffectSpriteId, 1);
}

static void SetSurfJump(void)
{
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];

	//Reset NPC movement bits
	EventObjectClearHeldMovement(follower);

	//Jump animation according to direction
	u8 direction = DetermineFollowerDirection(&gEventObjects[gPlayerAvatar->eventObjectId], follower);
	u8 jumpState = GetJumpMovementAction(direction);
	SetUpSurfBlobFieldEffect(follower);

	//Adjust surf head spawn location infront of follower
	switch (direction) {
		case DIR_SOUTH:
			gFieldEffectArguments[1]++; //effect_y
			break;

		case DIR_NORTH:
			gFieldEffectArguments[1]--;
			break;

		case DIR_WEST:
			gFieldEffectArguments[0]--; //effect_x
			break;

		default: //DIR_EAST
			gFieldEffectArguments[0]++;
	};

	//Execute, store sprite ID in fieldEffectSpriteId and bind surf blob
	follower->fieldEffectSpriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
	CreateTask(Task_BindSurfBlobToFollower, 0x1);
	SetFollowerSprite(FOLLOWER_SPRITE_INDEX_SURF);

	follower = &gEventObjects[GetFollowerMapObjId()];
	EventObjectSetHeldMovement(follower, jumpState);
}

static void Task_BindSurfBlobToFollower(u8 taskId)
{
	struct EventObject* npc = &gEventObjects[GetFollowerMapObjId()];

	//Wait jump animation
	bool8 animStatus = EventObjectClearHeldMovementIfFinished(npc);
	if (animStatus == 0)
		return;

	//Bind objs
	BindFieldEffectToSprite(npc->fieldEffectSpriteId, 0x1);
	UnfreezeEventObjects();
	DestroyTask(taskId);
	gPlayerAvatar->preventStep = FALSE; //Player can move again
	return;
}

static void SetUpSurfBlobFieldEffect(struct EventObject* npc)
{
	//Set up gFieldEffectArguments for execution
	gFieldEffectArguments[0] = npc->currentCoords.x; 	//effect_x
	gFieldEffectArguments[1] = npc->currentCoords.y;	//effect_y
	gFieldEffectArguments[2] = gFollowerState.objId;    //objId
}

void PrepareFollowerDismountSurf(void)
{
	if (!gFollowerState.inProgress)
		return;

	FollowMe(&gEventObjects[gPlayerAvatar->eventObjectId], MOVEMENT_ACTION_WALK_NORMAL_DOWN, TRUE);
	gFollowerState.createSurfBlob = SURF_BLOB_STATE_GET_OFF;
}

static void SetSurfDismount(void)
{
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	EventObjectClearHeldMovement(follower);

	//Jump animation according to direction
	u8 direction = DetermineFollowerDirection(&gEventObjects[gPlayerAvatar->eventObjectId], follower);
	u8 jumpState = GetJumpMovementAction(direction);

	//Unbind and destroy Surf Blob
	u8 task = CreateTask(Task_FinishSurfDismount, 1);
	gTasks[task].data[0] = follower->fieldEffectSpriteId;
	BindFieldEffectToSprite(follower->fieldEffectSpriteId, 2);
	follower->fieldEffectSpriteId = 0; //Unbind
	FollowMe_HandleSprite();

	follower = &gEventObjects[GetFollowerMapObjId()]; //Can change after sprite reload
	EventObjectSetHeldMovement(follower, jumpState);
}

static void Task_FinishSurfDismount(u8 taskId)
{
	struct EventObject* npc = &gEventObjects[GetFollowerMapObjId()];

	//Wait animation
	bool8 animStatus = EventObjectClearHeldMovementIfFinished(npc);
	if (animStatus == 0)
	{
		if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH)
		&& EventObjectClearHeldMovementIfFinished(&gEventObjects[gPlayerAvatar->eventObjectId]))
			SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT); //Temporarily stop running
		return;
	}

	DestroySprite(&gSprites[gTasks[taskId].data[0]]);
	UnfreezeEventObjects();
	DestroyTask(taskId);
	gPlayerAvatar->preventStep = FALSE;
}

void PlayerGoThroughDoor(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s16 *x = &task->data[2];
    s16 *y = &task->data[3];
	u8 playerObjId = gPlayerAvatar->eventObjectId;
	u8 followerObjId = GetFollowerObjectId();

    switch (task->data[0])
    {
    case 0:
		if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH))
			SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT); //Stop running

		gFollowerState.comeOutDoorStairs = FALSE; //Just in case came out and when right back in
        FreezeEventObjects();
        PlayerGetDestCoords(x, y);
        PlaySE(GetDoorSoundEffect(*x, *y - 1));
        task->data[1] = FieldAnimateDoorOpen(*x, *y - 1);
        task->data[0] = 1;
        break;
    case 1:
        if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE)
        {
            EventObjectClearHeldMovementIfActive(&gEventObjects[playerObjId]);
            EventObjectSetHeldMovement(&gEventObjects[playerObjId], MOVEMENT_ACTION_WALK_NORMAL_UP);

			if (gFollowerState.inProgress && !gEventObjects[followerObjId].invisible)
			{
				u8 newState = DetermineFollowerState(&gEventObjects[followerObjId], MOVEMENT_ACTION_WALK_NORMAL_UP,
													DetermineFollowerDirection(&gEventObjects[playerObjId], &gEventObjects[followerObjId]));
				EventObjectClearHeldMovementIfActive(&gEventObjects[followerObjId]);
				EventObjectSetHeldMovement(&gEventObjects[followerObjId], newState);
			}

            task->data[0] = 2;
        }
        break;
    case 2:
        if (walkrun_is_standing_still())
        {
			if (!gFollowerState.inProgress || gEventObjects[followerObjId].invisible) //Don't close door on follower
				task->data[1] = FieldAnimateDoorClose(*x, *y - 1);
            EventObjectClearHeldMovementIfFinished(&gEventObjects[playerObjId]);
            sub_807DCB0(0); //sub_80AF0F4
            task->data[0] = 3;
        }
        break;
    case 3:
        if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE)
        {
            task->data[0] = 4;
        }
        break;
    case 4:
		if (gFollowerState.inProgress)
		{
			EventObjectClearHeldMovementIfActive(&gEventObjects[followerObjId]);
			EventObjectSetHeldMovement(&gEventObjects[followerObjId], MOVEMENT_ACTION_WALK_NORMAL_UP);
		}

        TryFadeOutOldMapMusic();
        WarpFadeScreen();
        PlayRainStoppingSoundEffect();
        task->data[0] = 0;
        task->func = (void*) 0x807E719;
        break;
	case 5:
        TryFadeOutOldMapMusic();
        PlayRainStoppingSoundEffect();
        task->data[0] = 0;
        task->func = (void*) 0x807E719;
        break;
    }
}

static u8 GetPlayerFaceToDoorDirection(struct EventObject* player, struct EventObject* follower)
{
	s16 delta_x = player->currentCoords.x - follower->currentCoords.x;

	if (delta_x < 0)
		return DIR_EAST;
	else if (delta_x > 0)
		return DIR_WEST;

	return DIR_NORTH;
}

static void Task_FollowerOutOfDoor(u8 taskId)
{
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
    struct Task *task = &gTasks[taskId];
    s16 x = task->data[2];
    s16 y = task->data[3];

	if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH)
	&& EventObjectClearHeldMovementIfFinished(player))
		SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT); //Temporarily stop running

	if (EventObjectClearHeldMovementIfFinished(player))
		EventObjectTurn(player, GetPlayerFaceToDoorDirection(player, follower)); //The player should face towards the follow as the exit the door

	switch (task->data[0]) {
		case 0:
			FreezeEventObjects();
			PlaySE(GetDoorSoundEffect(x, y));
			gTasks[taskId].data[1] = FieldAnimateDoorOpen(follower->currentCoords.x, follower->currentCoords.y);
			task->data[0] = 1;
			break;
		case 1:
			if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE) //Door isn't still opening
			{
				follower->invisible = FALSE;
				EventObjectTurn(follower, DIR_SOUTH); //The follower should be facing down when it comes out the door
				EventObjectSetHeldMovement(follower, MOVEMENT_ACTION_WALK_NORMAL_DOWN);
				task->data[0] = 2;
			}
			break;
		case 2:
			if (EventObjectClearHeldMovementIfFinished(follower))
			{
				task->data[1] = FieldAnimateDoorClose(x, y);
				task->data[0] = 3;
			}
			break;
		case 3:
			if (task->data[1] < 0 || gTasks[task->data[1]].isActive != TRUE) //Door is closed
			{
				UnfreezeEventObjects();
				task->data[0] = 4;
			}
			break;
		case 4:
			FollowMe_HandleSprite();
			gFollowerState.comeOutDoorStairs = FALSE;
			gPlayerAvatar->preventStep = FALSE; //Player can move again
			DestroyTask(taskId);
        break;
	}
}

void StairsMoveFollower(void)
{
	if (!gFollowerState.inProgress)
		return;

	if (!FuncIsActiveTask(Task_FollowerHandleIndoorStairs) && gFollowerState.comeOutDoorStairs != 2)
		CreateTask(Task_FollowerHandleIndoorStairs, 1);
}

static void Task_FollowerHandleIndoorStairs(u8 taskId)
{
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
    struct Task *task = &gTasks[taskId];

	switch (task->data[0]) {
		case 0:
			gFollowerState.comeOutDoorStairs = 2; //So the task doesn't get created more than once
			EventObjectClearHeldMovementIfActive(follower);
			EventObjectSetHeldMovement(follower, DetermineFollowerState(follower, MOVEMENT_ACTION_WALK_NORMAL_DOWN, DetermineFollowerDirection(player, follower)));
			task->data[0]++;
			break;
		case 1:
			if (EventObjectClearHeldMovementIfFinished(follower))
			{
				EventObjectSetHeldMovement(follower, DetermineFollowerState(follower, MOVEMENT_ACTION_WALK_SLOWEST_DOWN, player->movementDirection));
				DestroyTask(taskId);
			}
			break;
	}
}

void EscalatorMoveFollower(u8 movementType)
{
	if (!gFollowerState.inProgress)
		return;

	u8 taskId = CreateTask(Task_FollowerHandleEscalator, 1);
	gTasks[taskId].data[1] = movementType;
}

static void Task_FollowerHandleEscalator(u8 taskId)
{
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	EventObjectClearHeldMovementIfActive(follower);
	EventObjectSetHeldMovement(follower, DetermineFollowerState(follower, MOVEMENT_ACTION_WALK_SLOWEST_DOWN, DetermineFollowerDirection(player, follower)));
	DestroyTask(taskId);
}

void EscalatorMoveFollowerFinish(void)
{
	if (!gFollowerState.inProgress)
		return;

	CreateTask(Task_FollowerHandleEscalatorFinish, 1);
}

static void Task_FollowerHandleEscalatorFinish(u8 taskId)
{
	s16 x, y;
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	struct Sprite* sprite = &gSprites[follower->spriteId];
    struct Task *task = &gTasks[taskId];

	switch (task->data[0]) {
		case 0:
			MoveEventObjectToMapCoords(follower, player->currentCoords.x, player->currentCoords.y);
			PlayerGetDestCoords(&x, &y);
			task->data[2] = MapGridGetMetatileBehaviorAt(x, y);
			task->data[7] = 0;
			task->data[0]++;
			break;
		case 1:
			if (task->data[7]++ < 0x20) //Wait half a second before revealing the follower
				break;

			task->data[0]++;
			task->data[1] = 16;
			CalculateFollowerEscalatorTrajectoryUp(task);
			gFollowerState.warpEnd = 0;
			gPlayerAvatar->preventStep = TRUE;
			EventObjectSetHeldMovement(follower, GetFaceDirectionMovementAction(DIR_EAST));
			if (task->data[2] == 0x6b)
				task->data[0] = 4;
			break;
		case 2:
			follower->invisible = FALSE;
			CalculateFollowerEscalatorTrajectoryDown(task);
			task->data[0]++;
			break;
		case 3:
			CalculateFollowerEscalatorTrajectoryDown(task);
			task->data[2]++;
			if (task->data[2] & 1)
			{
				task->data[1]--;
			}

			if (task->data[1] == 0)
			{
				sprite->pos2.x = 0;
				sprite->pos2.y = 0;
				task->data[0] = 6;
			}
			break;
		case 4:
			follower->invisible = FALSE;
			CalculateFollowerEscalatorTrajectoryUp(task);
			task->data[0]++;
			break;
		case 5:
			CalculateFollowerEscalatorTrajectoryUp(task);
			task->data[2]++;
			if (task->data[2] & 1)
			{
				task->data[1]--;
			}

			if (task->data[1] == 0)
			{
				sprite->pos2.x = 0;
				sprite->pos2.y = 0;
				task->data[0]++;
			}
			break;
		case 6:
			if (EventObjectClearHeldMovementIfFinished(follower))
			{
				gPlayerAvatar->preventStep = FALSE;
				DestroyTask(taskId);
			}
	}
}

static void CalculateFollowerEscalatorTrajectoryDown(struct Task *task)
{
    struct Sprite* sprite = &gSprites[gEventObjects[GetFollowerMapObjId()].spriteId];
	sprite->pos2.x = Cosine(0x84, task->data[1]);
	sprite->pos2.y = Sine(0x94, task->data[1]);
}

static void CalculateFollowerEscalatorTrajectoryUp(struct Task *task)
{
    struct Sprite* sprite = &gSprites[gEventObjects[GetFollowerMapObjId()].spriteId];
	sprite->pos2.x = Cosine(0x7c, task->data[1]);
	sprite->pos2.y = Sine(0x76, task->data[1]);
}

void FollowMe_HandleBike(void)
{
	if (gFollowerState.currentSprite == FOLLOWER_SPRITE_INDEX_SURF) //Follower is surfing
		return; //Sprite will automatically be adjusted when they finish surfing

	if (gPlayerAvatar->flags & PLAYER_AVATAR_FLAG_BIKE
	&& gFollowerState.flags & FOLLOWER_FLAG_CAN_BIKE
	&& gFollowerState.comeOutDoorStairs != 1) //Coming out door
		SetFollowerSprite(FOLLOWER_SPRITE_INDEX_BIKE); //Bike on
	else
		SetFollowerSprite(FOLLOWER_SPRITE_INDEX_NORMAL);
}

void FollowMe_HandleSprite(void)
{
	if (gPlayerAvatar->flags & PLAYER_AVATAR_FLAG_BIKE
	&& gFollowerState.flags & FOLLOWER_FLAG_CAN_BIKE)
		SetFollowerSprite(FOLLOWER_SPRITE_INDEX_BIKE);
	else if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
		TryUpdateFollowerSpriteUnderwater();
	else
		SetFollowerSprite(FOLLOWER_SPRITE_INDEX_NORMAL);
}

static void SetFollowerSprite(u8 spriteIndex)
{
	if (!gFollowerState.inProgress)
		return;

	if (gFollowerState.currentSprite == spriteIndex)
		return;

	//Save sprite
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	gFollowerState.currentSprite = spriteIndex;
	u8 oldSpriteId = follower->spriteId;
	u16 newGraphicsId = GetFollowerSprite();

	//Reload the entire event object.
	//It would usually be enough just to change the sprite Id, but if the original
	//sprite and the new sprite have different palettes, the palette would need to
	//be reloaded.
	struct EventObject backupFollower = *follower;
	backupFollower.graphicsIdLowerByte = newGraphicsId & 0xFF;
	backupFollower.graphicsIdUpperByte = newGraphicsId >> 8;
	DestroySprite(&gSprites[oldSpriteId]);
	RemoveEventObject(&gEventObjects[GetFollowerMapObjId()]);

	struct EventObjectTemplate clone;
	GetFollowerTemplate(&clone);
	clone.graphicsIdLowerByte = newGraphicsId & 0xFF;
	clone.graphicsIdUpperByte = newGraphicsId >> 8;
	gFollowerState.objId = TrySpawnEventObjectTemplate(&clone, gSaveBlock1->location.mapNum, gSaveBlock1->location.mapGroup, clone.x, clone.y);

	follower = &gEventObjects[GetFollowerMapObjId()];
	u8 newSpriteId = follower->spriteId;
	*follower = backupFollower;
	follower->spriteId = newSpriteId;
	MoveEventObjectToMapCoords(follower, follower->currentCoords.x, follower->currentCoords.y);
	EventObjectTurn(follower, follower->facingDirection);
}

void FollowMe_WarpSetEnd(void)
{
	if (!gFollowerState.inProgress)
		return;

	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];

	gFollowerState.warpEnd = 1;
	PlayerLogCoordinates(player);

	u8 toY = gFollowerState.comeOutDoorStairs == 1 ? player->currentCoords.y - 1 : player->currentCoords.y;
	MoveEventObjectToMapCoords(follower, player->currentCoords.x, toY);

	follower->facingDirection = player->facingDirection;
	follower->movementDirection = player->movementDirection;
}

static void GetFollowerTemplate(struct EventObjectTemplate* template)
{
	if (gFollowerState.map.group == FOLLOWER_MON_MAP_GROUP)
	{
		//Created at runtime, so build the template from scratch
		memset(template, 0, sizeof(struct EventObjectTemplate));
		template->localId = DEFAULT_FOLLOWER_LOCAL_ID;
		template->elevation = 3;
		template->script = gFollowerState.script;
	}
	else
		*template = *GetEventObjectTemplateByLocalIdAndMap(gFollowerState.map.id, gFollowerState.map.number, gFollowerState.map.group);
}

//Called when the player avatar is created on map load
void CreateFollowerAvatar(void)
{
	#ifdef FLAG_FOLLOWER_POKEMON
	if (!gFollowerState.inProgress || IsFollowerMon()) //Human followers take priority
	{
		u16 gfxId = GetFollowerMonGfxIdFromParty();

		if (gfxId == FOLLOWER_MON_NONE)
			gFollowerState.inProgress = FALSE;
		else if (IsFollowerMon())
			gFollowerState.gfxId = gfxId; //Could have evolved
		else if (gMapHeader.mapType != MAP_TYPE_UNDERWATER)
			SetUpFollowerMonState(gfxId);
	}
	#endif

	SpawnFollowerAvatar();
}

static void SpawnFollowerAvatar(void)
{
	struct EventObject* player;
	struct EventObjectTemplate clone;
	u8 mapNum, mapGroup;

	if (!gFollowerState.inProgress)
		return;

	player = &gEventObjects[gPlayerAvatar->eventObjectId];
	GetFollowerTemplate(&clone);

	if (IsFollowerMon())
	{
		mapNum = gSaveBlock1->location.mapNum;
		mapGroup = gSaveBlock1->location.mapGroup;
	}
	else
	{
		mapNum = gFollowerState.map.number;
		mapGroup = gFollowerState.map.group;
	}

	clone.graphicsIdLowerByte = GetFollowerSprite() & 0xFF;
	clone.graphicsIdUpperByte = GetFollowerSprite() >> 8;
	clone.x = player->currentCoords.x - 7;
	clone.y = player->currentCoords.y - 7;
	clone.movementType = 0; //Doesn't get to move on its own

	switch (GetPlayerFacing()) {
		case DIR_NORTH:
			clone.movementType = MOVEMENT_TYPE_FACE_UP;
			break;
		case DIR_WEST:
			clone.movementType = MOVEMENT_TYPE_FACE_LEFT;
			break;
		case DIR_EAST:
			clone.movementType = MOVEMENT_TYPE_FACE_RIGHT;
			break;
	}

	// Create NPC and store ID
	gFollowerState.objId = TrySpawnEventObjectTemplate(&clone, mapNum, mapGroup, clone.x, clone.y);
	if (gFollowerState.objId == EVENT_OBJECTS_COUNT)
	{
		gFollowerState.inProgress = FALSE; //Cancel the following because couldn't load sprite
		return;
	}

	if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
		gFollowerState.createSurfBlob = SURF_BLOB_STATE_NONE;

	gEventObjects[gFollowerState.objId].invisible = TRUE;
}

//Pokemon Follower
static bool8 IsFollowerMon(void)
{
	return gFollowerState.inProgress && gFollowerState.map.group == FOLLOWER_MON_MAP_GROUP;
}

static const struct FollowerMon* GetFollowerMonFromParty(void)
{
	#ifdef FLAG_FOLLOWER_POKEMON
	if (!FlagGet(FLAG_FOLLOWER_POKEMON))
		return NULL;

	#ifdef FLAG_FOLLOWER_POKEMON_HIDDEN
	if (FlagGet(FLAG_FOLLOWER_POKEMON_HIDDEN))
		return NULL;
	#endif

	#ifdef VAR_FOLLOWER_POKEMON_UNLOCK
	if (VarGet(VAR_FOLLOWER_POKEMON_UNLOCK) != FOLLOWER_POKEMON_UNLOCK_VALUE)
		return NULL;
	#endif

	for (u32 i = 0; i < PARTY_SIZE; ++i)
	{
		if (GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG, NULL))
			continue;

		u16 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL);
		for (u32 j = 0; j < ARRAY_COUNT(sFollowerMons); ++j)
		{
			if (sFollowerMons[j].species == species)
				return &sFollowerMons[j];
		}
	}
	#endif

	return NULL;
}

static u16 GetFollowerMonGfxIdFromParty(void)
{
	const struct FollowerMon* followerMon = GetFollowerMonFromParty();
	return followerMon == NULL ? FOLLOWER_MON_NONE : followerMon->gfxId;
}

static void SetUpFollowerMonState(u16 gfxId)
{
	gFollowerState.inProgress = TRUE;
	gFollowerState.currentSprite = FOLLOWER_SPRITE_INDEX_NORMAL;
	gFollowerState.delayedState = 0;
	gFollowerState.map.id = DEFAULT_FOLLOWER_LOCAL_ID;
	gFollowerState.map.number = 0;
	gFollowerState.map.group = FOLLOWER_MON_MAP_GROUP;
	gFollowerState.warpEnd = TRUE; //Come out from behind the player on their next step
	gFollowerState.script = EventScript_FollowerMon;
	gFollowerState.flag = 0;
	gFollowerState.gfxId = gfxId;
	gFollowerState.flags = FOLLOWER_MON_FLAGS;
	gFollowerState.locked = FALSE;
	gFollowerState.createSurfBlob = SURF_BLOB_STATE_NONE;
	gFollowerState.comeOutDoorStairs = FALSE;
}

static void RemoveFollowerMon(void)
{
	HideFollower(); //Destroys the surf blob if there is one
	RemoveEventObject(&gEventObjects[GetFollowerMapObjId()]);
	gFollowerState.inProgress = FALSE;
}

//Called after every step the player takes, to react to party or flag changes
void FollowerMon_UpdateOnStep(void)
{
	#ifdef FLAG_FOLLOWER_POKEMON
	if (gFollowerState.inProgress && !IsFollowerMon())
		return; //Human followers take priority

	u16 gfxId = GetFollowerMonGfxIdFromParty();

	if (!IsFollowerMon())
	{
		if (gfxId == FOLLOWER_MON_NONE
		|| TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_UNDERWATER)
		|| gMapHeader.mapType == MAP_TYPE_UNDERWATER)
			return; //Wait until the player is back on land

		SetUpFollowerMonState(gfxId);
		SpawnFollowerAvatar();
		if (gFollowerState.inProgress)
			PlayerLogCoordinates(&gEventObjects[gPlayerAvatar->eventObjectId]);
	}
	else if (gfxId == FOLLOWER_MON_NONE)
	{
		RemoveFollowerMon();
	}
	else if (gfxId != gFollowerState.gfxId && gFollowerState.createSurfBlob == SURF_BLOB_STATE_NONE) //Wait until off the surf blob
	{
		//Evolved or party order changed
		u8 spriteIndex = gFollowerState.currentSprite;
		gFollowerState.gfxId = gfxId;
		gFollowerState.currentSprite = 0xFF; //Force the sprite reload
		SetFollowerSprite(spriteIndex);
	}
	#endif
}

//@Details: Buffers the species of the Pokemon following the player.
//@Returns: Var8004: The species, or SPECIES_NONE if no Pokemon is following.
void FollowerMon_BufferSpecies(void)
{
	const struct FollowerMon* followerMon = GetFollowerMonFromParty();
	Var8004 = (IsFollowerMon() && followerMon != NULL) ? followerMon->species : SPECIES_NONE;
}

#define POKE_BALL_GFX_ID 92 //NPC92
#define POKE_BALL_LOCAL_ID 0xFD
#define POKE_BALL_BLINK_FRAMES 24
#define POKE_BALL_HOP_FRAMES 16
#define POKE_BALL_HOP_HEIGHT 6
#define POKE_BALL_WAIT_FRAMES 16

enum
{
	POKE_BALL_ANIM_START,
	POKE_BALL_ANIM_BLINK,
	POKE_BALL_ANIM_HOP,
	POKE_BALL_ANIM_WAIT,
	POKE_BALL_ANIM_END,
};

#define tState data[0]
#define tTimer data[1]
#define tBallObjId data[2]

//Returns EVENT_OBJECTS_COUNT if the ball couldn't be created
static u8 SpawnPokeBallObject(s16 x, s16 y, u8 elevation)
{
	struct EventObjectTemplate ball = {0};
	ball.localId = POKE_BALL_LOCAL_ID;
	ball.graphicsIdLowerByte = POKE_BALL_GFX_ID & 0xFF;
	ball.graphicsIdUpperByte = POKE_BALL_GFX_ID >> 8;
	ball.x = x - 7;
	ball.y = y - 7;
	ball.elevation = elevation;
	ball.movementType = MOVEMENT_TYPE_NONE; //Only has one frame, so it must never animate

	u8 objId = TrySpawnEventObjectTemplate(&ball, gSaveBlock1->location.mapNum, gSaveBlock1->location.mapGroup, ball.x, ball.y);
	if (objId < EVENT_OBJECTS_COUNT) //The last two args are camera offsets, so the sprite needs to be put on the right tile
		MoveEventObjectToMapCoords(&gEventObjects[objId], x, y);

	return objId;
}

//Small hop done by hand, since movement actions would animate the ball.
//Returns TRUE once the ball has landed.
static bool8 UpdatePokeBallHop(struct Task* task)
{
	struct Sprite* ballSprite = &gSprites[gEventObjects[task->tBallObjId].spriteId];

	if (++task->tTimer < POKE_BALL_HOP_FRAMES)
	{
		ballSprite->pos2.y = -Sine((task->tTimer * 0x80) / POKE_BALL_HOP_FRAMES, POKE_BALL_HOP_HEIGHT);
		return FALSE;
	}

	ballSprite->pos2.y = 0;
	PlaySE(SE_POKE_BALL_BOUNCE_1);
	task->tTimer = 0;
	return TRUE;
}

//Flickers the follower. Returns TRUE when done.
static bool8 UpdateFollowerBlink(struct Task* task, struct EventObject* follower)
{
	if (++task->tTimer < POKE_BALL_BLINK_FRAMES)
	{
		follower->invisible = (task->tTimer / 2) & 1;
		return FALSE;
	}

	task->tTimer = 0;
	return TRUE;
}

//Tries behind the player first, then the sides, then in front
static bool8 GetFreeTileNextToPlayer(s16* x, s16* y)
{
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	u8 facing = player->facingDirection;
	u8 dirs[4];

	dirs[0] = GetOppositeDirection(facing);
	dirs[1] = (facing == DIR_NORTH || facing == DIR_SOUTH) ? DIR_WEST : DIR_NORTH;
	dirs[2] = (facing == DIR_NORTH || facing == DIR_SOUTH) ? DIR_EAST : DIR_SOUTH;
	dirs[3] = facing;

	for (u32 i = 0; i < ARRAY_COUNT(dirs); ++i)
	{
		*x = player->currentCoords.x;
		*y = player->currentCoords.y;
		MoveCoords(dirs[i], x, y);

		if (GetCollisionAtCoords(player, *x, *y, dirs[i]) == 0
		&& !MetatileBehavior_IsSurfableWaterOrUnderwater(MapGridGetMetatileBehaviorAt(*x, *y)))
			return TRUE;
	}

	return FALSE;
}

//Brings the following Pokemon back, still invisible. Returns FALSE if it wasn't created.
//placed is FALSE when there was no free tile next to the player: it then comes out on their next step instead.
static bool8 CreateFollowerMonNextToPlayer(bool8* placed)
{
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	s16 x, y;

	*placed = FALSE;

	#ifdef FLAG_FOLLOWER_POKEMON_HIDDEN
	FlagClear(FLAG_FOLLOWER_POKEMON_HIDDEN);
	#endif

	if (IsFollowerMon())
	{
		if (!gEventObjects[GetFollowerMapObjId()].invisible)
			return FALSE; //Already out

		RemoveFollowerMon(); //Waiting to come out on the next step, so recreate it next to the player
	}

	if (gFollowerState.inProgress)
		return FALSE; //Human followers take priority

	u16 gfxId = GetFollowerMonGfxIdFromParty();
	if (gfxId == FOLLOWER_MON_NONE
	|| TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_UNDERWATER)
	|| gMapHeader.mapType == MAP_TYPE_UNDERWATER)
		return FALSE; //FollowerMon_UpdateOnStep brings it back once possible

	SetUpFollowerMonState(gfxId);
	SpawnFollowerAvatar();
	if (!gFollowerState.inProgress)
		return FALSE;

	PlayerLogCoordinates(player);

	if (GetFreeTileNextToPlayer(&x, &y))
	{
		struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
		MoveEventObjectToMapCoords(follower, x, y);
		follower->currentMetatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
		EventObjectTurn(follower, player->facingDirection);
		gFollowerState.warpEnd = FALSE;
		*placed = TRUE;
	}

	return TRUE;
}

static void Task_FollowerMonReturnToBall(u8 taskId)
{
	struct Task* task = &gTasks[taskId];
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];

	switch (task->tState) {
		case POKE_BALL_ANIM_START:
			task->tBallObjId = EVENT_OBJECTS_COUNT;
			task->tTimer = 0;

			if (!IsFollowerMon())
			{
				task->tState = POKE_BALL_ANIM_END;
				break;
			}

			if (follower->invisible) //Hasn't come out yet (eg. right after a warp), so nothing to show
			{
				RemoveFollowerMon();
				task->tState = POKE_BALL_ANIM_END;
				break;
			}

			task->tBallObjId = SpawnPokeBallObject(follower->currentCoords.x, follower->currentCoords.y, follower->currentElevation);
			PlaySE(SE_POKE_BALL_OPEN);
			task->tState = POKE_BALL_ANIM_BLINK;
			break;
		case POKE_BALL_ANIM_BLINK:
			if (!UpdateFollowerBlink(task, follower)) //Flicker as it's pulled into the ball
				break;

			RemoveFollowerMon();
			PlaySE(SE_POKE_BALL_CLOSE);
			task->tState = (task->tBallObjId < EVENT_OBJECTS_COUNT) ? POKE_BALL_ANIM_HOP : POKE_BALL_ANIM_END;
			break;
		case POKE_BALL_ANIM_HOP:
			if (UpdatePokeBallHop(task))
				task->tState = POKE_BALL_ANIM_WAIT;
			break;
		case POKE_BALL_ANIM_WAIT:
			if (++task->tTimer < POKE_BALL_WAIT_FRAMES)
				break;

			RemoveEventObject(&gEventObjects[task->tBallObjId]);
			task->tState = POKE_BALL_ANIM_END;
			break;
		case POKE_BALL_ANIM_END:
			EnableBothScriptContexts();
			DestroyTask(taskId);
			break;
	}
}

static void Task_FollowerMonComeOutOfBall(u8 taskId)
{
	struct Task* task = &gTasks[taskId];
	struct EventObject* follower = &gEventObjects[GetFollowerMapObjId()];
	bool8 placed;

	switch (task->tState) {
		case POKE_BALL_ANIM_START:
			task->tBallObjId = EVENT_OBJECTS_COUNT;
			task->tTimer = 0;

			if (!CreateFollowerMonNextToPlayer(&placed) || !placed)
			{
				task->tState = POKE_BALL_ANIM_END; //Nothing to show now
				break;
			}

			follower = &gEventObjects[GetFollowerMapObjId()];
			task->tBallObjId = SpawnPokeBallObject(follower->currentCoords.x, follower->currentCoords.y, gEventObjects[gPlayerAvatar->eventObjectId].currentElevation);
			if (task->tBallObjId >= EVENT_OBJECTS_COUNT)
			{
				follower->invisible = FALSE; //Just show it
				task->tState = POKE_BALL_ANIM_END;
				break;
			}

			PlaySE(SE_THROW_POKE_BALL);
			task->tState = POKE_BALL_ANIM_HOP;
			break;
		case POKE_BALL_ANIM_HOP:
			if (UpdatePokeBallHop(task))
				task->tState = POKE_BALL_ANIM_WAIT;
			break;
		case POKE_BALL_ANIM_WAIT:
			if (++task->tTimer < POKE_BALL_WAIT_FRAMES)
				break;

			RemoveEventObject(&gEventObjects[task->tBallObjId]);
			PlaySE(SE_POKE_BALL_OPEN);
			task->tTimer = 0;
			task->tState = POKE_BALL_ANIM_BLINK;
			break;
		case POKE_BALL_ANIM_BLINK:
			if (!UpdateFollowerBlink(task, follower)) //Flicker as it comes out of the ball
				break;

			follower->invisible = FALSE;
			task->tState = POKE_BALL_ANIM_END;
			break;
		case POKE_BALL_ANIM_END:
			EnableBothScriptContexts();
			DestroyTask(taskId);
			break;
	}
}

#undef tState
#undef tTimer
#undef tBallObjId

//@Details: Recalls the following Pokemon into a Poke Ball and keeps it hidden until
//			FollowerMon_Show/FollowerMon_ComeOutOfBall is used, or FLAG_FOLLOWER_POKEMON_HIDDEN
//			is cleared (it then comes back on the player's next step).
//			Must be followed by waitstate in the script.
void FollowerMon_ReturnToBall(void)
{
	#ifdef FLAG_FOLLOWER_POKEMON_HIDDEN
	FlagSet(FLAG_FOLLOWER_POKEMON_HIDDEN);
	#endif
	CreateTask(Task_FollowerMonReturnToBall, 0xFF);
}

//@Details: Instantly hides the following Pokemon, without any animation.
//			It stays hidden the same way as with FollowerMon_ReturnToBall.
void FollowerMon_Hide(void)
{
	#ifdef FLAG_FOLLOWER_POKEMON_HIDDEN
	FlagSet(FLAG_FOLLOWER_POKEMON_HIDDEN);
	#endif

	if (IsFollowerMon())
		RemoveFollowerMon();
}

//@Details: Instantly brings the following Pokemon back next to the player, without any animation.
//			If there's no free tile next to the player, it comes out on their next step instead.
void FollowerMon_Show(void)
{
	bool8 placed;

	if (CreateFollowerMonNextToPlayer(&placed) && placed)
		gEventObjects[GetFollowerMapObjId()].invisible = FALSE;
}

//@Details: Brings the following Pokemon back next to the player out of a Poke Ball.
//			If there's no free tile next to the player, it comes out on their next step instead.
//			Must be followed by waitstate in the script.
void FollowerMon_ComeOutOfBall(void)
{
	CreateTask(Task_FollowerMonComeOutOfBall, 0xFF);
}

static void TurnNPCIntoFollower(u8 localId, u8 followerFlags)
{
	struct EventObject* follower;

	if (IsFollowerMon())
		RemoveFollowerMon(); //Human followers take priority

	if (gFollowerState.inProgress)
		return; //Only 1 NPC following at a time

	for (u8 eventObjId = 0; eventObjId < MAP_OBJECTS_COUNT; ++eventObjId) //For each NPC on the map
	{
		if (!gEventObjects[eventObjId].active || gEventObjects[eventObjId].isPlayer)
			continue;

		if (gEventObjects[eventObjId].localId == localId)
		{
			follower = &gEventObjects[eventObjId];
			follower->movementType = 0; //Doesn't get to move on its own anymore
			gSprites[follower->spriteId].callback = (void*) 0x805FFB5; //MovementType_None
			Overworld_SetEventObjTemplateMovementType(localId, 0);
			const u8* script = GetEventObjectScriptPointerByEventObjectId(eventObjId);
			u16 flag = GetEventObjectTemplateByLocalIdAndMap(follower->localId, follower->mapNum, follower->mapGroup)->flagId;
			//gEventObjects[eventObjId].localId = gEventObjects[eventObjId].localId;

			gFollowerState.inProgress = TRUE;
			gFollowerState.objId = eventObjId;
			gFollowerState.gfxId = GetEventObjectGraphicsId(follower);
			gFollowerState.map.id = gEventObjects[eventObjId].localId;
			gFollowerState.map.number = gSaveBlock1->location.mapNum;
			gFollowerState.map.group = gSaveBlock1->location.mapGroup;
			gFollowerState.script = script;
			gFollowerState.flag = flag;
			gFollowerState.flags = followerFlags;
			gFollowerState.currentSprite = FOLLOWER_SPRITE_INDEX_NORMAL; //Could be left over from the Pokemon follower
			gFollowerState.delayedState = 0;
			gFollowerState.warpEnd = FALSE;
			gFollowerState.createSurfBlob = SURF_BLOB_STATE_NONE;
			gFollowerState.comeOutDoorStairs = FALSE;

			if (!(gFollowerState.flags & FOLLOWER_FLAG_CAN_BIKE) //Follower can't bike
			&&  TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_BIKE)) //Player on bike
				SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT); //Dismmount Bike
		}
	}
}

//@Details: Sets up the follow me feature.
//@Input:	Var8000 - Local id or var containing local id of NPC to start following player.
//			Var8001 - Follower flags.
void sp0D1_SetUpFollowerSprite(void)
{
	TurnNPCIntoFollower(VarGet(Var8000), Var8001);
}

//@Details: Ends the follow me feature.
void sp0D2_DestroyFollowerSprite(void)
{
	if (IsFollowerMon())
		RemoveFollowerMon(); //Comes back on the next step unless FLAG_FOLLOWER_POKEMON is cleared
	else if (gFollowerState.inProgress)
	{
		RemoveEventObject(&gEventObjects[gFollowerState.objId]);
		FlagSet(gFollowerState.flag);
		gFollowerState.inProgress = FALSE;
	}
}

//@Details: Faces the player and the follower sprite towards each other.
void sp0D3_FaceFollowerSprite(void)
{
	if (gFollowerState.inProgress)
	{
		u8 playerDirection, followerDirection;
		struct EventObject* player, *follower;

		player = &gEventObjects[gPlayerAvatar->eventObjectId];
		follower = &gEventObjects[gFollowerState.objId];
		playerDirection = DetermineFollowerDirection(player, follower);
		followerDirection = playerDirection;

		//Flip direction
		switch (playerDirection) {
			case DIR_NORTH:
				playerDirection = DIR_SOUTH;
				followerDirection = DIR_NORTH;
				break;
			case DIR_SOUTH:
				playerDirection = DIR_NORTH;
				followerDirection = DIR_SOUTH;
				break;
			case DIR_WEST:
				playerDirection = DIR_EAST;
				followerDirection = DIR_WEST;
				break;
			case DIR_EAST:
				playerDirection = DIR_WEST;
				followerDirection = DIR_EAST;
				break;
		}

		EventObjectTurn(player, playerDirection);
		EventObjectTurn(follower, followerDirection);
	}
}

//@Details: Checks if the player is being followed.
//@Returns: LastResult: 0 if the Player isn't being followed. 1 otherwise.
void sp0E1_DoesPlayerHaveFollower(void)
{
	gSpecialVar_LastResult = gFollowerState.inProgress;
}

bool8 ShouldFollowerIgnoreActiveScript(void)
{
	#ifdef FLAG_FOLLOWER_IGNORE_ACTIVE_SCRIPT
	return FlagGet(FLAG_FOLLOWER_IGNORE_ACTIVE_SCRIPT);
	#else
	return FALSE;
	#endif
}
