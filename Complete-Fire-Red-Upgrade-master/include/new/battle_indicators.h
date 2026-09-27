#pragma once

#include "../global.h"
#include "../pokemon.h"

/**
 * \file battle_indicators.h
 * \brief Contains various functions relating to indicators and triggers
 *		  for Mega Evolution, Z-Moves, and Dynamax.
 */

//Exported Functions
void LoadRaidShieldGfx(void);
void LoadMegaGraphics(u8 state);
void CreateMegaIndicatorAfterAnim(void);
void TryLoadIndicatorForEachBank(void);
void DestroyMegaIndicator(u8 bank);
void TryLoadMegaTriggers(void);
void TryLoadZTrigger(void);
void TryLoadDynamaxTrigger(void);
void DestroyRaidShieldSprite(void);
u16 GetLastUsedBall(void);
bool8 CantLoadLastBallTrigger(void);
void TryLoadLastUsedBallTrigger(void);
bool8 DidPlayerUseLastBallAndTryUpdateControllerFunc(void);
void TryLoadTeamPreviewTrigger(void);
bool8 CantLoadTeamPreviewTrigger(void);
void DisplayInBattleTeamPreview(void);
void HideInBattleTeamPreview(void);

//Exported Data Structures
extern const struct SpriteTemplate gRaidShieldSpriteTemplate;