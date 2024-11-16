#include "../defines.h"
#include "../../include/constants/event_objects.h"

#define EVENT_OBJ_PAL_TAG_NONE 0x1102
#define gEventObjectBaseOam_16x16 ((const struct OamData*) 0x83A36F8)
#define gEventObjectBaseOam_16x32 ((const struct OamData*) 0x83A3710)
#define gEventObjectBaseOam_32x32 ((const struct OamData*) 0x83A3718)
#define gEventObjectBaseOam_64x64 ((const struct OamData*) 0x83A3720)
#define gEventObjectSpriteOamTables_16x16 ((const struct SubspriteTable*) 0x83A3748)
#define gEventObjectSpriteOamTables_16x32 ((const struct SubspriteTable*) 0x83A379C)
#define gEventObjectSpriteOamTables_32x32 ((const struct SubspriteTable*) 0x83A37F0)
#define gEventObjectSpriteOamTables_64x64 ((const struct SubspriteTable*) 0x83A38D0)
#define gEventObjectImageAnimTable_PlayerNormal ((const union AnimCmd* const*) 0x83A3470)
#define gEventObjectImageAnimTable_Standard ((const union AnimCmd* const*) 0x83A3368)
#define gEventObjectImageAnimTable_Surfing ((const union AnimCmd* const*) 0x83A3584)
#define gEventObjectImageAnimTable_FieldMove ((const union AnimCmd* const*) 0x83A3638)
#define gEventObjectImageAnimTable_Fishing ((const union AnimCmd* const*) 0x83A3668)
#define gEventObjectImageAnimTable_VsSeekerBike ((const union AnimCmd* const*) 0x83A3640)


//NPC0__PLAYER

    extern const u8 gEventsObjectPic_NPC0Tiles[];
    extern const u16 gEventsObjectPic_NPC0Pal[];

    static const struct SpriteFrameImage gEventObjectPicTable_NPC0[] =
    {
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 0),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 1),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 2),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 3),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 4),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 5),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 6),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 7),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 8),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 9),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 10),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 11),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 12),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 13),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 14),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 15),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 16),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 17),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 18),
        overworld_frame(gEventsObjectPic_NPC0Tiles, 4, 4, 19),
    };

    const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC0 =
    {
        .tileTag = 0xFFFF,
        .paletteTag1 = 0x1100,
        .paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
        .size = (32 * 32) / 2,
        .width = 32,
        .height = 32,
        .paletteSlot = 0,
        .shadowSize = SHADOW_SIZE_M, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
        .inanimate = FALSE,
        .disableReflectionPaletteLoad = FALSE,
        .tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
        .gender = MALE, //Can also be FEMALE
        .oam = gEventObjectBaseOam_32x32,
        .subspriteTables = gEventObjectSpriteOamTables_32x32,
        .anims = gEventObjectImageAnimTable_Standard,
        .images = gEventObjectPicTable_NPC0,
        .affineAnims = gDummySpriteAffineAnimTable,
    };

//NPC18__BULLY

    extern const u8 gEventsObjectPic_NPC18Tiles[];
    extern const u16 gEventsObjectPic_NPC18Pal[];

    static const struct SpriteFrameImage gEventObjectPicTable_NPC18[] =
    {
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 0),
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 1),
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 2),
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 3),
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 4),
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 5),
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 6),
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 7),
        overworld_frame(gEventsObjectPic_NPC18Tiles, 4, 4, 8),

    };

    const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC18 =
    {
        .tileTag = 0xFFFF,
        .paletteTag1 = 0x114F,
        .paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
        .size = (32 * 32) / 2,
        .width = 32,
        .height = 32,
        .paletteSlot = 0,
        .shadowSize = SHADOW_SIZE_M, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
        .inanimate = FALSE,
        .disableReflectionPaletteLoad = FALSE,
        .tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
        .gender = MALE, //Can also be FEMALE
        .oam = gEventObjectBaseOam_32x32,
        .subspriteTables = gEventObjectSpriteOamTables_32x32,
        .anims = gEventObjectImageAnimTable_Standard,
        .images = gEventObjectPicTable_NPC18,
        .affineAnims = gDummySpriteAffineAnimTable,
    };

//NPC20_BUG_CATCHER

    extern const u8 gEventsObjectPic_NPC20Tiles[];
    extern const u16 gEventsObjectPic_NPC20Pal[];

    static const struct SpriteFrameImage gEventObjectPicTable_NPC20[] =
    {
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 0),
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 1),
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 2),
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 3),
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 4),
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 5),
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 6),
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 7),
        overworld_frame(gEventsObjectPic_NPC20Tiles, 4, 4, 8),

    };

    const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC20 =
    {
        .tileTag = 0xFFFF,
        .paletteTag1 = 0x1150,
        .paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
        .size = (32 * 32) / 2,
        .width = 32,
        .height = 32,
        .paletteSlot = 0,
        .shadowSize = SHADOW_SIZE_M, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
        .inanimate = FALSE,
        .disableReflectionPaletteLoad = FALSE,
        .tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
        .gender = MALE, //Can also be FEMALE
        .oam = gEventObjectBaseOam_32x32,
        .subspriteTables = gEventObjectSpriteOamTables_32x32,
        .anims = gEventObjectImageAnimTable_Standard,
        .images = gEventObjectPicTable_NPC20,
        .affineAnims = gDummySpriteAffineAnimTable,
    };