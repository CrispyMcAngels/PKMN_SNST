#pragma once

#include "../global.h"

/**
 * \file overworld_shop.h
 * \brief Shops on the map: the script list menu for the stock, the money box and a mart-like quantity window.
 */

#define OVERWORLD_SHOP_LIST 0x80 //Var8000 for special 0x158: the open shop's stock

//Exported Functions
void OverworldShop_Open(void);
void OverworldShop_Close(void);
void OverworldShop_SelectItem(void);
void OverworldShop_ChooseQuantity(void);
void OverworldShop_Buy(void);
const u8* const* OverworldShop_GetLabels(void);
u8 OverworldShop_GetNumItems(void);
