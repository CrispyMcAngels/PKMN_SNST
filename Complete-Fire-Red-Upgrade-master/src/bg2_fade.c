#include "defines.h"
#include "../include/gpu_regs.h"
#include "../include/overworld.h"
#include "../include/scanline_effect.h"

#include "../include/new/bg2_fade.h"
/*
bg2_fade.c
	handles the BG2 fade effect: a Flash-like circle around the centre of the screen.
	Inside the circle BG2 is drawn normally, in a ring BG2_FADE_RING_WIDTH pixels wide
	around it BG2 is blended with the layers under it, and outside the ring BG2 is hidden.
	Every other layer and all sprites stay visible.

	The GBA can't blend by distance from a point, so the effect is built per scanline:
		- WIN0 is the inner circle and WIN1 the outer circle, with their horizontal bounds
		  changed on every scanline (vanilla Flash does the same for its single circle).
		- A scanline can only show BG2 at 3 strengths (full, one blend, hidden). With
		  BG2_FADE_DITHERED, even and odd scanlines split the ring differently, which the eye
		  averages into 3 steps all around the circle. Without it, BLDALPHA changes per scanline
		  instead, so only the parts of the ring above and below the inner circle fade out.
	Each scanline's registers, WIN0H through BLDALPHA, are copied by DMA 0 during HBlank from
	a table rebuilt whenever the radius changes. The DMA is re-armed every VBlank.

	Turned on by setting VAR_BG2_FADE_RADIUS to the inner radius in pixels, and updated every
	frame from TransferPlttBuffer (VBlank). It steps aside whenever something else owns the
	windows: vanilla Flash darkness, other scanline effects, battle transitions, or any
	HBlank callback.
*/

#ifdef VAR_BG2_FADE_RADIUS

#define CENTRE_X (DISPLAY_WIDTH / 2) //Same centre as vanilla Flash
#define CENTRE_Y (DISPLAY_HEIGHT / 2)
#define MAX_RADIUS DISPLAY_WIDTH

#define OUTSIDE_LAYERS (WINOUT_WIN01_BG0 | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ) //Everything but BG2
#define BG2_FADE_WININ (WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ | WININ_WIN1_CLR) //Only the ring blends
#define BG2_FADE_WINOUT (OUTSIDE_LAYERS | (OUTSIDE_LAYERS << 8)) //The OBJ window region (upper byte) acts like the outside
#define BG2_FADE_BLDCNT (BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | (BLDCNT_TGT2_ALL & ~BLDCNT_TGT2_BG2))
#define BG2_FADE_WINV WIN_RANGE(0, DISPLAY_HEIGHT)
#define BG2_FADE_DISPCNT (DISPCNT_WIN0_ON | DISPCNT_WIN1_ON)

struct Bg2FadeLine //The registers from WIN0H to BLDALPHA, in order, as the DMA copies them
{
	u16 win0h;
	u16 win1h;
	u16 win0v;
	u16 win1v;
	u16 winin;
	u16 winout;
	u16 mosaic;
	u16 unused; //0x400004E
	u16 bldcnt;
	u16 bldalpha;
};

#define NUM_TABLE_LINES (DISPLAY_HEIGHT + 1) //The DMA also reads one line in the HBlank after the last visible line
#define DMA_WORDS_PER_LINE (sizeof(struct Bg2FadeLine) / sizeof(u32))
#define BG2_FADE_DMACNT (((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_SRC_INC | DMA_DEST_RELOAD | DMA_32BIT) << 16) | DMA_WORDS_PER_LINE)

//The table uses 3220 of the 3840 bytes of the scanline effect buffers. They're free while the
//effect runs, since the effect stops whenever a scanline effect (like Flash darkness) is active
#define sBg2FadeTable ((struct Bg2FadeLine*) gScanlineEffectRegBuffers)

enum BandEdges //Circles bounding WIN0 (inner) and WIN1 (outer) on even and odd scanlines
{
	EVEN_INNER,
	EVEN_OUTER,
	ODD_INNER,
	ODD_OUTER,
	NUM_EDGES,
};

struct Bg2FadeState
{
	bool8 active;
	u8 builtRadius; //Radius the table was built for (0 = needs rebuilding)
	u16 savedDispcntWindows; //Restored when the var is cleared
	u16 builtMosaic; //MOSAIC is in the DMA'd block, so the table has to follow its buffered value
};

#define sBg2FadeState ((struct Bg2FadeState*) 0x0203B798) //6 bytes, see ram_locs.h

static bool8 CanUseBg2Fade(void);
static void StartBg2Fade(void);
static void StopBg2Fade(bool8 restoreDispcnt);
static void ArmBg2FadeDma(void);
static void BuildBg2FadeTable(u32 radius);
static u16 GetWindowRangeForHalfWidth(s32 halfWidth);
#ifndef BG2_FADE_DITHERED
static u16 GetRingBlend(u32 dy, u32 radius);
#endif

//Called every frame from TransferPlttBuffer
void UpdateBg2FadeEffect(void)
{
	u32 radius = VarGet(VAR_BG2_FADE_RADIUS);

	if (radius != 0 && CanUseBg2Fade())
	{
		if (radius > MAX_RADIUS)
			radius = MAX_RADIUS;

		if (!sBg2FadeState->active)
			StartBg2Fade();

		if (sBg2FadeState->builtRadius != radius || sBg2FadeState->builtMosaic != GetGpuReg(REG_OFFSET_MOSAIC))
		{
			BuildBg2FadeTable(radius);
			sBg2FadeState->builtRadius = radius;
		}

		if ((GetGpuReg(REG_OFFSET_DISPCNT) & BG2_FADE_DISPCNT) != BG2_FADE_DISPCNT)
			SetGpuReg(REG_OFFSET_DISPCNT, GetGpuReg(REG_OFFSET_DISPCNT) | BG2_FADE_DISPCNT);

		ArmBg2FadeDma();
	}
	else if (sBg2FadeState->active)
		StopBg2Fade(radius == 0 && CanUseBg2Fade()); //Only touch DISPCNT if the overworld still owns it
}

static bool8 CanUseBg2Fade(void)
{
	return gMain.callback2 == CB2_Overworld
		&& gMain.hblankCallback == NULL //Battle transitions and the like change the windows themselves
		&& gScanlineEffect.state == 0 //Flash darkness and other scanline effects own DMA 0
		&& Overworld_GetFlashLevel() == 0;
}

static void StartBg2Fade(void)
{
	sBg2FadeState->savedDispcntWindows = GetGpuReg(REG_OFFSET_DISPCNT) & BG2_FADE_DISPCNT;
	sBg2FadeState->builtRadius = 0;
	sBg2FadeState->active = TRUE;
}

static void StopBg2Fade(bool8 restoreDispcnt)
{
	u32 regOffset;

	if (gScanlineEffect.state == 0) //Otherwise a scanline effect has already taken DMA 0 over
		DmaStop(0);

	//The DMA wrote these straight to the hardware, so their buffered values are the ones to go back to
	for (regOffset = REG_OFFSET_WIN0H; regOffset <= REG_OFFSET_BLDALPHA; regOffset += sizeof(u16))
	{
		if (regOffset != REG_OFFSET_MOSAIC + sizeof(u16)) //Unused register
			SetGpuReg(regOffset, GetGpuReg(regOffset));
	}

	if (restoreDispcnt)
		SetGpuReg(REG_OFFSET_DISPCNT, (GetGpuReg(REG_OFFSET_DISPCNT) & ~BG2_FADE_DISPCNT) | sBg2FadeState->savedDispcntWindows);

	sBg2FadeState->builtRadius = 0;
	sBg2FadeState->active = FALSE;
}

//Runs in VBlank. The DMA's source keeps moving forward, so it has to be restarted from the top every frame
static void ArmBg2FadeDma(void)
{
	u32 i;
	const u32* src = (const u32*) &sBg2FadeTable[0];
	vu32* dest = (vu32*) REG_ADDR_WIN0H;

	DmaStop(0);

	for (i = 0; i < DMA_WORDS_PER_LINE; ++i) //Line 0 is drawn before the first HBlank, so set it up now
		dest[i] = src[i];

	DmaSet(0, &sBg2FadeTable[1], REG_ADDR_WIN0H, BG2_FADE_DMACNT); //Each HBlank sets up the next line
}

static void BuildBg2FadeTable(u32 radius)
{
	u32 i, dy, line;
	u32 edgeRadii[NUM_EDGES];
	s32 halfWidths[NUM_EDGES];
	u16 mosaic = GetGpuReg(REG_OFFSET_MOSAIC);

	#ifdef BG2_FADE_DITHERED
	//Split the band into thirds. Even lines: 100% | ring | ring. Odd lines: ring | ring | hidden.
	//With the ring at 50%, alternating them looks like 75% | 50% | 25%
	edgeRadii[EVEN_INNER] = radius + BG2_FADE_RING_WIDTH / 3;
	edgeRadii[EVEN_OUTER] = radius + BG2_FADE_RING_WIDTH;
	edgeRadii[ODD_INNER] = radius;
	edgeRadii[ODD_OUTER] = radius + (BG2_FADE_RING_WIDTH * 2) / 3;
	#else
	edgeRadii[EVEN_INNER] = edgeRadii[ODD_INNER] = radius;
	edgeRadii[EVEN_OUTER] = edgeRadii[ODD_OUTER] = radius + BG2_FADE_RING_WIDTH;
	#endif

	for (i = 0; i < NUM_EDGES; ++i)
		halfWidths[i] = edgeRadii[i];

	for (dy = 0; dy <= CENTRE_Y; ++dy)
	{
		//The circles only get narrower further from the centre, so shrink the half widths until they fit this line
		for (i = 0; i < NUM_EDGES; ++i)
		{
			while (halfWidths[i] >= 0 && (u32) (halfWidths[i] * halfWidths[i]) + dy * dy > edgeRadii[i] * edgeRadii[i])
				--halfWidths[i];
		}

		//Lines above and below the centre mirror each other
		for (i = 0; i < 2; ++i)
		{
			line = (i == 0) ? CENTRE_Y - dy : CENTRE_Y + dy;
			if (line >= DISPLAY_HEIGHT || (i == 1 && dy == 0))
				continue;

			bool8 odd = line & 1;
			struct Bg2FadeLine* lineRegs = &sBg2FadeTable[line];
			lineRegs->win0h = GetWindowRangeForHalfWidth(halfWidths[odd ? ODD_INNER : EVEN_INNER]);
			lineRegs->win1h = GetWindowRangeForHalfWidth(halfWidths[odd ? ODD_OUTER : EVEN_OUTER]);
			lineRegs->win0v = BG2_FADE_WINV;
			lineRegs->win1v = BG2_FADE_WINV;
			lineRegs->winin = BG2_FADE_WININ;
			lineRegs->winout = BG2_FADE_WINOUT;
			lineRegs->mosaic = mosaic;
			lineRegs->unused = 0;
			lineRegs->bldcnt = BG2_FADE_BLDCNT;
			#ifdef BG2_FADE_DITHERED
			//Even lines' ring covers the outer thirds and odd lines' the inner thirds, so a weaker even ring
			//and a stronger odd ring bring each pair of lines closer together (less visible line texture)
			u32 bg2Weight = odd ? BG2_FADE_RING_ALPHA + BG2_FADE_DITHER_SOFTEN : BG2_FADE_RING_ALPHA - BG2_FADE_DITHER_SOFTEN;
			lineRegs->bldalpha = BLDALPHA_BLEND(bg2Weight, 16 - bg2Weight);
			#else
			lineRegs->bldalpha = GetRingBlend(dy, radius);
			#endif
		}
	}

	sBg2FadeTable[DISPLAY_HEIGHT] = sBg2FadeTable[0]; //Read in the HBlank after the last line, while the screen is in VBlank
	sBg2FadeState->builtMosaic = mosaic;
}

static u16 GetWindowRangeForHalfWidth(s32 halfWidth)
{
	s32 left, right;

	if (halfWidth < 0) //The circle doesn't reach this line
		return WIN_RANGE(0, 0);

	left = CENTRE_X - halfWidth;
	right = CENTRE_X + halfWidth + 1; //The right bound is exclusive

	if (left < 0)
		left = 0;
	if (right > DISPLAY_WIDTH)
		right = DISPLAY_WIDTH;

	return WIN_RANGE(left, right);
}

#ifndef BG2_FADE_DITHERED
//Only used on the ring (WIN1 is the only region with colour effects)
static u16 GetRingBlend(u32 dy, u32 radius)
{
	u32 bg2Weight = BG2_FADE_RING_ALPHA; //Left and right sides of the ring

	if (dy > radius + BG2_FADE_RING_WIDTH) //Past the outer circle, so no ring on this line
		bg2Weight = 0;
	else if (dy > radius) //Above or below the inner circle: fade out towards the outer edge
		bg2Weight -= (BG2_FADE_RING_ALPHA * (dy - radius)) / (BG2_FADE_RING_WIDTH + 1);

	return BLDALPHA_BLEND(bg2Weight, 16 - bg2Weight);
}
#endif

#endif
