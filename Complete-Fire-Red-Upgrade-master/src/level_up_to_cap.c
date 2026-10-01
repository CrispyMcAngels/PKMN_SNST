#include "defines.h"
#include "../include/evolution_scene.h"
#include "../include/event_data.h"
#include "../include/overworld.h"
#include "../include/string_util.h"
#include "../include/constants/items.h"
#include "../include/constants/moves.h" //Before pokemon_summary_screen.h, which uses MOVE_NAME_LENGTH
#include "../include/constants/species.h"
#include "../include/pokemon_summary_screen.h"

#include "../include/new/evolution.h"
#include "../include/new/exp.h"
#include "../include/new/learn_move.h"
/*
level_up_to_cap.c
	levels the party up to the level cap (GetCurrentLevelCap in exp.c) from EventScript_LevelPartyToCap
	(level_cap.s), one level at a time like Rare Candies: new moves (with the forget prompt) and
	evolutions happen at the right level. Each function is called from the script with callasm.
	It keeps its state in VAR_LEVEL_UP_TO_CAP and the next 3 vars (see below), not in sSlot+:
	the summary screen and the evolution scene change those while the script waits for them.
*/

#define sSlot (*GetVarPointer(VAR_LEVEL_UP_TO_CAP))         //Party slot of the Pokemon being levelled
#define sMove (*GetVarPointer(VAR_LEVEL_UP_TO_CAP + 1))     //Move it's trying to learn
#define sPosition (*GetVarPointer(VAR_LEVEL_UP_TO_CAP + 2)) //Position in its learnset
#define sLevel (*GetVarPointer(VAR_LEVEL_UP_TO_CAP + 3))    //Its level, for the messages

extern const u8 gMoveNames[][MOVE_NAME_LENGTH + 1];

//LASTRESULT = TRUE and sSlot = the next party Pokemon (from sSlot on) below the cap, not an Egg
void LevelUpToCap_FindNextMon(void)
{
	for (; sSlot < gPlayerPartyCount; ++sSlot)
	{
		struct Pokemon* mon = &gPlayerParty[sSlot];
		if (!GetMonData(mon, MON_DATA_IS_EGG, NULL) && GetMonData(mon, MON_DATA_LEVEL, NULL) < GetCurrentLevelCap())
		{
			gSpecialVar_LastResult = TRUE;
			return;
		}
	}

	gSpecialVar_LastResult = FALSE;
}

//+1 level (like a Rare Candy, without the item). sPosition = 0 to look for this level's moves from the start.
void LevelUpToCap_GainLevel(void)
{
	struct Pokemon* mon = &gPlayerParty[sSlot];
	u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
	u32 exp = GetExpToLevel(GetMonData(mon, MON_DATA_LEVEL, NULL) + 1, gBaseStats[species].growthRate);

	SetMonData(mon, MON_DATA_EXP, &exp);
	CalculateMonStats(mon); //New level and stats; HP goes up by the Max HP gained
	sPosition = 0;
	sLevel = GetMonData(mon, MON_DATA_LEVEL, NULL);
}

//The next move learned at the current level. LASTRESULT: 0 = none left, 1 = learned, 2 = no free slot (sMove = the move)
void LevelUpToCap_TryLearnMove(void)
{
	struct Pokemon* mon = &gPlayerParty[sSlot];
	u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
	u8 level = GetMonData(mon, MON_DATA_LEVEL, NULL);
	u16 move;

	while ((move = GetNextLevelUpMove(species, level, &sPosition)) != MOVE_NONE)
	{
		u16 result = GiveMoveToMon(mon, move);
		StringCopy(gStringVar2, gMoveNames[move]);
		sMove = move;

		if (result == 0xFFFE) //Already knows it
			continue;

		gSpecialVar_LastResult = (result == 0xFFFF) ? 2 : 1; //0xFFFF: four moves already
		return;
	}

	gSpecialVar_LastResult = 0;
}

//The vanilla "which move should be forgotten?" summary screen. Follow with waitstate.
void LevelUpToCap_ShowForgetScreen(void)
{
	ShowSelectMovePokemonSummaryScreen(gPlayerParty, sSlot, gPlayerPartyCount - 1, CB2_ReturnToFieldContinueScript, sMove);
}

//After the summary screen. LASTRESULT: 0 = cancelled, 1 = learned (gStringVar3 = the forgotten move)
void LevelUpToCap_ReplaceMove(void)
{
	struct Pokemon* mon = &gPlayerParty[sSlot];
	u8 slot = GetMoveSlotToReplace();

	if (slot >= MAX_MON_MOVES)
	{
		gSpecialVar_LastResult = FALSE;
		return;
	}

	StringCopy(gStringVar3, gMoveNames[GetMonData(mon, MON_DATA_MOVE1 + slot, NULL)]);
	RemoveMonPPBonus(mon, slot);
	SetMonMoveSlot(mon, sMove, slot);
	gSpecialVar_LastResult = TRUE;
}

//LASTRESULT = TRUE if the Pokemon evolves at this level (Everstone etc. respected)
void LevelUpToCap_CanEvolve(void)
{
	gSpecialVar_LastResult = GetEvolutionTargetSpecies(&gPlayerParty[sSlot], 0, ITEM_NONE) != SPECIES_NONE;
}

//The vanilla evolution scene, back to the script afterwards. Follow with waitstate.
void LevelUpToCap_Evolve(void)
{
	struct Pokemon* mon = &gPlayerParty[sSlot];

	gCB2_AfterEvolution = CB2_ReturnToFieldContinueScript;
	BeginEvolutionScene(mon, GetEvolutionTargetSpecies(mon, 0, ITEM_NONE), TRUE, sSlot);
}

//LASTRESULT = TRUE while the Pokemon is still below the cap
void LevelUpToCap_IsBelowCap(void)
{
	gSpecialVar_LastResult = GetMonData(&gPlayerParty[sSlot], MON_DATA_LEVEL, NULL) < GetCurrentLevelCap();
}
