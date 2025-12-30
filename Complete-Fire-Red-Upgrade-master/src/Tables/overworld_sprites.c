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
#define gEventObjectImageAnimTable_CutTree ((const union AnimCmd* const*) 0x83A3660)

//NPC0__PLAYER

    extern const u8 gEventsObjectPic_NPC0Tiles[];

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
        .anims = gEventObjectImageAnimTable_PlayerNormal,
        .images = gEventObjectPicTable_NPC0,
        .affineAnims = gDummySpriteAffineAnimTable,
    };

//_____NPC3_____

	extern const u8 gEventsObjectPic_NPC3Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC3[] =
	{
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC3Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC3 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1100,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_FieldMove,
		.images = gEventObjectPicTable_NPC3,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC14_____

	extern const u8 gEventsObjectPic_NPC14Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC14[] =
	{
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC14Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC14 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1103,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC14,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC15_____

	extern const u8 gEventsObjectPic_NPC15Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC15[] =
	{
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC15Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC15 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1104,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC15,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC16_____

	extern const u8 gEventsObjectPic_NPC16Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC16[] =
	{
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC16Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC16 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1105,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC16,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC17_____

	extern const u8 gEventsObjectPic_NPC17Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC17[] =
	{
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC17Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC17 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1106,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC17,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC18_____

	extern const u8 gEventsObjectPic_NPC18Tiles[];

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
		.paletteTag1 = 0x1107,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC18,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC19_____

	extern const u8 gEventsObjectPic_NPC19Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC19[] =
	{
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC19Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC19 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1108,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC19,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC20_____

	extern const u8 gEventsObjectPic_NPC20Tiles[];

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
		.paletteTag1 = 0x1109,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC20,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC21_____

	extern const u8 gEventsObjectPic_NPC21Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC21[] =
	{
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC21Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC21 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x110A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC21,
		.affineAnims = gDummySpriteAffineAnimTable,
	};
	

//_____NPC22_____

	extern const u8 gEventsObjectPic_NPC22Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC22[] =
	{
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC22Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC22 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x110B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC22,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC23_____

	extern const u8 gEventsObjectPic_NPC23Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC23[] =
	{
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC23Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC23 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x110C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC23,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC24_____

	extern const u8 gEventsObjectPic_NPC24Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC24[] =
	{
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC24Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC24 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1110,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC24,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC25_____

	extern const u8 gEventsObjectPic_NPC25Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC25[] =
	{
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC25Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC25 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1111,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC25,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC26_____

	extern const u8 gEventsObjectPic_NPC26Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC26[] =
	{
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC26Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC26 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1113,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC26,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC27_____

	extern const u8 gEventsObjectPic_NPC27Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC27[] =
	{
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC27Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC27 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1114,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC27,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC28_____

	extern const u8 gEventsObjectPic_NPC28Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC28[] =
	{
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC28Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC28 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1115,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC28,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC29_____

	extern const u8 gEventsObjectPic_NPC29Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC29[] =
	{
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC29Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC29 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1116,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC29,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC30_____

	extern const u8 gEventsObjectPic_NPC30Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC30[] =
	{
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC30Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC30 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1117,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC30,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC31_____

	extern const u8 gEventsObjectPic_NPC31Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC31[] =
	{
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC31Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC31 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1118,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC31,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC32_____

	extern const u8 gEventsObjectPic_NPC32Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC32[] =
	{
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC32Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC32 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1119,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC32,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC33_____

	extern const u8 gEventsObjectPic_NPC33Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC33[] =
	{
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC33Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC33 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC33,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC34_____

	extern const u8 gEventsObjectPic_NPC34Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC34[] =
	{
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC34Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC34 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC34,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC35_____

	extern const u8 gEventsObjectPic_NPC35Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC35[] =
	{
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC35Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC35 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC35,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC36_____

	extern const u8 gEventsObjectPic_NPC36Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC36[] =
	{
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC36Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC36 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111D,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC36,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC37_____

	extern const u8 gEventsObjectPic_NPC37Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC37[] =
	{
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC37Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC37 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111E,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC37,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC38_____

	extern const u8 gEventsObjectPic_NPC38Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC38[] =
	{
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC38Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC38 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111F,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC38,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC39_____

	extern const u8 gEventsObjectPic_NPC39Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC39[] =
	{
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC39Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC39 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1120,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC39,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC40_____

	extern const u8 gEventsObjectPic_NPC40Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC40[] =
	{
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC40Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC40 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1121,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC40,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC41_____

	extern const u8 gEventsObjectPic_NPC41Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC41[] =
	{
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC41Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC41 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1122,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC41,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC42_____

	extern const u8 gEventsObjectPic_NPC42Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC42[] =
	{
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC42Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC42 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1123,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC42,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC43_____

	extern const u8 gEventsObjectPic_NPC43Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC43[] =
	{
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC43Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC43 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1124,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC43,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC44_____

	extern const u8 gEventsObjectPic_NPC44Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC44[] =
	{
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC44Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC44 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1125,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC44,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC45_____

	extern const u8 gEventsObjectPic_NPC45Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC45[] =
	{
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC45Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC45 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1126,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC45,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC46_____

	extern const u8 gEventsObjectPic_NPC46Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC46[] =
	{
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC46Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC46 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1127,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC46,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC47_____

	extern const u8 gEventsObjectPic_NPC47Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC47[] =
	{
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC47Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC47 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1128,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC47,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC48_____

	extern const u8 gEventsObjectPic_NPC48Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC48[] =
	{
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC48Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC48 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1129,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC48,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC49_____

	extern const u8 gEventsObjectPic_NPC49Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC49[] =
	{
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC49Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC49 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC49,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC50_____

	extern const u8 gEventsObjectPic_NPC50Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC50[] =
	{
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC50Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC50 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC50,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC51_____

	extern const u8 gEventsObjectPic_NPC51Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC51[] =
	{
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC51Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC51 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC51,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC52_____

	extern const u8 gEventsObjectPic_NPC52Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC52[] =
	{
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC52Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC52 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112D,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC52,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC53_____

	extern const u8 gEventsObjectPic_NPC53Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC53[] =
	{
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC53Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC53 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112E,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC53,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC54_____

	extern const u8 gEventsObjectPic_NPC54Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC54[] =
	{
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC54Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC54 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112F,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC54,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC55_____

	extern const u8 gEventsObjectPic_NPC55Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC55[] =
	{
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC55Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC55 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1130,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC55,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC56_____

	extern const u8 gEventsObjectPic_NPC56Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC56[] =
	{
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC56Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC56 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1131,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC56,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC57_____

	extern const u8 gEventsObjectPic_NPC57Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC57[] =
	{
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC57 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1132,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC57,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC58_____

	extern const u8 gEventsObjectPic_NPC58Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC58[] =
	{
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC58 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1133,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC58,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC59_____

	extern const u8 gEventsObjectPic_NPC59Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC59[] =
	{
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC59 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1134,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC59,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC60_____

	extern const u8 gEventsObjectPic_NPC60Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC60[] =
	{
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC60 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1135,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC60,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC61_____

	extern const u8 gEventsObjectPic_NPC61Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC61[] =
	{
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC61Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC61 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1136,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC61,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC62_____

	extern const u8 gEventsObjectPic_NPC62Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC62[] =
	{
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC62Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC62 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1137,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC62,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC63_____

	extern const u8 gEventsObjectPic_NPC63Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC63[] =
	{
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC63Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC63 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1138,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC63,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC64_____

	extern const u8 gEventsObjectPic_NPC64Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC64[] =
	{
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC64Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC64 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1139,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC64,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC65_____

	extern const u8 gEventsObjectPic_NPC65Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC65[] =
	{
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC65Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC65 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC65,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC66_____

	extern const u8 gEventsObjectPic_NPC66Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC66[] =
	{
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC66Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC66 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC66,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC67_____

	extern const u8 gEventsObjectPic_NPC67Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC67[] =
	{
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC67Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC67 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC67,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC68_____

	extern const u8 gEventsObjectPic_NPC68Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC68[] =
	{
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC68Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC68 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113D,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC68,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC69_____

	extern const u8 gEventsObjectPic_NPC69Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC69[] =
	{
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC69Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC69 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113E,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC69,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC70_____

	extern const u8 gEventsObjectPic_NPC70Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC70[] =
	{
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC70Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC70 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113F,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC70,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC71_____

	extern const u8 gEventsObjectPic_NPC71Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC71[] =
	{
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC71Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC71 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1140,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC71,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC72_____

	extern const u8 gEventsObjectPic_NPC72Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC72[] =
	{
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC72Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC72 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1141,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC72,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC73_____

	extern const u8 gEventsObjectPic_NPC73Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC73[] =
	{
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC73Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC73 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1142,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC73,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC74_____

	extern const u8 gEventsObjectPic_NPC74Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC74[] =
	{
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC74Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC74 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1143,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC74,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC75_____

	extern const u8 gEventsObjectPic_NPC75Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC75[] =
	{
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC75Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC75 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1144,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC75,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC76_____

	extern const u8 gEventsObjectPic_NPC76Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC76[] =
	{
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC76Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC76 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1145,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC76,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC77_____

	extern const u8 gEventsObjectPic_NPC77Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC77[] =
	{
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC77Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC77 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1146,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC77,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC78_____

	extern const u8 gEventsObjectPic_NPC78Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC78[] =
	{
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC78Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC78 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1147,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC78,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC79_____

	extern const u8 gEventsObjectPic_NPC79Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC79[] =
	{
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC79Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC79 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1148,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC79,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC80_____

	extern const u8 gEventsObjectPic_NPC80Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC80[] =
	{
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC80Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC80 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1149,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC80,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC81_____

	extern const u8 gEventsObjectPic_NPC81Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC81[] =
	{
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC81Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC81 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x114A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC81,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC82_____

	extern const u8 gEventsObjectPic_NPC82Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC82[] =
	{
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC82Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC82 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x114B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC82,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC83_____

	extern const u8 gEventsObjectPic_NPC83Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC83[] =
	{
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC83Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC83 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x114C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC83,
		.affineAnims = gDummySpriteAffineAnimTable,
	};


//_____NPC86_____

	extern const u8 gEventsObjectPic_NPC86Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC86[] =
	{
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC86Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC86 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x114F,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC86,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC87_____

	extern const u8 gEventsObjectPic_NPC87Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC87[] =
	{
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC87Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC87 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1150,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC87,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC88_____

	extern const u8 gEventsObjectPic_NPC88Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC88[] =
	{
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC88Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC88 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1151,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC88,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC89_____

	extern const u8 gEventsObjectPic_NPC89Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC89[] =
	{
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC89Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC89 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1152,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC89,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC90_____

	extern const u8 gEventsObjectPic_NPC90Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC90[] =
	{
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC90Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC90 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1153,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC90,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC91_____

	extern const u8 gEventsObjectPic_NPC91Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC91[] =
	{
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC91Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC91 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1154,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC91,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC92_____

	extern const u8 gEventsObjectPic_NPC92Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC92[] =
	{
		overworld_frame(gEventsObjectPic_NPC92Tiles, 2, 2, 0),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC92 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1155,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (16 * 16) / 2,
		.width = 16,
		.height = 16,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_16x16,
		.subspriteTables = gEventObjectSpriteOamTables_16x16,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC92,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC93_____

	extern const u8 gEventsObjectPic_NPC93Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC93[] =
	{
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC93Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC93 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1156,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC93,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC95_____

	extern const u8 gEventsObjectPic_NPC95Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC95[] =
	{
		overworld_frame(gEventsObjectPic_NPC95Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC95Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC95Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC95Tiles, 4, 4, 3),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC95 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1158,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_CutTree,
		.images = gEventObjectPicTable_NPC95,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC96_____

	extern const u8 gEventsObjectPic_NPC96Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC96[] =
	{
		overworld_frame(gEventsObjectPic_NPC96Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC96Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC96Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC96Tiles, 4, 4, 3),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC96 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1159,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC96,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC97_____

	extern const u8 gEventsObjectPic_NPC97Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC97[] =
	{
		overworld_frame(gEventsObjectPic_NPC97Tiles, 4, 4, 0),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC97 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x115A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC97,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC98_____

	extern const u8 gEventsObjectPic_NPC98Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC98[] =
	{
		overworld_frame(gEventsObjectPic_NPC98Tiles, 4, 4, 0),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC98 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x115B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC98,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC99_____

	extern const u8 gEventsObjectPic_NPC99Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC99[] =
	{
		overworld_frame(gEventsObjectPic_NPC99Tiles, 2, 2, 0),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC99 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x115C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (16 * 16) / 2,
		.width = 16,
		.height = 16,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_16x16,
		.subspriteTables = gEventObjectSpriteOamTables_16x16,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC99,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC100_____

	extern const u8 gEventsObjectPic_NPC100Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC100[] =
	{
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC100Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC100 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x115D,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC100,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC101_____

	extern const u8 gEventsObjectPic_NPC101Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC101[] =
	{
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC101Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC101 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x115E,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC101,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC102_____

	extern const u8 gEventsObjectPic_NPC102Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC102[] =
	{
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC102Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC102 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x115F,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC102,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC103_____

	extern const u8 gEventsObjectPic_NPC103Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC103[] =
	{
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 0),
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 1),
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 2),
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 3),
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 4),
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 5),
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 6),
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 7),
		overworld_frame(gEventsObjectPic_NPC103Tiles, 2, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC103 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1152,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (16 * 32) / 2,
		.width = 16,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_16x32,
		.subspriteTables = gEventObjectSpriteOamTables_16x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC103,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC104_____

	extern const u8 gEventsObjectPic_NPC104Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC104[] =
	{
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 0),
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 1),
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 2),
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 3),
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 4),
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 5),
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 6),
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 7),
		overworld_frame(gEventsObjectPic_NPC104Tiles, 8, 8, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC104 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1161,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (64 * 64) / 2,
		.width = 64,
		.height = 64,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_64x64,
		.subspriteTables = gEventObjectSpriteOamTables_64x64,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC104,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC105_____

	extern const u8 gEventsObjectPic_NPC105Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC105[] =
	{
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC105Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC105 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1161,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC105,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC106_____

	extern const u8 gEventsObjectPic_NPC106Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC106[] =
	{
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC106Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC106 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1161,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC106,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC107_____

	extern const u8 gEventsObjectPic_NPC107Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC107[] =
	{
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 0),
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 1),
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 2),
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 3),
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 4),
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 5),
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 6),
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 7),
		overworld_frame(gEventsObjectPic_NPC107Tiles, 8, 8, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC107 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1164,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (64 * 64) / 2,
		.width = 64,
		.height = 64,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_64x64,
		.subspriteTables = gEventObjectSpriteOamTables_64x64,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC107,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC108_____

	extern const u8 gEventsObjectPic_NPC108Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC108[] =
	{
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 0),
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 1),
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 2),
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 3),
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 4),
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 5),
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 6),
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 7),
		overworld_frame(gEventsObjectPic_NPC108Tiles, 8, 8, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC108 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1165,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (64 * 64) / 2,
		.width = 64,
		.height = 64,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_64x64,
		.subspriteTables = gEventObjectSpriteOamTables_64x64,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC108,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC109_____

	extern const u8 gEventsObjectPic_NPC109Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC109[] =
	{
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 0),
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 1),
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 2),
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 3),
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 4),
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 5),
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 6),
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 7),
		overworld_frame(gEventsObjectPic_NPC109Tiles, 8, 8, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC109 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1166,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (64 * 64) / 2,
		.width = 64,
		.height = 64,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_64x64,
		.subspriteTables = gEventObjectSpriteOamTables_64x64,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC109,
		.affineAnims = gDummySpriteAffineAnimTable,
	};


//_____NPC110_____

	extern const u8 gEventsObjectPic_NPC110Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC110[] =
	{
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC110Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC110 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1167,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC110,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC111_____

	extern const u8 gEventsObjectPic_NPC111Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC111[] =
	{
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC111Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC111 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1168,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC111,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC112_____

	extern const u8 gEventsObjectPic_NPC112Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC112[] =
	{
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC112Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC112 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1169,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC112,
		.affineAnims = gDummySpriteAffineAnimTable,
	};


//_____NPC113_____

	extern const u8 gEventsObjectPic_NPC113Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC113[] =
	{
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 0),
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 1),
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 2),
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 3),
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 4),
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 5),
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 6),
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 7),
		overworld_frame(gEventsObjectPic_NPC113Tiles, 2, 2, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC113 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x116A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (16 * 16) / 2,
		.width = 16,
		.height = 16,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = FEMALE,
		.oam = gEventObjectBaseOam_16x16,
		.subspriteTables = gEventObjectSpriteOamTables_16x16,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC113,
		.affineAnims = gDummySpriteAffineAnimTable,
	};


//_____NPC114_____

	extern const u8 gEventsObjectPic_NPC114Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC114[] =
	{
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC114Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC114 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x116B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC114,
		.affineAnims = gDummySpriteAffineAnimTable,
	};


//_____NPC115_____

	extern const u8 gEventsObjectPic_NPC115Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC115[] =
	{
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC115Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC115 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x116C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC115,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC116_____

	extern const u8 gEventsObjectPic_NPC116Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC116[] =
	{
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC116Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC116 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x116D,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC116,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC117_____

	extern const u8 gEventsObjectPic_NPC117Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC117[] =
	{
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC117Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC117 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x116E,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC117,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC118_____

	extern const u8 gEventsObjectPic_NPC118Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC118[] =
	{
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC118Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC118 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x116F,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC118,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC119_____

	extern const u8 gEventsObjectPic_NPC119Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC119[] =
	{
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC119Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC119 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1170,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC119,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC120_____

	extern const u8 gEventsObjectPic_NPC120Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC120[] =
	{
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC120Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC120 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1171,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC120,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC121_____

	extern const u8 gEventsObjectPic_NPC121Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC121[] =
	{
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC121Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC121 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1172,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC121,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC122_____

	extern const u8 gEventsObjectPic_NPC122Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC122[] =
	{
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC122Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC122 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1173,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC122,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC123_____

	extern const u8 gEventsObjectPic_NPC123Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC123[] =
	{
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC123Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC123 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1174,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC123,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC124_____

	extern const u8 gEventsObjectPic_NPC124Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC124[] =
	{
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC124Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC124 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1175,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC124,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC125_____

	extern const u8 gEventsObjectPic_NPC125Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC125[] =
	{
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC125Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC125 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1176,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC125,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC126_____

	extern const u8 gEventsObjectPic_NPC126Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC126[] =
	{
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC126Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC126 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1177,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC126,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC127_____

	extern const u8 gEventsObjectPic_NPC127Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC127[] =
	{
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 0),
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 1),
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 2),
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 3),
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 4),
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 5),
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 6),
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 7),
		overworld_frame(gEventsObjectPic_NPC127Tiles, 2, 2, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC127 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1178,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (16 * 16) / 2,
		.width = 16,
		.height = 16,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_16x16,
		.subspriteTables = gEventObjectSpriteOamTables_16x16,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC127,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC128_____

	extern const u8 gEventsObjectPic_NPC128Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC128[] =
	{
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC128Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC128 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1179,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC128,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC129_____

	extern const u8 gEventsObjectPic_NPC129Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC129[] =
	{
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 0),
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 1),
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 2),
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 3),
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 4),
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 5),
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 6),
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 7),
		overworld_frame(gEventsObjectPic_NPC129Tiles, 2, 2, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC129 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x117A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (16 * 16) / 2,
		.width = 16,
		.height = 16,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_16x16,
		.subspriteTables = gEventObjectSpriteOamTables_16x16,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC129,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC130_____

	extern const u8 gEventsObjectPic_NPC130Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC130[] =
	{
		overworld_frame(gEventsObjectPic_NPC130Tiles, 2, 2, 0),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC130 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1164,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (16 * 16) / 2,
		.width = 16,
		.height = 16,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_16x16,
		.subspriteTables = gEventObjectSpriteOamTables_16x16,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC130,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC131_____

	extern const u8 gEventsObjectPic_NPC131Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC131[] =
	{
		overworld_frame(gEventsObjectPic_NPC131Tiles, 8, 8, 0),
		overworld_frame(gEventsObjectPic_NPC131Tiles, 8, 8, 1),
		overworld_frame(gEventsObjectPic_NPC131Tiles, 8, 8, 2),
		overworld_frame(gEventsObjectPic_NPC131Tiles, 4, 8, 3),
		overworld_frame(gEventsObjectPic_NPC131Tiles, 8, 8, 4),
		overworld_frame(gEventsObjectPic_NPC131Tiles, 8, 8, 5),
		overworld_frame(gEventsObjectPic_NPC131Tiles, 8, 8, 6),
		overworld_frame(gEventsObjectPic_NPC131Tiles, 8, 8, 7),
		overworld_frame(gEventsObjectPic_NPC131Tiles, 8, 8, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC131 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x117C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (64 * 64) / 2,
		.width = 64,
		.height = 64,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_64x64,
		.subspriteTables = gEventObjectSpriteOamTables_64x64,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC131,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC132_____

	extern const u8 gEventsObjectPic_NPC132Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC132[] =
	{
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC132Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC132 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x117D,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC132,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC133_____

	extern const u8 gEventsObjectPic_NPC133Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC133[] =
	{
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC133Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC133 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x117E,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC133,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC141_____

	extern const u8 gEventsObjectPic_NPC141Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC141[] =
	{
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC141Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC141 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1186,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC141,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC142_____

	extern const u8 gEventsObjectPic_NPC142Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC142[] =
	{
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC142Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC142 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1187,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC142,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC143_____

	extern const u8 gEventsObjectPic_NPC143Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC143[] =
	{
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC143Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC143 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1188,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC143,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC145_____

	extern const u8 gEventsObjectPic_NPC145Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC145[] =
	{
		overworld_frame(gEventsObjectPic_NPC145Tiles, 8, 8, 0),
		overworld_frame(gEventsObjectPic_NPC145Tiles, 8, 8, 1),
		overworld_frame(gEventsObjectPic_NPC145Tiles, 8, 8, 2),
		overworld_frame(gEventsObjectPic_NPC145Tiles, 8, 8, 3),
		overworld_frame(gEventsObjectPic_NPC145Tiles, 8, 8, 4),
		overworld_frame(gEventsObjectPic_NPC145Tiles, 8, 8, 5),
		overworld_frame(gEventsObjectPic_NPC145Tiles, 8, 8, 6),
		overworld_frame(gEventsObjectPic_NPC145Tiles, 8, 8, 7),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC145 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x118A,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (64 * 64) / 2,
		.width = 64,
		.height = 64,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_64x64,
		.subspriteTables = gEventObjectSpriteOamTables_64x64,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC145,
		.affineAnims = gDummySpriteAffineAnimTable,
	};


//_____NPC146_____

	extern const u8 gEventsObjectPic_NPC146Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC146[] =
	{
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC146Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC146 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x118B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC146,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

	//_____NPC147_____

	extern const u8 gEventsObjectPic_NPC147Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC147[] =
	{
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 0),
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 1),
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 2),
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 3),
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 4),
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 5),
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 6),
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 7),
		overworld_frame(gEventsObjectPic_NPC147Tiles, 8, 8, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC147 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x118C,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (64 * 64) / 2,
		.width = 64,
		.height = 64,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_64x64,
		.subspriteTables = gEventObjectSpriteOamTables_64x64,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC147,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC152_____

	extern const u8 gEventsObjectPic_NPC152Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC152[] =
	{
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC152Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC152 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1191,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC152,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC153_____

	extern const u8 gEventsObjectPic_NPC153Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC153[] =
	{
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC153Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC153 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC153,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC154_____

	extern const u8 gEventsObjectPic_NPC154Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC154[] =
	{
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC154Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC154 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC154,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC155_____

	extern const u8 gEventsObjectPic_NPC155Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC155[] =
	{
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC155Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC155 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC155,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC156_____

	extern const u8 gEventsObjectPic_NPC156Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC156[] =
	{
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC156Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC156 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC156,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC157_____

	extern const u8 gEventsObjectPic_NPC157Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC157[] =
	{
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC157Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC157 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC157,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC158_____

	extern const u8 gEventsObjectPic_NPC158Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC158[] =
	{
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC158Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC158 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC158,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC159_____

	extern const u8 gEventsObjectPic_NPC159Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC159[] =
	{
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC159Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC159 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC159,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC160_____

	extern const u8 gEventsObjectPic_NPC160Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC160[] =
	{
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC160Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC160 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC160,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC161_____

	extern const u8 gEventsObjectPic_NPC161Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC161[] =
	{
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC161Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC161 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1192,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC161,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//_____NPC162_____

	extern const u8 gEventsObjectPic_NPC162Tiles[];

	static const struct SpriteFrameImage gEventObjectPicTable_NPC162[] =
	{
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 3),
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 4),
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 5),
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 6),
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 7),
		overworld_frame(gEventsObjectPic_NPC162Tiles, 4, 4, 8),
	};

	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC162 =
	{
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1193,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (32 * 32) / 2,
		.width = 32,
		.height = 32,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_M,
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT,
		.gender = MALE,
		.oam = gEventObjectBaseOam_32x32,
		.subspriteTables = gEventObjectSpriteOamTables_32x32,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC162,
		.affineAnims = gDummySpriteAffineAnimTable,
	};

//NPC163__PLAYER_ORANGE

extern const u8 gEventsObjectPic_NPC163Tiles[];

static const struct SpriteFrameImage gEventObjectPicTable_NPC163[] =
{
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 0),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 1),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 2),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 3),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 4),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 5),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 6),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 7),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 8),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 9),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 10),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 11),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 12),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 13),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 14),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 15),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 16),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 17),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 18),
	overworld_frame(gEventsObjectPic_NPC163Tiles, 4, 4, 19),
};

const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC163 =
{
	.tileTag = 0xFFFF,
	.paletteTag1 = 0x1194,
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
	.anims = gEventObjectImageAnimTable_PlayerNormal,
	.images = gEventObjectPicTable_NPC163,
	.affineAnims = gDummySpriteAffineAnimTable,
};

//NPC164__PLAYER_GREEN

extern const u8 gEventsObjectPic_NPC164Tiles[];

static const struct SpriteFrameImage gEventObjectPicTable_NPC164[] =
{
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 0),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 1),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 2),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 3),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 4),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 5),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 6),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 7),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 8),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 9),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 10),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 11),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 12),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 13),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 14),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 15),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 16),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 17),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 18),
	overworld_frame(gEventsObjectPic_NPC164Tiles, 4, 4, 19),
};

const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC164 =
{
	.tileTag = 0xFFFF,
	.paletteTag1 = 0x1195,
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
	.anims = gEventObjectImageAnimTable_PlayerNormal,
	.images = gEventObjectPicTable_NPC164,
	.affineAnims = gDummySpriteAffineAnimTable,
};