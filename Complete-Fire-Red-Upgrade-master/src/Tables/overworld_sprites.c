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

//___________NPC14__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC14=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1103,
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
		.images = gEventObjectPicTable_NPC14,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	

//___________NPC15__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC15=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1104,
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
		.images = gEventObjectPicTable_NPC15,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	

//___________NPC16__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC16=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1105,
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
		.images = gEventObjectPicTable_NPC16,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC17__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC17=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1106,
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
		.images = gEventObjectPicTable_NPC17,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC18__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC18=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1107,
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
//___________NPC19__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC19=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1108,
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
		.images = gEventObjectPicTable_NPC19,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC20__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC20=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1109,
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
//___________NPC21__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC21=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x110A,
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
		.images = gEventObjectPicTable_NPC21,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	

//___________NPC22__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC22=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x110B,
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
		.images = gEventObjectPicTable_NPC22,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC23__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC23=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x110C,
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
		.images = gEventObjectPicTable_NPC23,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC24__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC24=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1110,
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
		.images = gEventObjectPicTable_NPC24,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC25__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC25=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1111,
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
		.images = gEventObjectPicTable_NPC25,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC26__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC26=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1113,
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
		.images = gEventObjectPicTable_NPC26,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC27__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC27=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1114,
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
		.images = gEventObjectPicTable_NPC27,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC28__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC28=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1115,
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
		.images = gEventObjectPicTable_NPC28,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC29__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC29=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1116,
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
		.images = gEventObjectPicTable_NPC29,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC30__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC30=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1117,
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
		.images = gEventObjectPicTable_NPC30,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC31__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC31=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1118,
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
		.images = gEventObjectPicTable_NPC31,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC32__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC32=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1119,
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
		.images = gEventObjectPicTable_NPC32,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC33__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC33=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111A,
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
		.images = gEventObjectPicTable_NPC33,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC34__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC34=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111B,
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
		.images = gEventObjectPicTable_NPC34,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC35__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC35=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111C,
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
		.images = gEventObjectPicTable_NPC35,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC36__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC36=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111D,
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
		.images = gEventObjectPicTable_NPC36,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC37__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC37=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111E,
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
		.images = gEventObjectPicTable_NPC37,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC38__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC38=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x111F,
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
		.images = gEventObjectPicTable_NPC38,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC39__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC39=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1120,
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
		.images = gEventObjectPicTable_NPC39,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC40__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC40=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1121,
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
		.images = gEventObjectPicTable_NPC40,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC41__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC41=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1122,
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
		.images = gEventObjectPicTable_NPC41,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC42__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC42=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1123,
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
		.images = gEventObjectPicTable_NPC42,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC43__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC43=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1124,
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
		.images = gEventObjectPicTable_NPC43,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC44__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC44=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1125,
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
		.images = gEventObjectPicTable_NPC44,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC45__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC45=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1126,
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
		.images = gEventObjectPicTable_NPC45,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC46__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC46=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1127,
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
		.images = gEventObjectPicTable_NPC46,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC47__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC47=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1128,
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
		.images = gEventObjectPicTable_NPC47,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC48__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC48=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1129,
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
		.images = gEventObjectPicTable_NPC48,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC49__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC49=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112A,
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
		.images = gEventObjectPicTable_NPC49,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	

//___________NPC50__________HO-OH		
		
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
		
	};	
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC50=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112B,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (64 * 64) / 2,
		.width = 64,
		.height = 64,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_L, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
		.gender = MALE, //Can also be FEMALE
		.oam = gEventObjectBaseOam_64x64,
		.subspriteTables = gEventObjectSpriteOamTables_64x64,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC50,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC51__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC51=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112C,
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
		.images = gEventObjectPicTable_NPC51,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC52__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC52=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112D,
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
		.images = gEventObjectPicTable_NPC52,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC53__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC53=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112E,
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
		.images = gEventObjectPicTable_NPC53,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC54__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC54=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x112F,
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
		.images = gEventObjectPicTable_NPC54,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC55__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC55=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1130,
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
		.images = gEventObjectPicTable_NPC55,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC56__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC56=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1131,
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
		.images = gEventObjectPicTable_NPC56,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC57__________		
		
	extern const u8 gEventsObjectPic_NPC57Tiles[];	
		
	static const struct SpriteFrameImage gEventObjectPicTable_NPC57[] =	
	{	
		overworld_frame(gEventsObjectPic_NPC57Tiles, 4, 4, 0),
		
	};	
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC57=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1132,
		.paletteTag2 = EVENT_OBJ_PAL_TAG_NONE,
		.size = (16 * 16) / 2,
		.width = 16,
		.height = 16,
		.paletteSlot = 0,
		.shadowSize = SHADOW_SIZE_S, //Can also be SHADOW_SIZE_S, SHADOW_SIZE_L, or SHADOW_SIZE_XL
		.inanimate = FALSE,
		.disableReflectionPaletteLoad = FALSE,
		.tracks = TRACKS_FOOT, //Can also be TRACKS_TIRE
		.gender = MALE, //Can also be FEMALE
		.oam = gEventObjectBaseOam_16x16,
		.subspriteTables = gEventObjectSpriteOamTables_16x16,
		.anims = gEventObjectImageAnimTable_Standard,
		.images = gEventObjectPicTable_NPC57,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC58__________		
		
	extern const u8 gEventsObjectPic_NPC58Tiles[];	
		
	static const struct SpriteFrameImage gEventObjectPicTable_NPC58[] =	
	{	
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC58Tiles, 4, 4, 3),
		
	};	
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC58=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1133,
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
		.images = gEventObjectPicTable_NPC58,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC59__________		
		
	extern const u8 gEventsObjectPic_NPC59Tiles[];	
		
	static const struct SpriteFrameImage gEventObjectPicTable_NPC59[] =	
	{	
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 0),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 1),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 2),
		overworld_frame(gEventsObjectPic_NPC59Tiles, 4, 4, 3),
		
	};	
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC59=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1134,
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
		.images = gEventObjectPicTable_NPC59,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC60__________		
		
	extern const u8 gEventsObjectPic_NPC60Tiles[];	
		
	static const struct SpriteFrameImage gEventObjectPicTable_NPC60[] =	
	{	
		overworld_frame(gEventsObjectPic_NPC60Tiles, 4, 4, 0),
		
	};	
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC60=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1135,
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
		.images = gEventObjectPicTable_NPC60,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC61__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC61=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1136,
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
		.images = gEventObjectPicTable_NPC61,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC62__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC62=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1137,
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
		.images = gEventObjectPicTable_NPC62,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC66__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC66=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113B,
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
		.images = gEventObjectPicTable_NPC66,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC67__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC67=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113C,
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
		.images = gEventObjectPicTable_NPC67,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC69__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC69=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x113E,
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
		.images = gEventObjectPicTable_NPC69,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC71__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC71=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1140,
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
		.images = gEventObjectPicTable_NPC71,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC72__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC72=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1141,
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
		.images = gEventObjectPicTable_NPC72,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
//___________NPC73__________		
		
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
		
	const struct EventObjectGraphicsInfo gEventObjectGraphicsInfo_NPC73=	
	{	
		.tileTag = 0xFFFF,
		.paletteTag1 = 0x1142,
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
		.images = gEventObjectPicTable_NPC73,
		.affineAnims = gDummySpriteAffineAnimTable,
	};	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		

	
	
	
		
		

	

	
		

		
		
	
		
		
		
		
	
		
		
		
	
	
		
		
		
		
	
		
		
		
