#pragma once

#include "../global.h"

/**
 * \file forest_light.h
 * \brief Weather 15 "forest light": NPC148's frames shade the map, with sunlight through the gaps.
 */

//Exported Functions
bool8 ForestLight_LoadBg3(u32* charBlock, u16 firstTile, u32 maxTiles, u16* tilemap, u8 palSlot);
void ForestLight_LoadBg3Palette(u8 palSlot);
