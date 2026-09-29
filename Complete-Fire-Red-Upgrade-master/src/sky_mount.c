#include "defines.h"
#include "../include/event_object_movement.h"
#include "../include/field_effect.h"
#include "../include/field_player_avatar.h"
#include "../include/sprite.h"

#include "../include/new/dynamic_ow_pals.h"
#include "../include/new/follow_me.h"
#include "../include/new/sky_mount.h"
/*
sky_mount.c
	lets the player ride a Pokemon in the sky, based on the dynamic surf overworlds
	(Shiny Miner, ansh, jordank, ghoulslash). While VAR_SKY_MOUNT isn't 0:
		- the Pokemon is drawn under the player like the surf blob, plus an overlay drawn over the player,
		- the player uses the surfing sprite,
		- the following Pokemon stays away, and running and biking are disabled.
	It's a separate sprite from the surf blob, so Surf, Rock Climb, etc. aren't affected.

	Set VAR_SKY_MOUNT before warping into a sky map and the player arrives riding.
	Mid-map, use EventScript_SkyMount_Start / EventScript_SkyMount_End (sky_mount.s).

	Mount images are 32x384: 12 frames of 32x32. Frames 0-5 are the body (drawn behind the player),
	6-11 the overlay (drawn in front of the player). Each group is down x2, up x2, side x2 (right is mirrored),
	alternating between the two frames to bob.
*/

#ifdef VAR_SKY_MOUNT

#define SKY_MOUNT_PAL_TAG 0x5A00 //+ mount id
#define BOB_PLAYER_AND_MON 1 //Surf blob bob state: the sprite follows the player
#define gEventObjectBaseOam_32x32_ROM ((const struct OamData*) 0x83A3718)

struct SkyMount
{
	const struct SpriteTemplate* body;
	const struct SpriteTemplate* overlay; //Can be NULL
	const u16* palette;
};

static void SkyMountBodyCallback(struct Sprite* sprite);
static void SkyMountOverlayCallback(struct Sprite* sprite);

static const union AnimCmd sAnim_SkyMountFaceSouth[] =
{
	ANIMCMD_FRAME(0, 48),
	ANIMCMD_FRAME(1, 48),
	ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_SkyMountFaceNorth[] =
{
	ANIMCMD_FRAME(2, 48),
	ANIMCMD_FRAME(3, 48),
	ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_SkyMountFaceWest[] =
{
	ANIMCMD_FRAME(4, 48),
	ANIMCMD_FRAME(5, 48),
	ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_SkyMountFaceEast[] =
{
	ANIMCMD_FRAME(4, 48, .hFlip = TRUE),
	ANIMCMD_FRAME(5, 48, .hFlip = TRUE),
	ANIMCMD_JUMP(0),
};

//Same order as the surf blob, so its vanilla callback can pick the direction
static const union AnimCmd* const sSkyMountAnims[] =
{
	sAnim_SkyMountFaceSouth,
	sAnim_SkyMountFaceNorth,
	sAnim_SkyMountFaceWest,
	sAnim_SkyMountFaceEast,
};

static const u8 sDirectionToAnim[] =
{
	[DIR_NONE] = 0,
	[DIR_SOUTH] = 0,
	[DIR_NORTH] = 1,
	[DIR_WEST] = 2,
	[DIR_EAST] = 3,
	[DIR_SOUTHWEST] = 0,
	[DIR_SOUTHEAST] = 0,
	[DIR_NORTHWEST] = 1,
	[DIR_NORTHEAST] = 1,
};

#define sky_mount_template(frames, cb) {.tileTag = 0xFFFF, .paletteTag = 0xFFFF, .oam = gEventObjectBaseOam_32x32_ROM, .anims = sSkyMountAnims, .images = frames, .affineAnims = gDummySpriteAffineAnimTable, .callback = cb}

//Latios (placeholder)
extern const u32 SkyMount_LatiosTiles[];
extern const u16 SkyMount_LatiosPal[];

static const struct SpriteFrameImage sLatiosBodyFrames[] =
{
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 0),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 1),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 2),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 3),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 4),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 5),
};

static const struct SpriteFrameImage sLatiosOverlayFrames[] =
{
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 6),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 7),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 8),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 9),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 10),
	overworld_frame(SkyMount_LatiosTiles, 4, 4, 11),
};

static const struct SpriteTemplate sLatiosBodyTemplate = sky_mount_template(sLatiosBodyFrames, SkyMountBodyCallback);
static const struct SpriteTemplate sLatiosOverlayTemplate = sky_mount_template(sLatiosOverlayFrames, SkyMountOverlayCallback);

//VAR_SKY_MOUNT 1 is sSkyMounts[0], and so on
static const struct SkyMount sSkyMounts[] =
{
	{&sLatiosBodyTemplate, &sLatiosOverlayTemplate, SkyMount_LatiosPal}, //1: Latios
};

static const struct SkyMount* GetSkyMount(void)
{
	u16 mountId = VarGet(VAR_SKY_MOUNT);

	if (mountId == 0 || mountId > ARRAY_COUNT(sSkyMounts))
		return NULL;

	return &sSkyMounts[mountId - 1];
}

bool8 IsSkyMountActive(void)
{
	return GetSkyMount() != NULL;
}

static bool8 IsSkyMountSprite(struct Sprite* sprite)
{
	return sprite->inUse
		&& (sprite->callback == SkyMountBodyCallback || sprite->callback == SkyMountOverlayCallback);
}

static bool8 DoesSkyMountSpriteExist(void)
{
	for (u32 i = 0; i < MAX_SPRITES; ++i)
	{
		if (IsSkyMountSprite(&gSprites[i]))
			return TRUE;
	}

	return FALSE;
}

//Follows the player like the surf blob
static void SkyMountBodyCallback(struct Sprite* sprite)
{
	UpdateSurfBlobFieldEffect(sprite);
}

//Drawn over the player, so the player looks like they sit in the Pokemon rather than on top of it
static void SkyMountOverlayCallback(struct Sprite* sprite)
{
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	struct Sprite* playerSprite = &gSprites[player->spriteId];

	StartSpriteAnimIfDifferent(sprite, sDirectionToAnim[player->movementDirection]);
	sprite->pos1.x = playerSprite->pos1.x;
	sprite->pos1.y = playerSprite->pos1.y + 8;
	sprite->pos2.y = playerSprite->pos2.y;
	sprite->oam.priority = playerSprite->oam.priority;
	sprite->subpriority = playerSprite->subpriority - 1;
}

static void CreateSkyMountSprite(const struct SpriteTemplate* template, u16 palTag, const u16* palette)
{
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	struct Sprite* playerSprite = &gSprites[player->spriteId];
	u8 spriteId = CreateSpriteAtEnd(template, playerSprite->pos1.x, playerSprite->pos1.y + 8, 0x96);

	if (spriteId < MAX_SPRITES)
	{
		struct Sprite* sprite = &gSprites[spriteId];

		sprite->coordOffsetEnabled = TRUE;
		sprite->oam.paletteNum = FindOrLoadNPCPaletteFromData(palTag, palette);
		sprite->data[0] = BOB_PLAYER_AND_MON; //The vanilla surf blob callback only follows the player in this state
		sprite->data[2] = gPlayerAvatar->eventObjectId;
		sprite->data[3] = 0; //No extra bobbing, the frames already bob
		sprite->data[6] = -1;
		sprite->data[7] = -1;
		StartSpriteAnim(sprite, sDirectionToAnim[player->movementDirection]);
	}
}

static void SetPlayerSprite(u8 state)
{
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];

	EventObjectSetGraphicsId(player, GetPlayerAvatarGraphicsIdByStateId(state));
	EventObjectTurn(player, player->facingDirection);
}

//@Details: Puts the player on the Pokemon chosen by VAR_SKY_MOUNT, unless they're already on it.
//			Called when a map loads, when returning to the overworld (eg. after a battle), and by SkyMount_Start.
void SkyMount_TryCreate(void)
{
	const struct SkyMount* mount = GetSkyMount();

	if (mount == NULL)
		return;

	SetPlayerSprite(PLAYER_AVATAR_STATE_SURFING); //The sitting sprite, also after returning to the overworld reset it
	if (DoesSkyMountSpriteExist())
		return;

	u16 palTag = SKY_MOUNT_PAL_TAG + VarGet(VAR_SKY_MOUNT);
	CreateSkyMountSprite(mount->body, palTag, mount->palette);
	if (mount->overlay != NULL)
		CreateSkyMountSprite(mount->overlay, palTag, mount->palette);
}

//@Details: Gives the player the sitting sprite again while riding.
//			Called at the end of a map load, since arriving on foot resets the player to the walking sprite.
void SkyMount_UpdatePlayerSprite(void)
{
	if (IsSkyMountActive())
		SetPlayerSprite(PLAYER_AVATAR_STATE_SURFING);
}

//@Details: Puts the player on the Pokemon chosen by VAR_SKY_MOUNT right away, on the current map.
void SkyMount_Start(void)
{
	FollowerMon_CutsceneHideInstant();
	SkyMount_TryCreate();
}

//@Details: Gets the player off the Pokemon on the current map and clears VAR_SKY_MOUNT.
//			Not needed before a warp: clearing VAR_SKY_MOUNT is enough there.
void SkyMount_End(void)
{
	for (u32 i = 0; i < MAX_SPRITES; ++i)
	{
		if (IsSkyMountSprite(&gSprites[i]))
			DestroySprite(&gSprites[i]);
	}

	VarSet(VAR_SKY_MOUNT, 0);
	SetPlayerSprite(PLAYER_AVATAR_STATE_NORMAL);
}

#else //VAR_SKY_MOUNT

bool8 IsSkyMountActive(void) { return FALSE; }
void SkyMount_TryCreate(void) {}
void SkyMount_UpdatePlayerSprite(void) {}
void SkyMount_Start(void) {}
void SkyMount_End(void) {}

#endif
