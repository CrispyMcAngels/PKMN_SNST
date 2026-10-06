#include "defines.h"
#include "../include/event_object_movement.h"
#include "../include/field_effect.h"
#include "../include/field_player_avatar.h"
#include "../include/sprite.h"

#include "../include/new/character_customization.h"
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

	Ground mounts (onGround) are ridden on land instead: the player is on the bike underneath,
	for the bike's speed and music (eg. Rapidash in the "Consegna lampo" quest, courier_quest.c).

	Set VAR_SKY_MOUNT before warping into a sky map and the player arrives riding.
	Mid-map, use EventScript_SkyMount_Start / EventScript_SkyMount_End (sky_mount.s).

	Mount images are 32x384: 12 frames of 32x32. Frames 0-5 are the body (drawn behind the player),
	6-11 the overlay (drawn in front of the player). Each group is down x2, up x2, side x2 (right is mirrored),
	alternating between the two frames to bob.

	The rider is the surfing sprite, so where they sit on each Pokemon is set here rather than in its image:
	each mount moves the rider per facing direction (.rider in sSkyMounts), so their head doesn't cover the Pokemon's.
*/

#ifdef VAR_SKY_MOUNT

#define SKY_MOUNT_PAL_TAG 0x5A00 //+ mount id
#define BOB_PLAYER_AND_MON 1 //Surf blob bob state: the sprite follows the player
#define gEventObjectBaseOam_32x32_ROM ((const struct OamData*) 0x83A3718)

enum //Rider offsets by facing direction, in the order of sDirectionToAnim
{
	RIDER_DOWN,
	RIDER_UP,
	RIDER_SIDE, //Facing left; facing right mirrors it
};

struct RiderOffset
{
	s8 x; //Pixels, + is right
	s8 y; //Pixels, + is down
};

struct SkyMount
{
	const struct SpriteTemplate* body;
	const struct SpriteTemplate* overlay; //Can be NULL
	const u16* palette;
	bool8 onGround; //Ridden on land with the bike's speed, instead of in the sky
	struct RiderOffset rider[3]; //Moves the rider from the surfing position, per facing direction
};

static void SkyMountBodyCallback(struct Sprite* sprite);
static void SkyMountOverlayCallback(struct Sprite* sprite);
static void GroundMountBodyCallback(struct Sprite* sprite);
static void GroundMountOverlayCallback(struct Sprite* sprite);

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

//Ground mounts run instead of floating: one still frame when standing, the two frames alternating quickly while moving
static const union AnimCmd sAnim_GroundMountStandSouth[] = {ANIMCMD_FRAME(0, 16), ANIMCMD_JUMP(0)};
static const union AnimCmd sAnim_GroundMountStandNorth[] = {ANIMCMD_FRAME(2, 16), ANIMCMD_JUMP(0)};
static const union AnimCmd sAnim_GroundMountStandWest[] = {ANIMCMD_FRAME(4, 16), ANIMCMD_JUMP(0)};
static const union AnimCmd sAnim_GroundMountStandEast[] = {ANIMCMD_FRAME(4, 16, .hFlip = TRUE), ANIMCMD_JUMP(0)};
static const union AnimCmd sAnim_GroundMountRunSouth[] = {ANIMCMD_FRAME(0, 6), ANIMCMD_FRAME(1, 6), ANIMCMD_JUMP(0)};
static const union AnimCmd sAnim_GroundMountRunNorth[] = {ANIMCMD_FRAME(2, 6), ANIMCMD_FRAME(3, 6), ANIMCMD_JUMP(0)};
static const union AnimCmd sAnim_GroundMountRunWest[] = {ANIMCMD_FRAME(4, 6), ANIMCMD_FRAME(5, 6), ANIMCMD_JUMP(0)};
static const union AnimCmd sAnim_GroundMountRunEast[] = {ANIMCMD_FRAME(4, 6, .hFlip = TRUE), ANIMCMD_FRAME(5, 6, .hFlip = TRUE), ANIMCMD_JUMP(0)};

#define GROUND_MOUNT_ANIM_RUN 4 //+ direction anim
#define GROUND_MOUNT_Y_OFFSET -8 //Mount and rider drawn this many pixels higher than a sky mount: on the walking tile grid
static const union AnimCmd* const sGroundMountAnims[] =
{
	sAnim_GroundMountStandSouth,
	sAnim_GroundMountStandNorth,
	sAnim_GroundMountStandWest,
	sAnim_GroundMountStandEast,
	sAnim_GroundMountRunSouth,
	sAnim_GroundMountRunNorth,
	sAnim_GroundMountRunWest,
	sAnim_GroundMountRunEast,
};

static const s8 sGallopBounce[] = {0, -1, -1, 0}; //Pixels, 3 frames each: one bounce per pair of run frames

#define sky_mount_template(frames, cb) {.tileTag = 0xFFFF, .paletteTag = 0xFFFF, .oam = gEventObjectBaseOam_32x32_ROM, .anims = sSkyMountAnims, .images = frames, .affineAnims = gDummySpriteAffineAnimTable, .callback = cb}
#define ground_mount_template(frames, cb) {.tileTag = 0xFFFF, .paletteTag = 0xFFFF, .oam = gEventObjectBaseOam_32x32_ROM, .anims = sGroundMountAnims, .images = frames, .affineAnims = gDummySpriteAffineAnimTable, .callback = cb}

//Swellow
extern const u32 SkyMount_SwellowTiles[];
extern const u16 SkyMount_SwellowPal[];

static const struct SpriteFrameImage sSwellowBodyFrames[] =
{
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 0),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 1),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 2),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 3),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 4),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 5),
};

static const struct SpriteFrameImage sSwellowOverlayFrames[] =
{
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 6),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 7),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 8),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 9),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 10),
	overworld_frame(SkyMount_SwellowTiles, 4, 4, 11),
};

static const struct SpriteTemplate sSwellowBodyTemplate = sky_mount_template(sSwellowBodyFrames, SkyMountBodyCallback);
static const struct SpriteTemplate sSwellowOverlayTemplate = sky_mount_template(sSwellowOverlayFrames, SkyMountOverlayCallback);

//Rapidash
extern const u32 SkyMount_RapidashTiles[];
extern const u16 SkyMount_RapidashPal[];

static const struct SpriteFrameImage sRapidashBodyFrames[] =
{
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 0),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 1),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 2),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 3),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 4),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 5),
};

static const struct SpriteFrameImage sRapidashOverlayFrames[] =
{
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 6),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 7),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 8),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 9),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 10),
	overworld_frame(SkyMount_RapidashTiles, 4, 4, 11),
};

static const struct SpriteTemplate sRapidashBodyTemplate = ground_mount_template(sRapidashBodyFrames, GroundMountBodyCallback);
static const struct SpriteTemplate sRapidashOverlayTemplate = ground_mount_template(sRapidashOverlayFrames, GroundMountOverlayCallback);

//VAR_SKY_MOUNT 1 is sSkyMounts[0], and so on
static const struct SkyMount sSkyMounts[] =
{
	{&sSwellowBodyTemplate, &sSwellowOverlayTemplate, SkyMount_SwellowPal, FALSE, //1: Swellow
		.rider = {[RIDER_DOWN] = {0, -5}, [RIDER_UP] = {0, 3}, [RIDER_SIDE] = {3, -1}}},
	{&sRapidashBodyTemplate, &sRapidashOverlayTemplate, SkyMount_RapidashPal, TRUE, //2: Rapidash (courier_quest.c)
		.rider = {[RIDER_DOWN] = {0, -7}, [RIDER_UP] = {0, -3}, [RIDER_SIDE] = {3, -3}}},
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

//The player rides on land, on the bike underneath (also TRUE for IsSkyMountActive)
bool8 IsGroundMountActive(void)
{
	const struct SkyMount* mount = GetSkyMount();

	return mount != NULL && mount->onGround;
}

//@Details: Where the rider sits on the current mount for the direction the player faces (0, 0 when not riding).
static void GetRiderOffset(s16* x, s16* y)
{
	const struct SkyMount* mount = GetSkyMount();
	u8 direction = gEventObjects[gPlayerAvatar->eventObjectId].movementDirection;

	*x = *y = 0;
	if (mount != NULL)
	{
		const struct RiderOffset* offset = &mount->rider[min(sDirectionToAnim[direction], RIDER_SIDE)];
		*x = (direction == DIR_EAST) ? -offset->x : offset->x; //Facing right mirrors facing left
		*y = offset->y;
	}
}

static bool8 IsSkyMountSprite(struct Sprite* sprite)
{
	return sprite->inUse
		&& (sprite->callback == SkyMountBodyCallback || sprite->callback == SkyMountOverlayCallback
		 || sprite->callback == GroundMountBodyCallback || sprite->callback == GroundMountOverlayCallback);
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

//Follows the player like the surf blob, and seats the rider
static void SkyMountBodyCallback(struct Sprite* sprite)
{
	struct Sprite* playerSprite = &gSprites[gEventObjects[gPlayerAvatar->eventObjectId].spriteId];
	s16 x, y;

	UpdateSurfBlobFieldEffect(sprite); //Bobs the rider with the Pokemon
	GetRiderOffset(&x, &y);
	playerSprite->pos2.x = x;
	playerSprite->pos2.y = sprite->pos2.y + y;
}

//Drawn over the player, so the player looks like they sit in the Pokemon rather than on top of it
static void SkyMountOverlayCallback(struct Sprite* sprite)
{
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	struct Sprite* playerSprite = &gSprites[player->spriteId];

	StartSpriteAnimIfDifferent(sprite, sDirectionToAnim[player->movementDirection]);
	sprite->pos1.x = playerSprite->pos1.x;
	sprite->pos1.y = playerSprite->pos1.y + 8;
	sprite->pos2.y = gSprites[sprite->data[7]].pos2.y; //The body's bob (data[7] = its sprite id), without the rider's offset
	sprite->oam.priority = playerSprite->oam.priority;
	sprite->subpriority = playerSprite->subpriority - 1;
}

//Ground mounts: follows the player (also through ledge jumps), running and bouncing while the player moves.
//data[4] keeps the run going for a few frames after each tile, so it doesn't stop between tiles; data[5] times the bounce.
//The rider is lifted GROUND_MOUNT_Y_OFFSET pixels plus the mount's rider offset through its pos2.y, which jumps also use:
//the body remembers in data[6] what it wrote last frame and in data[1] how much of it was the lift, so a value written
//by anything else (a jump) is taken as the new base. The overlay (data[7] = the body's sprite id) reads the rider's height the same way.
static s16 GetRiderBaseY(struct Sprite* body, struct Sprite* playerSprite)
{
	s16 cur = playerSprite->pos2.y;
	return (cur == body->data[6]) ? cur - body->data[1] : cur;
}

static void GroundMountFollowPlayer(struct Sprite* sprite, s8 subpriorityOffset)
{
	struct EventObject* player = &gEventObjects[gPlayerAvatar->eventObjectId];
	struct Sprite* playerSprite = &gSprites[player->spriteId];
	bool8 running, isBody = (sprite->callback == GroundMountBodyCallback);
	struct Sprite* body = isBody ? sprite : &gSprites[sprite->data[7]];
	s16 baseY = GetRiderBaseY(body, playerSprite);

	if (gPlayerAvatar->tileTransitionState == T_TILE_TRANSITION)
		sprite->data[4] = 8;
	else if (sprite->data[4] > 0)
		sprite->data[4]--;

	running = sprite->data[4] > 0;
	sprite->data[5] = running ? sprite->data[5] + 1 : 0;

	StartSpriteAnimIfDifferent(sprite, sDirectionToAnim[player->movementDirection] + (running ? GROUND_MOUNT_ANIM_RUN : 0));
	sprite->pos1.x = playerSprite->pos1.x;
	sprite->pos1.y = playerSprite->pos1.y + 8 + GROUND_MOUNT_Y_OFFSET;
	sprite->pos2.y = baseY + (running ? sGallopBounce[(sprite->data[5] / 3) % ARRAY_COUNT(sGallopBounce)] : 0);
	sprite->oam.priority = playerSprite->oam.priority;
	sprite->subpriority = playerSprite->subpriority + subpriorityOffset;
	sprite->invisible = playerSprite->invisible;

	if (isBody) //The rider sits up on the mount, bouncing with its gallop
	{
		s16 x, y;

		GetRiderOffset(&x, &y);
		sprite->data[1] = GROUND_MOUNT_Y_OFFSET + y + (sprite->pos2.y - baseY);
		playerSprite->pos2.x = x;
		playerSprite->pos2.y = baseY + sprite->data[1];
		sprite->data[6] = playerSprite->pos2.y;
	}
}

static void GroundMountBodyCallback(struct Sprite* sprite)
{
	GroundMountFollowPlayer(sprite, 1); //Behind the player
}

static void GroundMountOverlayCallback(struct Sprite* sprite)
{
	GroundMountFollowPlayer(sprite, -1); //In front of the player
}

static u8 CreateSkyMountSprite(const struct SpriteTemplate* template, u16 palTag, const u16* palette)
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
		sprite->data[3] = -1; //Sky mounts bob up and down like the surf blob, rider included (ground mounts gallop instead)
		sprite->data[6] = -1;
		sprite->data[7] = -1;
		StartSpriteAnim(sprite, sDirectionToAnim[player->movementDirection]);
	}

	return spriteId;
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
	u8 bodyId = CreateSkyMountSprite(mount->body, palTag, mount->palette);
	if (mount->overlay != NULL && bodyId < MAX_SPRITES)
	{
		u8 overlayId = CreateSkyMountSprite(mount->overlay, palTag, mount->palette);
		if (overlayId < MAX_SPRITES)
			gSprites[overlayId].data[7] = bodyId; //The overlay moves with the body
	}
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
	struct Sprite* playerSprite = &gSprites[gEventObjects[gPlayerAvatar->eventObjectId].spriteId];

	playerSprite->pos2.x = 0; //The rider gets off the mount
	playerSprite->pos2.y = 0;

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
bool8 IsGroundMountActive(void) { return FALSE; }
void SkyMount_TryCreate(void) {}
void SkyMount_UpdatePlayerSprite(void) {}
void SkyMount_Start(void) {}
void SkyMount_End(void) {}

#endif
