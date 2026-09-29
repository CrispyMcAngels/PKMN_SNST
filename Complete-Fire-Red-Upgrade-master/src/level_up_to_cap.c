#include "defines.h"
#include "../include/evolution_scene.h"
#include "../include/event_data.h"
#include "../include/overworld.h"
#include "../include/sound.h"
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
	Var8004 = party slot, Var8005 = move being learned, Var8006 = learnset position, Var8007 = level.
*/

extern const u8 gMoveNames[][MOVE_NAME_LENGTH + 1];

//LASTRESULT = TRUE and Var8004 = the next party Pokemon (from Var8004 on) below the cap, not an Egg
void LevelUpToCap_FindNextMon(void)
{
	for (; Var8004 < gPlayerPartyCount; ++Var8004)
	{
		struct Pokemon* mon = &gPlayerParty[Var8004];
		if (!GetMonData(mon, MON_DATA_IS_EGG, NULL) && GetMonData(mon, MON_DATA_LEVEL, NULL) < GetCurrentLevelCap())
		{
			gSpecialVar_LastResult = TRUE;
			return;
		}
	}

	gSpecialVar_LastResult = FALSE;
}

//+1 level (like a Rare Candy, without the item). Var8006 = 0 to look for this level's moves from the start.
void LevelUpToCap_GainLevel(void)
{
	struct Pokemon* mon = &gPlayerParty[Var8004];
	u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
	u32 exp = GetExpToLevel(GetMonData(mon, MON_DATA_LEVEL, NULL) + 1, gBaseStats[species].growthRate);

	SetMonData(mon, MON_DATA_EXP, &exp);
	CalculateMonStats(mon); //New level and stats; HP goes up by the Max HP gained
	Var8006 = 0;
	Var8007 = GetMonData(mon, MON_DATA_LEVEL, NULL);
}

//The next move learned at the current level. LASTRESULT: 0 = none left, 1 = learned, 2 = no free slot (Var8005 = the move)
void LevelUpToCap_TryLearnMove(void)
{
	struct Pokemon* mon = &gPlayerParty[Var8004];
	u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
	u8 level = GetMonData(mon, MON_DATA_LEVEL, NULL);
	u16 move;

	while ((move = GetNextLevelUpMove(species, level, &Var8006)) != MOVE_NONE)
	{
		u16 result = GiveMoveToMon(mon, move);
		StringCopy(gStringVar2, gMoveNames[move]);
		Var8005 = move;

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
	ShowSelectMovePokemonSummaryScreen(gPlayerParty, Var8004, gPlayerPartyCount - 1, CB2_ReturnToFieldContinueScript, Var8005);
}

//After the summary screen. LASTRESULT: 0 = cancelled, 1 = learned (gStringVar3 = the forgotten move)
void LevelUpToCap_ReplaceMove(void)
{
	struct Pokemon* mon = &gPlayerParty[Var8004];
	u8 slot = GetMoveSlotToReplace();

	if (slot >= MAX_MON_MOVES)
	{
		gSpecialVar_LastResult = FALSE;
		return;
	}

	StringCopy(gStringVar3, gMoveNames[GetMonData(mon, MON_DATA_MOVE1 + slot, NULL)]);
	RemoveMonPPBonus(mon, slot);
	SetMonMoveSlot(mon, Var8005, slot);
	gSpecialVar_LastResult = TRUE;
}

//LASTRESULT = TRUE if the Pokemon evolves at this level (Everstone etc. respected)
void LevelUpToCap_CanEvolve(void)
{
	gSpecialVar_LastResult = GetEvolutionTargetSpecies(&gPlayerParty[Var8004], 0, ITEM_NONE) != SPECIES_NONE;
}

//The vanilla evolution scene, back to the script afterwards. Follow with waitstate.
void LevelUpToCap_Evolve(void)
{
	struct Pokemon* mon = &gPlayerParty[Var8004];

	gCB2_AfterEvolution = CB2_ReturnToFieldContinueScript;
	BeginEvolutionScene(mon, GetEvolutionTargetSpecies(mon, 0, ITEM_NONE), TRUE, Var8004);
}

//LASTRESULT = TRUE while the Pokemon is still below the cap
void LevelUpToCap_IsBelowCap(void)
{
	gSpecialVar_LastResult = GetMonData(&gPlayerParty[Var8004], MON_DATA_LEVEL, NULL) < GetCurrentLevelCap();
}

//The level-up jingle from battles (the ROM's own fanfare). Follow with waitfanfare.
void LevelUpToCap_PlayFanfare(void)
{
	PlayFanfareByFanfareNum(0); //FANFARE_LEVEL_UP
}
