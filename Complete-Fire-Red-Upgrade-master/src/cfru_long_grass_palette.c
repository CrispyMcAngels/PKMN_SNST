#include "defines.h"
#include "../include/constants/field_effects.h"
#include "../include/constants/metatile_behaviors.h"
#include "../include/field_effect_helpers.h"

/*
 * CFRU Tall Grass palette variant
 *
 * This module reuses gFieldEffectObjectTemplate_TallGrass and
 * gFieldEffectObjectTemplate_JumpTallGrass. Only the OBJ palette is replaced.
 *
 * Integration in a CFRU build:
 * 1. Insert this file in the C build.
 * 2. Assign CFRU_TALL_GRASS_BEHAVIOR to the alternate metatile behavior.
 * 3. Hook MetatileBehavior_IsTallGrass to CfruMetatileBehavior_IsTallGrass.
 * 4. Replace the native pointer in gFieldEffectScript_TallGrass:
 *        FldEff_TallGrass -> FldEff_CfruTallGrass
 * 5. Replace the native pointer in gFieldEffectScript_JumpTallGrass:
 *        FldEff_JumpTallGrassLoadPalette -> FldEff_CfruJumpTallGrass
 *
 * MB_01 is used as the alternate behavior so existing tall grass (MB_TALL_GRASS)
 * still triggers the effect normally. Mark the desired alternate metatiles
 * with behavior 0x01 in the map editor.
 *
 * The original templates use FLDEFF_PAL_TAG_GENERAL_1, a shared field-effect
 * palette slot. This is appropriate when the custom palette grass is the only
 * effect on screen using a recolor; simultaneous effects using that same slot
 * inherit the most recently loaded palette.
 */

#define CFRU_TALL_GRASS_BEHAVIOR MB_01
#define FLDEFF_PAL_TAG_GENERAL_1 0x1005

extern void FldEff_TallGrass(void);

/*
 * Brown example palette for the original TallGrass graphics. Edit these
 * colors to match the alternate metatiles; index 0 remains transparent.
 */
static const u16 sCfruLongGrassPalette[] =
{
    RGB(31, 0, 29),
    RGB(31, 27, 15),
    RGB(26, 20, 9),
    RGB(19, 12, 4),
    RGB(12, 7, 2),
    RGB(7, 4, 1),
    RGB(12, 22, 29),
    RGB(12, 22, 24),
    RGB(17, 25, 30),
    RGB(18, 28, 31),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(28, 23, 14),
    RGB(23, 17, 8),
    RGB(17, 11, 4),
    RGB(11, 7, 2),
};

bool8 CfruMetatileBehavior_IsTallGrass(u8 metatileBehavior)
{
    return metatileBehavior == MB_TALL_GRASS || metatileBehavior == CFRU_TALL_GRASS_BEHAVIOR;
}

static void LoadCfruTallGrassPalette(void)
{
    u8 paletteNum = IndexOfSpritePaletteTag(FLDEFF_PAL_TAG_GENERAL_1);

    if (paletteNum != 0xFF)
        LoadPalette(sCfruLongGrassPalette, 0x100 + paletteNum * 16, sizeof(sCfruLongGrassPalette));
}

void FldEff_CfruTallGrass(void)
{
    LoadCfruTallGrassPalette();
    FldEff_TallGrass();
}

void FldEff_CfruJumpTallGrass(void)
{
    LoadCfruTallGrassPalette();
    FldEff_JumpTallGrass();
}
