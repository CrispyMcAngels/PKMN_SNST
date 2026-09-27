#include "defines.h"
#include "../include/bg.h"
#include "../include/field_camera.h"
#include "../include/field_weather.h"
#include "../include/gpu_regs.h"
#include "../include/overworld.h"

#include "../include/new/bg3_parallax.h"
/*
bg3_parallax.c
	handles BG3 parallax: on maps that ask for it, BG3 (the bottom map layer) shows an image
	instead of map tiles, and scrolls at 0%, 25%, 50%, 75% or 100% of the map's speed.
	It's seen wherever BG2 and BG1 have transparent pixels.

	VAR_PARALLAX (a temp var, so it's cleared on every warp) is set in the map's on-transition
	script to 0xIIXY:
		II = image number in sParallaxImages (1 and up, 0 = no parallax)
		X  = horizontal speed, Y = vertical speed (0 = 0%, 1 = 25%, 2 = 50%, 3 = 75%, 4 = 100%)
	The speeds can be changed at any time. Changing the image in the middle of a map needs
	special 0x8E (DrawWholeMapView) afterwards.

	The image is loaded whenever the whole map is drawn (map loads, returning to the overworld,
	special 0x8E), and while it's loaded DrawMetatile leaves BG3 alone. Its tiles go in BG
	char block 3 after the text box frames, and its palette in PARALLAX_PAL_SLOT.
*/

#ifdef VAR_PARALLAX

//Built from graphics/Parallax/<name>.png
extern const u8 ParallaxDemoTiles[];
extern const u8 ParallaxDemoMap[];
extern const u16 ParallaxDemoPal[];
extern const u8 ParallaxTestTiles[];
extern const u8 ParallaxTestMap[];
extern const u16 ParallaxTestPal[];

struct ParallaxImage
{
	const u8* tiles; //LZ77 compressed, at most PARALLAX_MAX_TILES tiles
	const u8* tilemap; //LZ77 compressed, 32x32 tiles (256x256 image)
	const u16* palette; //16 colours
};

//Image 1 is sParallaxImages[0], and so on
static const struct ParallaxImage sParallaxImages[] =
{
	{ParallaxDemoTiles, ParallaxDemoMap, ParallaxDemoPal}, //1: coloured checkerboard, star marks the top-left corner
	{ParallaxTestTiles, ParallaxTestMap, ParallaxTestPal}, //2
};

#define PARALLAX_CHAR_BASE 3
#define PARALLAX_MAX_TILES (256 - PARALLAX_TILE_OFFSET) //The rest of char block 3 holds the BG tilemaps
#define PARALLAX_TILEMAP_ENTRIES (32 * 32)
#define TILE_NUM_MASK 0x3FF
#define TILE_PAL_SHIFT 12

#define GET_PARALLAX_IMAGE(var) ((var) >> 8)
#define GET_PARALLAX_X_SPEED(var) (((var) >> 4) & 0xF)
#define GET_PARALLAX_Y_SPEED(var) ((var) & 0xF)
#define MAX_SPEED 4 //100%

//Layer types as remapped by the triple layer block hack (assembly/triple_layer_blocks.s), whose
//DrawBlockHook isn't inserted when parallax is on, since ParallaxDrawMetatile replaces the whole function
enum
{
	LAYER_TYPE_NORMAL,   //Middle and top layers
	LAYER_TYPE_NORMAL_2, //Same as LAYER_TYPE_NORMAL
	LAYER_TYPE_COVERED,  //Bottom and middle layers
	LAYER_TYPE_TRIPLE,   //Bottom, middle and top layers (12 tiles)
	LAYER_TYPE_SPLIT,    //Bottom and top layers
};

#define TRANSPARENT_TILE 0
#define BOTTOM_LAYER_FILLER_TILE 0x3014 //Vanilla fills BG3 under normal blocks with this

struct ParallaxState
{
	u8 loadedImage; //0 = BG3 shows map tiles
	s16 anchorX; //Camera position in pixels + gTotalCameraPixelOffset. The camera position is anchor - total
	s16 anchorY;
};

#define sParallaxState ((struct ParallaxState*) 0x0203B7A0) //6 bytes, see ram_locs.h

extern u16* gBGTilemapBuffers1; //Middle layer, BG2
extern u16* gBGTilemapBuffers2; //Top layer, BG1
extern u16* gBGTilemapBuffers3; //Bottom layer, BG3
extern s16 sHorizontalCameraPan;
extern s16 sVerticalCameraPan;
void __attribute__((long_call)) DrawWholeMapViewInternal(int x, int y, const struct MapLayout* mapLayout);

static u8 GetWantedParallaxImage(void);
static bool8 LoadParallaxImage(u8 imageId);
static void LoadParallaxPalette(u8 imageId);
static void StopParallax(void);
static void Task_RefreshParallax(u8 taskId);

static u8 GetWantedParallaxImage(void)
{
	u8 imageId = GET_PARALLAX_IMAGE(VarGet(VAR_PARALLAX));

	if (imageId > ARRAY_COUNT(sParallaxImages))
		return 0;

	return imageId;
}

//Writes a metatile layer (a 2x2 block of tiles) to a BG tilemap buffer
static void DrawMetatileLayer(u16* tilemap, u16 offset, const u16* tiles)
{
	tilemap[offset] = tiles[0];
	tilemap[offset + 1] = tiles[1];
	tilemap[offset + 0x20] = tiles[2];
	tilemap[offset + 0x21] = tiles[3];
}

//Fills a metatile layer (a 2x2 block of tiles) of a BG tilemap buffer with one tile
static void FillMetatileLayer(u16* tilemap, u16 offset, u16 tile)
{
	tilemap[offset] = tile;
	tilemap[offset + 1] = tile;
	tilemap[offset + 0x20] = tile;
	tilemap[offset + 0x21] = tile;
}

//Replaces the vanilla DrawMetatile (0x805A9B4), including the triple layer block hack's changes.
//The same, except BG3 is left alone while a parallax image is loaded
void ParallaxDrawMetatile(s32 metatileLayerType, const u16* tiles, u16 offset)
{
	bool8 drawBottomLayer = sParallaxState->loadedImage == 0;

	switch (metatileLayerType)
	{
		case LAYER_TYPE_NORMAL:
		case LAYER_TYPE_NORMAL_2:
			if (drawBottomLayer)
				FillMetatileLayer(gBGTilemapBuffers3, offset, BOTTOM_LAYER_FILLER_TILE);
			DrawMetatileLayer(gBGTilemapBuffers1, offset, &tiles[0]); //Metatile's bottom layer on the middle BG
			DrawMetatileLayer(gBGTilemapBuffers2, offset, &tiles[4]); //Metatile's top layer on the top BG, which covers sprites
			break;
		case LAYER_TYPE_COVERED:
			if (drawBottomLayer)
				DrawMetatileLayer(gBGTilemapBuffers3, offset, &tiles[0]);
			DrawMetatileLayer(gBGTilemapBuffers1, offset, &tiles[4]);
			FillMetatileLayer(gBGTilemapBuffers2, offset, TRANSPARENT_TILE);
			break;
		case LAYER_TYPE_TRIPLE:
			if (drawBottomLayer)
				DrawMetatileLayer(gBGTilemapBuffers3, offset, &tiles[0]);
			DrawMetatileLayer(gBGTilemapBuffers1, offset, &tiles[4]);
			DrawMetatileLayer(gBGTilemapBuffers2, offset, &tiles[8]);
			break;
		case LAYER_TYPE_SPLIT:
			if (drawBottomLayer)
				DrawMetatileLayer(gBGTilemapBuffers3, offset, &tiles[0]);
			FillMetatileLayer(gBGTilemapBuffers1, offset, TRANSPARENT_TILE);
			DrawMetatileLayer(gBGTilemapBuffers2, offset, &tiles[4]);
			break;
		//Anything else draws nothing, like the triple layer block hack
	}

	ScheduleBgCopyTilemapToVram(1);
	ScheduleBgCopyTilemapToVram(2);
	ScheduleBgCopyTilemapToVram(3);
}

//Replaces the vanilla DrawWholeMapView (0x805A684), which runs at the end of every map load,
//when returning to the overworld, and for special 0x8E
void ParallaxDrawWholeMapView(void)
{
	u8 wantedImage = GetWantedParallaxImage();

	if (wantedImage != 0)
	{
		//InitOverworldBgs resets BG3's char base and gives it a new tilemap buffer, so reload after it too
		if (sParallaxState->loadedImage != wantedImage || GetBgAttribute(3, BG_ATTR_CHARBASEINDEX) != PARALLAX_CHAR_BASE)
		{
			if (!LoadParallaxImage(wantedImage))
				StopParallax();
		}
	}
	else if (sParallaxState->loadedImage != 0 || GetBgAttribute(3, BG_ATTR_CHARBASEINDEX) == PARALLAX_CHAR_BASE)
		StopParallax(); //The map is drawn into BG3 again right below

	DrawWholeMapViewInternal(gSaveBlock1->pos.x, gSaveBlock1->pos.y, gMapHeader.mapLayout);
}

static bool8 LoadParallaxImage(u8 imageId)
{
	u32 i;
	const struct ParallaxImage* image = &sParallaxImages[imageId - 1];
	u32 tilesSize = *((const u32*) image->tiles) >> 8; //Decompressed size, from the LZ77 header

	if (tilesSize > PARALLAX_MAX_TILES * TILE_SIZE_4BPP) //Would spill into the tilemaps
		return FALSE;

	LZDecompressVram(image->tiles, (void*) (BG_CHAR_ADDR(PARALLAX_CHAR_BASE) + PARALLAX_TILE_OFFSET * TILE_SIZE_4BPP));
	LZDecompressWram(image->tilemap, gBGTilemapBuffers3);

	for (i = 0; i < PARALLAX_TILEMAP_ENTRIES; ++i) //Point the tilemap at where the tiles and palette really are
	{
		u16 entry = gBGTilemapBuffers3[i];
		gBGTilemapBuffers3[i] = (entry & ~(TILE_NUM_MASK | (0xF << TILE_PAL_SHIFT)))
							  | ((entry & TILE_NUM_MASK) + PARALLAX_TILE_OFFSET)
							  | (PARALLAX_PAL_SLOT << TILE_PAL_SHIFT);
	}

	LoadParallaxPalette(imageId);
	SetBgAttribute(3, BG_ATTR_CHARBASEINDEX, PARALLAX_CHAR_BASE);
	ShowBg(3); //Applies the new char base
	ScheduleBgCopyTilemapToVram(3);

	//The camera is lined up with the map's tiles whenever the whole map is drawn
	sParallaxState->anchorX = gSaveBlock1->pos.x * 16 + (s16) gTotalCameraPixelOffsetX;
	sParallaxState->anchorY = gSaveBlock1->pos.y * 16 + (s16) gTotalCameraPixelOffsetY;
	sParallaxState->loadedImage = imageId;
	return TRUE;
}

static void LoadParallaxPalette(u8 imageId)
{
	LoadPalette(sParallaxImages[imageId - 1].palette, PARALLAX_PAL_SLOT * 16, 16 * sizeof(u16));
	ApplyWeatherGammaShiftToPal(PARALLAX_PAL_SLOT);
}

static void StopParallax(void)
{
	SetBgAttribute(3, BG_ATTR_CHARBASEINDEX, 0); //Back to the map tiles
	ShowBg(3);
	sParallaxState->loadedImage = 0;
}

//Called from RunOnResumeMapScript. Walking across a map connection loads the new map's
//secondary tileset palettes and runs its scripts, but doesn't redraw the whole map
void TryRefreshParallaxAfterConnection(void)
{
	if (gMain.callback2 != CB2_Overworld) //A normal map load, which draws the whole map later anyway
		return;

	if (GetWantedParallaxImage() == sParallaxState->loadedImage)
	{
		if (sParallaxState->loadedImage != 0)
			LoadParallaxPalette(sParallaxState->loadedImage); //The secondary tileset may have overwritten it
	}
	else if (!FuncIsActiveTask(Task_RefreshParallax))
		CreateTask(Task_RefreshParallax, 80); //This runs in the middle of moving the camera, so redraw once it's done
}

static void Task_RefreshParallax(u8 taskId)
{
	ParallaxDrawWholeMapView();
	DestroyTask(taskId);
}

//Called every VBlank, after the vanilla code has set the BG scroll registers
void UpdateParallaxScroll(void)
{
	u16 var;
	s32 cameraX, cameraY;

	if (sParallaxState->loadedImage == 0 || gMain.callback2 != CB2_Overworld)
		return;

	var = VarGet(VAR_PARALLAX);
	u32 speedX = min(GET_PARALLAX_X_SPEED(var), MAX_SPEED);
	u32 speedY = min(GET_PARALLAX_Y_SPEED(var), MAX_SPEED);

	cameraX = sParallaxState->anchorX - (s16) gTotalCameraPixelOffsetX + sHorizontalCameraPan;
	cameraY = sParallaxState->anchorY - (s16) gTotalCameraPixelOffsetY + sVerticalCameraPan;

	//Shift rather than divide, so negative positions round the same way as positive ones (MAX_SPEED is 4)
	SetGpuReg(REG_OFFSET_BG3HOFS, ((cameraX * (s32) speedX) >> 2) & 0x1FF);
	SetGpuReg(REG_OFFSET_BG3VOFS, ((cameraY * (s32) speedY) >> 2) & 0x1FF);
}

#endif
