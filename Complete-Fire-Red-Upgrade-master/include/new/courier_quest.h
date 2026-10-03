#pragma once

#include "../global.h"

/**
 * \file courier_quest.h
 * \brief The "Consegna lampo" side quest: a timed delivery to Percorso 4 riding the officer's Rapidash.
 */

//Exported Functions
bool8 IsCourierQuestActive(void);
void CourierQuest_BufferMaxSteps(void);
void CourierQuest_Start(void);
void CourierQuest_Cancel(void);
void CourierQuest_Deliver(void);
void CourierQuest_OnMapLoad(void);
const u8* CourierQuest_OnStep(void);
bool8 CourierQuest_TryAskQuit(void);

//Functions Hooked In
bool8 CourierQuest_IsWarpBlocked(const struct MapHeader* mapHeader, const struct MapPosition* position);
