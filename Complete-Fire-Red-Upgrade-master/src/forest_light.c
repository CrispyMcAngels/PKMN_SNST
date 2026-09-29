#include "defines.h"
#include "../include/field_camera.h"
#include "../include/field_weather.h"
#include "../include/sprite.h"

#include "../include/new/dynamic_ow_pals.h"
/*
forest_light.c
	weather 15 "forest light": sunlight coming through the trees. Like the vanilla fog, 20 semi-transparent
	64x64 sprites cover the screen, but each one shows one of NPC148's frames (transparent = sunlight,
	dark = shade), picked from sPattern so they form a 256x256 pattern that repeats across the map.
	The pattern scrolls at FOREST_LIGHT_SCROLL_SPEED of the camera's speed for a sense of depth.

	The sprites are behind the NPCs (like fog), so they shade the ground layers (BG2 and BG3) but not
	the NPCs, nor the top layer (BG1, eg. tree tops), which is drawn over them.
	Weather 15 is added through gWeatherFuncsExpanded at the end of this file (see repoints).
*/

#ifdef FOREST_LIGHT_WEATHER

#define FOREST_LIGHT_TILE_TAG 0x1402
#define FOREST_LIGHT_PAL_TAG 0x118D //NPC148's palette
#define NUM_FRAMES 5
#define FRAME_TILES ((64 * 64) / (8 * 8))
#define GRID_COLUMNS 5 //Enough 64x64 sprites to cover the screen at any scroll position
#define GRID_ROWS 4
#define PATTERN_BLOCKS 4 //The pattern is 4x4 blocks of 64x64
#define FLIP_H 0x10
#define FLIP_V 0x20
#define FRAME_MASK 0xF
#define OAM_FLIP_H 0x8 //Bits of oam.matrixNum when the sprite isn't affine
#define OAM_FLIP_V 0x10

#define sColumn data[0]
#define sRow data[1]

extern const u8 gEventsObjectPic_NPC148Tiles[];
extern const u16 gEventsObjectPic_NPC148Pal[];

static void ForestLightSpriteCallback(struct Sprite* sprite);

//NPC148's frame shown by each 64x64 block of the 256x256 pattern, optionally mirrored.
//Frame 0 is plain shade, so it's the most common; the light patches (1-4) are spread out.
static const u8 sPattern[PATTERN_BLOCKS][PATTERN_BLOCKS] =
{
	{0,          1,          0, 3},
	{0,          0, 2 | FLIP_H, 0},
	{4,          0,          0, 1 | FLIP_V},
	{0, 3 | FLIP_H,          0, 0},
};

static const struct OamData sForestLightOam =
{
	.objMode = ST_OAM_OBJ_BLEND, //Semi-transparent, blended with the map like fog
	.shape = ST_OAM_SQUARE,
	.size = ST_OAM_SIZE_3, //64x64
	.priority = 2,
};

static const struct SpriteTemplate sForestLightTemplate =
{
	.tileTag = FOREST_LIGHT_TILE_TAG,
	.paletteTag = 0xFFFF, //Set from FindOrLoadNPCPaletteFromData
	.oam = &sForestLightOam,
	.anims = gDummySpriteAnimTable,
	.images = NULL,
	.affineAnims = gDummySpriteAffineAnimTable,
	.callback = ForestLightSpriteCallback,
};

static const struct SpriteSheet sForestLightSheet =
{
	gEventsObjectPic_NPC148Tiles, NUM_FRAMES * FRAME_TILES * TILE_SIZE_4BPP, FOREST_LIGHT_TILE_TAG
};

//The camera's position in the current map, in pixels (same as in bg3_parallax.c)
static s32 GetCameraPosInMap(s16 mapPos, s32 movementOffset)
{
	s32 pos = mapPos * 16 + movementOffset;

	if (movementOffset > 0)
		pos -= 16;
	else if (movementOffset < 0)
		pos += 16;

	return pos;
}

//Where the screen's first pixel is in the 256x256 pattern
static u32 GetPatternScroll(s16 mapPos, s32 movementOffset)
{
	//Shift rather than divide, so negative positions round the same way as positive ones
	return ((GetCameraPosInMap(mapPos, movementOffset) * FOREST_LIGHT_SCROLL_SPEED) >> 2) & 0xFF;
}

static void ForestLightSpriteCallback(struct Sprite* sprite)
{
	u32 scrollX = GetPatternScroll(gSaveBlock1->pos.x, gFieldCamera.x);
	u32 scrollY = GetPatternScroll(gSaveBlock1->pos.y, gFieldCamera.y);
	u32 blockX = (scrollX / 64 + sprite->sColumn) % PATTERN_BLOCKS;
	u32 blockY = (scrollY / 64 + sprite->sRow) % PATTERN_BLOCKS;
	u8 block = sPattern[blockY][blockX];

	sprite->pos1.x = sprite->sColumn * 64 - (scrollX % 64) + 32;
	sprite->pos1.y = sprite->sRow * 64 - (scrollY % 64) + 32;
	sprite->oam.tileNum = sprite->sheetTileStart + (block & FRAME_MASK) * FRAME_TILES;
	sprite->oam.matrixNum = ((block & FLIP_H) ? OAM_FLIP_H : 0) | ((block & FLIP_V) ? OAM_FLIP_V : 0);
}

static bool8 DoForestLightSpritesExist(void)
{
	for (u32 i = 0; i < MAX_SPRITES; ++i)
	{
		if (gSprites[i].inUse && gSprites[i].callback == ForestLightSpriteCallback)
			return TRUE;
	}

	return FALSE;
}

//Returns TRUE if the sprites had to be created (eg. they were gone after a battle or a menu)
static bool8 TryCreateForestLightSprites(void)
{
	if (DoForestLightSpritesExist())
		return FALSE;

	if (GetSpriteTileStartByTag(FOREST_LIGHT_TILE_TAG) == 0xFFFF)
		LoadSpriteSheet(&sForestLightSheet);

	for (u32 i = 0; i < GRID_COLUMNS * GRID_ROWS; ++i)
	{
		u8 spriteId = CreateSpriteAtEnd(&sForestLightTemplate, 0, 0, 0xFF); //Behind every other sprite
		if (spriteId >= MAX_SPRITES)
			break;

		struct Sprite* sprite = &gSprites[spriteId];
		sprite->oam.paletteNum = FindOrLoadNPCPaletteFromData(FOREST_LIGHT_PAL_TAG, gEventsObjectPic_NPC148Pal);
		sprite->sColumn = i % GRID_COLUMNS;
		sprite->sRow = i / GRID_COLUMNS;
		ForestLightSpriteCallback(sprite);
	}

	return TRUE;
}

static void DestroyForestLightSprites(void)
{
	for (u32 i = 0; i < MAX_SPRITES; ++i)
	{
		if (gSprites[i].inUse && gSprites[i].callback == ForestLightSpriteCallback)
			DestroySprite(&gSprites[i]);
	}

	FreeSpriteTilesByTag(FOREST_LIGHT_TILE_TAG);
}

void ForestLight_InitVars(void)
{
	gWeatherPtr->initStep = 0;
	gWeatherPtr->weatherGfxLoaded = FALSE;
	gWeatherPtr->gammaTargetIndex = 0;
	gWeatherPtr->gammaStepDelay = 20;

	if (!DoForestLightSpritesExist())
		Weather_SetBlendCoeffs(0, 16); //Fade in from nothing
}

void ForestLight_Main(void)
{
	switch (gWeatherPtr->initStep) {
		case 0:
			TryCreateForestLightSprites();
			Weather_SetTargetBlendCoeffs(FOREST_LIGHT_BLEND_EVA, FOREST_LIGHT_BLEND_EVB, 3);
			gWeatherPtr->initStep++;
			break;
		case 1:
			if (Weather_UpdateBlend())
			{
				gWeatherPtr->weatherGfxLoaded = TRUE;
				gWeatherPtr->initStep++;
			}
			break;
		default:
			if (TryCreateForestLightSprites()) //Gone after a battle or a menu
				Weather_SetBlendCoeffs(FOREST_LIGHT_BLEND_EVA, FOREST_LIGHT_BLEND_EVB);
			break;
	}
}

void ForestLight_InitAll(void)
{
	ForestLight_InitVars();
	while (!gWeatherPtr->weatherGfxLoaded)
		ForestLight_Main();
}

bool8 ForestLight_Finish(void)
{
	switch (gWeatherPtr->finishStep) {
		case 0:
			Weather_SetTargetBlendCoeffs(0, 16, 3);
			gWeatherPtr->finishStep++;
			break;
		case 1:
			if (Weather_UpdateBlend())
				gWeatherPtr->finishStep++;
			break;
		case 2:
			DestroyForestLightSprites();
			gWeatherPtr->finishStep++;
			break;
		default:
			return FALSE;
	}

	return TRUE;
}

//The vanilla weather table (0x83C2BC0) only has weathers 0-14; the data right after it is another table.
//This copy adds weather 15, and repoints moves the game's 4 references to the vanilla table here.
//Entries 0-14 must match the vanilla table as the build leaves it (including bytereplacement's changes to it).
struct WeatherCallbacks
{
	void (*initVars)(void);
	void (*main)(void);
	void (*initAll)(void);
	bool8 (*finish)(void);
};

#define VANILLA_WEATHER_FUNC(address) ((void (*)(void)) (address))
#define VANILLA_WEATHER_FINISH(address) ((bool8 (*)(void)) (address))

const struct WeatherCallbacks gWeatherFuncsExpanded[] =
{
	{VANILLA_WEATHER_FUNC(0x8079EC1), VANILLA_WEATHER_FUNC(0x8079EE1), VANILLA_WEATHER_FUNC(0x8079EC1), VANILLA_WEATHER_FINISH(0x8079EE5)}, //0: None
	{VANILLA_WEATHER_FUNC(0x807B2DD), VANILLA_WEATHER_FUNC(0x807B359), VANILLA_WEATHER_FUNC(0x807B329), VANILLA_WEATHER_FINISH(0x807B3B9)}, //1: Clouds
	{VANILLA_WEATHER_FUNC(0x807B401), VANILLA_WEATHER_FUNC(0x807B431), VANILLA_WEATHER_FUNC(0x807B425), VANILLA_WEATHER_FINISH(0x807B435)}, //2: Sunny
	{VANILLA_WEATHER_FUNC(0x807B7C9), VANILLA_WEATHER_FUNC(0x807B865), VANILLA_WEATHER_FUNC(0x807B835), VANILLA_WEATHER_FINISH(0x807B8C5)}, //3: Rain
	{VANILLA_WEATHER_FUNC(0x807BE2D), VANILLA_WEATHER_FUNC(0x807BEE9), VANILLA_WEATHER_FUNC(0x807BE7D), VANILLA_WEATHER_FINISH(0x807BF25)}, //4: Snow
	{VANILLA_WEATHER_FUNC(0x807C2E5), VANILLA_WEATHER_FUNC(0x807C425), VANILLA_WEATHER_FUNC(0x807C359), VANILLA_WEATHER_FINISH(0x807C7B1)}, //5: Thunderstorm
	{VANILLA_WEATHER_FUNC(0x807C901), VANILLA_WEATHER_FUNC(0x807C991), VANILLA_WEATHER_FUNC(0x807C961), VANILLA_WEATHER_FINISH(0x807CA51)}, //6: Fog (horizontal)
#ifdef REPLACE_ASH_WEATHER_WITH_WHITE_SANDSTORM //Same change as in bytereplacement
	{VANILLA_WEATHER_FUNC(0x807D2FD), VANILLA_WEATHER_FUNC(0x807D3AD), VANILLA_WEATHER_FUNC(0x807D37D), VANILLA_WEATHER_FINISH(0x807D429)}, //7: Volcanic ash, as a white sandstorm
#else
	{VANILLA_WEATHER_FUNC(0x807CC5D), VANILLA_WEATHER_FUNC(0x807CCE9), VANILLA_WEATHER_FUNC(0x807CCB9), VANILLA_WEATHER_FINISH(0x807CD95)}, //7: Volcanic ash
#endif
	{VANILLA_WEATHER_FUNC(0x807D2FD), VANILLA_WEATHER_FUNC(0x807D3AD), VANILLA_WEATHER_FUNC(0x807D37D), VANILLA_WEATHER_FINISH(0x807D429)}, //8: Sandstorm
	{VANILLA_WEATHER_FUNC(0x807CF85), VANILLA_WEATHER_FUNC(0x807D039), VANILLA_WEATHER_FUNC(0x807D009), VANILLA_WEATHER_FINISH(0x807D09D)}, //9: Fog (diagonal)
	{VANILLA_WEATHER_FUNC(0x807C901), VANILLA_WEATHER_FUNC(0x807C991), VANILLA_WEATHER_FUNC(0x807C961), VANILLA_WEATHER_FINISH(0x807CA51)}, //10: Underwater
	{VANILLA_WEATHER_FUNC(0x807D891), VANILLA_WEATHER_FUNC(0x807D8CD), VANILLA_WEATHER_FUNC(0x807D8C1), VANILLA_WEATHER_FINISH(0x807D8D1)}, //11: Shade
	{VANILLA_WEATHER_FUNC(0x807B575), VANILLA_WEATHER_FUNC(0x807B5D9), VANILLA_WEATHER_FUNC(0x807B5A9), VANILLA_WEATHER_FINISH(0x807B6BD)}, //12: Drought
	{VANILLA_WEATHER_FUNC(0x807C389), VANILLA_WEATHER_FUNC(0x807C425), VANILLA_WEATHER_FUNC(0x807C3F5), VANILLA_WEATHER_FINISH(0x807C7B1)}, //13: Downpour
	{VANILLA_WEATHER_FUNC(0x807D8D5), VANILLA_WEATHER_FUNC(0x807D959), VANILLA_WEATHER_FUNC(0x807D929), VANILLA_WEATHER_FINISH(0x807D9CD)}, //14: Bubbles
	[FOREST_LIGHT_WEATHER] = {ForestLight_InitVars, ForestLight_Main, ForestLight_InitAll, ForestLight_Finish},
};

#endif
