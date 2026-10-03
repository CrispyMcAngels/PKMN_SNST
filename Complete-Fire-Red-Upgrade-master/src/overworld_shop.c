#include "defines.h"
#include "../include/event_data.h"
#include "../include/item.h"
#include "../include/menu.h"
#include "../include/money.h"
#include "../include/script.h"
#include "../include/sound.h"
#include "../include/string_util.h"
#include "../include/task.h"
#include "../include/text.h"
#include "../include/window.h"
#include "../include/constants/items.h"
#include "../include/constants/songs.h"

#include "../include/new/item.h"
#include "../include/new/overworld_shop.h"
#include "../include/new/util.h"
/*
overworld_shop.c
	shops that stay on the map instead of opening the mart screen: the stock is listed in the script
	list menu (special 0x158, scrolling multichoice list OVERWORLD_SHOP_LIST), with each price
	right-aligned, next to the money box (showmoney). The quantity is picked in a small window like
	the mart's: up/down +-1 (wrapping around), right/left +-10.

	Script use (see EventScript_Roccavento_3_3_NPC0):
		Var8005 = shop (sOverworldShops), callasm OverworldShop_Open
		list menu with Var8000 = OVERWORLD_SHOP_LIST; the choice goes in Var8005, then
		callasm OverworldShop_SelectItem: [BUFFER1] = item name. LastResult 0 = can't afford one,
		                                  2 = no room in the bag, 1 = fine
		callasm OverworldShop_ChooseQuantity, waitstate: LastResult = quantity, 0 if cancelled.
		                                  [BUFFER2] = quantity, [BUFFER3] = total price
		callasm OverworldShop_Buy: takes the money, gives the items
		callasm OverworldShop_Close when leaving
*/

#define MAX_SHOP_ITEMS 16
#define LABEL_LENGTH 40
#define LIST_FONT 2
#define LIST_TEXT_WIDTH 100 //Pixels from where the list prints an item's name to the end of its price
#define MAX_QUANTITY 99

#define CHAR_POKEDOLLAR 0xB7
#define CHAR_MULTIPLY 0xB9 //Shown as a "x" sign in the game's font
#define EXT_CTRL_CODE_BEGIN 0xFC
#define EXT_CTRL_CODE_SKIP 0x12 //Moves the text to the given pixel

//Quantity window: where the mart has it, above the message box on the right. It uses the coin box's tiles,
//since the coin box isn't open with a shop
#define QUANTITY_WINDOW_LEFT 21
#define QUANTITY_WINDOW_TOP 11
#define QUANTITY_WINDOW_WIDTH 8
#define QUANTITY_WINDOW_HEIGHT 2
#define QUANTITY_WINDOW_BASE_BLOCK 0x20
#define QUANTITY_WINDOW_PAL 15
#define STD_FRAME_TILE 0x214
#define STD_FRAME_PAL 14
#define QUANTITY_FONT 0

struct OverworldShopState
{
	const u16* items;
	u8 numItems;
	u8 selected;
	u8 quantity;
	u8 maxQuantity;
	u8 windowId;
	const u8* labels[MAX_SHOP_ITEMS];
	u8 labelText[MAX_SHOP_ITEMS][LABEL_LENGTH];
};

#define sOverworldShop (*((struct OverworldShopState**) 0x203B7A8)) //Free RAM (ram_locs.h)

//Shops: item lists ending with ITEM_NONE
static const u16 sRoccaventoMarketItems[] =
{
	ITEM_ENERGY_POWDER,
	ITEM_ENERGY_ROOT,
	ITEM_HEAL_POWDER,
	ITEM_REVIVAL_HERB,
	ITEM_MOOMOO_MILK,
	ITEM_BERRY_JUICE,
	ITEM_ORAN_BERRY,
	ITEM_PECHA_BERRY,
	ITEM_NONE,
};

static const u16* const sOverworldShops[] =
{
	sRoccaventoMarketItems, //0: Roccavento farmers' market
};

static void Task_OverworldShopQuantity(u8 taskId);

static u8* WritePrice(u8* dst, u32 price)
{
	*dst++ = CHAR_POKEDOLLAR;
	return ConvertIntToDecimalStringN(dst, price, STR_CONV_MODE_LEFT_ALIGN, 6);
}

//"Name           $1200": the name, then the price right-aligned
static void BuildLabel(u8* dst, u16 item)
{
	u8 price[10];
	s32 x;

	WritePrice(price, ItemId_GetPrice(item));
	x = LIST_TEXT_WIDTH - GetStringWidth(LIST_FONT, price, 0);

	dst = StringCopy(dst, ItemId_GetName(item));
	*dst++ = EXT_CTRL_CODE_BEGIN;
	*dst++ = EXT_CTRL_CODE_SKIP;
	*dst++ = (x > 0) ? x : 0;
	StringCopy(dst, price);
}

void OverworldShop_Open(void)
{
	const u16* items = sOverworldShops[Var8005 < ARRAY_COUNT(sOverworldShops) ? Var8005 : 0];
	struct OverworldShopState* shop = Calloc(sizeof(struct OverworldShopState));

	sOverworldShop = shop;
	if (shop == NULL)
		return;

	shop->items = items;
	for (shop->numItems = 0; shop->numItems < MAX_SHOP_ITEMS && items[shop->numItems] != ITEM_NONE; ++shop->numItems)
	{
		BuildLabel(shop->labelText[shop->numItems], items[shop->numItems]);
		shop->labels[shop->numItems] = shop->labelText[shop->numItems];
	}
}

void OverworldShop_Close(void)
{
	if (sOverworldShop != NULL)
	{
		Free(sOverworldShop);
		sOverworldShop = NULL;
	}
}

//The list menu's labels (scripting.c, scrolling multichoice list OVERWORLD_SHOP_LIST)
const u8* const* OverworldShop_GetLabels(void)
{
	return (sOverworldShop != NULL) ? sOverworldShop->labels : NULL;
}

u8 OverworldShop_GetNumItems(void)
{
	return (sOverworldShop != NULL) ? sOverworldShop->numItems : 0;
}

static u16 GetSelectedItem(void)
{
	return sOverworldShop->items[sOverworldShop->selected];
}

static u32 GetMaxAffordable(u16 item)
{
	u32 price = ItemId_GetPrice(item);
	u32 max = MAX_QUANTITY;

	if (price != 0)
		max = MathMin(max, GetMoney(&gSaveBlock1->money) / price);

	while (max > 0 && !CheckBagHasSpace(item, max)) //Room in the bag
		--max;

	return max;
}

void OverworldShop_SelectItem(void)
{
	u16 item;

	gSpecialVar_LastResult = 0;
	if (sOverworldShop == NULL || Var8005 >= sOverworldShop->numItems)
		return;

	sOverworldShop->selected = Var8005;
	item = GetSelectedItem();
	CopyItemName(item, gStringVar1);

	if (!IsEnoughMoney(&gSaveBlock1->money, ItemId_GetPrice(item)))
		gSpecialVar_LastResult = 0;
	else if (!CheckBagHasSpace(item, 1))
		gSpecialVar_LastResult = 2;
	else
	{
		sOverworldShop->maxQuantity = GetMaxAffordable(item);
		gSpecialVar_LastResult = 1;
	}
}

static void PrintQuantity(void)
{
	struct OverworldShopState* shop = sOverworldShop;
	u8 text[16];
	u8* end;

	FillWindowPixelBuffer(shop->windowId, PIXEL_FILL(1));
	text[0] = CHAR_MULTIPLY;
	ConvertIntToDecimalStringN(&text[1], shop->quantity, STR_CONV_MODE_LEADING_ZEROS, 2);
	AddTextPrinterParameterized(shop->windowId, QUANTITY_FONT, text, 2, 1, 0, NULL);

	end = WritePrice(text, ItemId_GetPrice(GetSelectedItem()) * shop->quantity);
	(void) end;
	AddTextPrinterParameterized(shop->windowId, QUANTITY_FONT, text,
								QUANTITY_WINDOW_WIDTH * 8 - GetStringWidth(QUANTITY_FONT, text, 0) - 2, 1, 0, NULL);
	CopyWindowToVram(shop->windowId, COPYWIN_GFX); //The text changed; the window stays where it is
}

void OverworldShop_ChooseQuantity(void)
{
	struct OverworldShopState* shop = sOverworldShop;
	struct WindowTemplate template;

	if (shop == NULL || shop->maxQuantity == 0)
	{
		gSpecialVar_LastResult = 0;
		EnableBothScriptContexts();
		return;
	}

	template = SetWindowTemplateFields(0, QUANTITY_WINDOW_LEFT, QUANTITY_WINDOW_TOP, QUANTITY_WINDOW_WIDTH,
										QUANTITY_WINDOW_HEIGHT, QUANTITY_WINDOW_PAL, QUANTITY_WINDOW_BASE_BLOCK);
	shop->windowId = AddWindow(&template);
	shop->quantity = 1;
	DrawStdFrameWithCustomTileAndPalette(shop->windowId, FALSE, STD_FRAME_TILE, STD_FRAME_PAL);
	PutWindowTilemap(shop->windowId);
	PrintQuantity();
	CopyWindowToVram(shop->windowId, COPYWIN_BOTH); //The window's place on screen too, not just its text
	CreateTask(Task_OverworldShopQuantity, 80);
}

static void EndQuantity(u8 taskId, u8 quantity)
{
	struct OverworldShopState* shop = sOverworldShop;

	ClearStdWindowAndFrameToTransparent(shop->windowId, TRUE);
	RemoveWindow(shop->windowId);
	DestroyTask(taskId);

	if (quantity != 0)
	{
		ConvertIntToDecimalStringN(gStringVar2, quantity, STR_CONV_MODE_LEFT_ALIGN, 2);
		ConvertIntToDecimalStringN(gStringVar3, ItemId_GetPrice(GetSelectedItem()) * quantity, STR_CONV_MODE_LEFT_ALIGN, 7);
	}

	gSpecialVar_LastResult = quantity;
	EnableBothScriptContexts();
}

//Like the mart: up/down +-1 (wrapping around), right/left +-10, A to confirm, B to cancel
static void Task_OverworldShopQuantity(u8 taskId)
{
	struct OverworldShopState* shop = sOverworldShop;
	s16 quantity = shop->quantity;

	if (JOY_NEW(A_BUTTON))
	{
		PlaySE(SE_SELECT);
		EndQuantity(taskId, shop->quantity);
		return;
	}
	if (JOY_NEW(B_BUTTON))
	{
		PlaySE(SE_SELECT);
		EndQuantity(taskId, 0);
		return;
	}

	if (JOY_REPT(DPAD_UP))
		quantity = (quantity >= shop->maxQuantity) ? 1 : quantity + 1;
	else if (JOY_REPT(DPAD_DOWN))
		quantity = (quantity <= 1) ? shop->maxQuantity : quantity - 1;
	else if (JOY_REPT(DPAD_RIGHT))
		quantity = MathMin(quantity + 10, shop->maxQuantity);
	else if (JOY_REPT(DPAD_LEFT))
		quantity = MathMax(quantity - 10, 1);

	if (quantity != shop->quantity)
	{
		shop->quantity = quantity;
		PlaySE(SE_SELECT);
		PrintQuantity();
	}
}

void OverworldShop_Buy(void)
{
	struct OverworldShopState* shop = sOverworldShop;
	u16 item;

	gSpecialVar_LastResult = FALSE;
	if (shop == NULL || shop->quantity == 0)
		return;

	item = GetSelectedItem();
	if (!IsEnoughMoney(&gSaveBlock1->money, ItemId_GetPrice(item) * shop->quantity)
	|| !AddBagItem(item, shop->quantity))
		return;

	RemoveMoney(&gSaveBlock1->money, ItemId_GetPrice(item) * shop->quantity);
	gSpecialVar_LastResult = TRUE;
}
