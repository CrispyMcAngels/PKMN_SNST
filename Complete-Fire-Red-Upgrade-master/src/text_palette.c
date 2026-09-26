#include "defines.h"

/**
 * \file text_palette.c
 * \brief Lets a var replace one color of the standard text palette at runtime.
 */

#define sStdTextPalettes ((const u16*) 0x08471DEC) //5 palettes of 16 colors
#define sCustomStdTextPal ((u16*) 0x0203B774) //32 bytes: RAM copy of the first palette with the custom color
#define NUM_STD_TEXT_PALETTES 5
#define NUM_BG_PALETTES 16

//This file's functions:
static bool8 IsStdTextPaletteLoadedAt(const u16* loadedPal);

//Hooked in at 0x8150408 (stdpal_get)
const u16* GetStdTextPalette(u8 id)
{
	if (id >= NUM_STD_TEXT_PALETTES)
		id = NUM_STD_TEXT_PALETTES - 1;

	#ifdef VAR_TEXT_PAL_CUSTOM_COLOR
	u16 customColor = VarGet(VAR_TEXT_PAL_CUSTOM_COLOR);
	if (id == 0 && customColor != 0)
	{
		memcpy(sCustomStdTextPal, sStdTextPalettes, 16 * sizeof(u16));
		sCustomStdTextPal[TEXT_PAL_CUSTOM_COLOR_SLOT] = customColor & 0x7FFF; //Bit 15 is unused by the GBA, so 0x8000 is black
		return sCustomStdTextPal;
	}
	#endif

	return &sStdTextPalettes[id * 16];
}

//Compares everything but the custom color, since it may hold an older custom value
static bool8 IsStdTextPaletteLoadedAt(const u16* loadedPal)
{
	for (u32 i = 0; i < 16; ++i)
	{
		if (i != TEXT_PAL_CUSTOM_COLOR_SLOT && loadedPal[i] != sStdTextPalettes[i])
			return FALSE;
	}

	return TRUE;
}

//@Details: Applies VAR_TEXT_PAL_CUSTOM_COLOR to the text boxes already loaded on screen.
//			Without it, the new color shows up the next time the text box graphics are loaded.
void RefreshStdTextPalette(void)
{
	#ifdef VAR_TEXT_PAL_CUSTOM_COLOR
	u16 newColor = GetStdTextPalette(0)[TEXT_PAL_CUSTOM_COLOR_SLOT];

	for (u32 palNum = 0; palNum < NUM_BG_PALETTES; ++palNum)
	{
		u16* unfaded = &gPlttBufferUnfaded[palNum * 16];
		u16* faded = &gPlttBufferFaded[palNum * 16];

		if (!IsStdTextPaletteLoadedAt(unfaded))
			continue;

		if (faded[TEXT_PAL_CUSTOM_COLOR_SLOT] == unfaded[TEXT_PAL_CUSTOM_COLOR_SLOT]) //Not in the middle of a screen fade
			faded[TEXT_PAL_CUSTOM_COLOR_SLOT] = newColor;
		unfaded[TEXT_PAL_CUSTOM_COLOR_SLOT] = newColor;
	}
	#endif
}
