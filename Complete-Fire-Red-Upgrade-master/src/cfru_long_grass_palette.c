#include "defines.h"
#include "../include/constants/field_effects.h"
#include "../include/constants/metatile_behaviors.h"
#include "../include/field_effect.h"
#include "../include/field_effect_helpers.h"
#include "../include/fieldmap.h"

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

#define CFRU_TALL_GRASS_BEHAVIOR_BROWN MB_01
#define CFRU_TALL_GRASS_BEHAVIOR_RICEFIELD MB_04
#define CFRU_TALL_GRASS_BEHAVIOR_RED   MB_09
#define FLDEFF_PAL_TAG_GENERAL_1 0x1005




extern void FldEff_TallGrass(void);

/*
 * Yellow palette for CFRU_TALL_GRASS_BEHAVIOR_BROWN (MB_01).
 * Edit colors as needed; index 0 is transparent.
 */
static const u16 sCfruBrownGrassPalette[] =
{
    RGB(31, 0, 29),
    RGB(25, 20, 11), //used
    RGB(28, 0, 0),
    RGB(27, 19, 7), //used
    RGB(23, 15, 6), //used
    RGB(10, 0, 0),
    RGB(12, 22, 29),
    RGB(12, 22, 24),
    RGB(17, 25, 30),
    RGB(18, 28, 31),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(30, 22, 14), //used
    RGB(28, 21, 11), //used
    RGB(23, 15, 6), //used
    RGB(25, 20, 11), //used
};

/*
 * Yellow palette for CFRU_TALL_GRASS_BEHAVIOR_RICEFIELD (MB_04).
 * Edit colors as needed; index 0 is transparent.
 */
static const u16 sCfruRicefieldGrassPalette[] =
{
    RGB(31, 0, 29),
    RGB(24, 27, 15), //used
    RGB(28, 0, 0),
    RGB(13, 22, 11), //used
    RGB(9, 17, 7), //used
    RGB(10, 0, 0),
    RGB(12, 22, 29),
    RGB(12, 22, 24),
    RGB(17, 25, 30),
    RGB(18, 28, 31),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(14, 26, 11), //used
    RGB(13, 20, 11), //used
    RGB(14, 21, 21), //used
    RGB(19, 26, 26), //used
};


/*
 * Red palette for CFRU_TALL_GRASS_BEHAVIOR_RED (MB_09).
 * Edit colors as needed; index 0 is transparent.
 */
static const u16 sCfruRedGrassPalette[] =
{
    RGB(31, 0, 29),
    RGB(29, 17, 19), //used
    RGB(9, 17, 7), 
    RGB(22, 7, 7), //used
    RGB(15, 5, 5), //used
    RGB(10, 13, 9), 
    RGB(16, 23, 23),
    RGB(12, 22, 24),
    RGB(17, 25, 30),
    RGB(19, 26, 26), //used   
    RGB(24, 27, 15), //used
    RGB(14, 26, 11),
    RGB(27, 12, 11), //used
    RGB(26, 10, 8), //used
    RGB(26, 10, 8), //used
    RGB(29, 17, 19), //used
};

bool8 CfruMetatileBehavior_IsTallGrass(u8 metatileBehavior)
{
    return metatileBehavior == MB_TALL_GRASS
        || metatileBehavior == CFRU_TALL_GRASS_BEHAVIOR_BROWN
        || metatileBehavior == CFRU_TALL_GRASS_BEHAVIOR_RICEFIELD
        || metatileBehavior == CFRU_TALL_GRASS_BEHAVIOR_RED;
}

static void LoadCfruTallGrassPalette(u8 metatileBehavior)
{
    const u16 *palette;
    u8 paletteNum;

    switch (metatileBehavior)
    {
    case CFRU_TALL_GRASS_BEHAVIOR_BROWN:
        palette = sCfruBrownGrassPalette;
        break;
    case CFRU_TALL_GRASS_BEHAVIOR_RICEFIELD:
        palette = sCfruRicefieldGrassPalette;
        break;
    case CFRU_TALL_GRASS_BEHAVIOR_RED:
        palette = sCfruRedGrassPalette;
        break;
    default:
        return; /* normal tall grass — leave palette untouched */
    }

    paletteNum = IndexOfSpritePaletteTag(FLDEFF_PAL_TAG_GENERAL_1);
    if (paletteNum != 0xFF)
        LoadPalette(palette, 0x100 + paletteNum * 16, 16 * sizeof(u16));
}

void FldEff_CfruTallGrass(void)
{
    u8 behavior = MapGridGetMetatileBehaviorAt(gFieldEffectArguments[0], gFieldEffectArguments[1]);
    LoadCfruTallGrassPalette(behavior);
    FldEff_TallGrass();
}

void FldEff_CfruJumpTallGrass(void)
{
    u8 behavior = MapGridGetMetatileBehaviorAt(gFieldEffectArguments[0], gFieldEffectArguments[1]);
    LoadCfruTallGrassPalette(behavior);
    FldEff_JumpTallGrass();
}
