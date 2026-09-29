#pragma once

#include "../global.h"
#include "../pokemon.h"

/**
 * \file exp.h
 * \brief Contains functions relating to Pokemon gaining experience in battle.
 *		  Also contains the function repsonsible for assigning Pokemon Effort
 *		  Values after battle.
 */

//Exported Functions
bool8 AddEVs(struct Pokemon* mon, u8 statId, u16 numToAdd);
u8 GetCurrentLevelCap(void);
u32 GetExpToLevel(u8 toLevel, u8 growthRate);
u32 ApplyLevelCapToExp(u16 species, u32 currentExp, u32 gainedExp);
u32 ApplyLevelCapToDaycareExp(u32 exp, u32 steps, struct Pokemon* mon);
u32 ApplyLevelCapToDaycareBoxExp(u32 exp, u32 steps, struct BoxPokemon* mon);

//Functions Hooked In
void atk23_getexp(void);
void PlayerHandleExpBarUpdate(void);
