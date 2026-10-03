#include "defines.h"
#include "../include/event_data.h"
#include "../include/item_menu.h"
#include "../include/money.h"
#include "../include/pokemon.h"
#include "../include/sound.h"
#include "../include/sprite.h"
#include "../include/string_util.h"
#include "../include/decompress.h"
#include "../include/constants/songs.h"
#include "../include/constants/flags.h"

#include "../include/new/item.h"
#include "../include/new/player_characters.h"
#include "../include/new/Vanilla_functions.h"
/*
player_characters.c
	playable characters: the main character (VAR_PLAYER_CHARACTER = 0) and up to NUM_ECHO_CHARACTERS
	Time Echo protagonists (1 and up). Each one keeps their own party, bag, money, name and sprites.
	The character being played uses the game's normal party, money and name; the others wait in
	the save memory below. The main character's bag never moves: during an echo the bag's pockets
	point at the echo protagonist's small bag instead.

	The save memory comes from PC boxes 23-25, removed for this (pokemon_storage_system.c).

	Scripts set VAR_PLAYER_CHARACTER, then callasm PlayerCharacter_Switch to switch at once (before
	giving the new character Pokemon or items). Otherwise the switch happens on the next map load.
	The waiting characters' money and item quantities are kept decoded, since the game's encryption
	key can change while they wait; they're encoded with the current key when they're played again.
*/

//The former boxes, as offsets into the save blocks (0x2027434 and 0x2024638 with the save blocks at
//their usual 0x202552C and 0x2024588)
#define CHARACTER_SAVE_SB1_OFFSET 0x1F08 //Former boxes 23 and 24: 3480 bytes
#define CHARACTER_SAVE_RAM_A_SIZE (30 * 58 * 2)
#define CHARACTER_SAVE_SB2_OFFSET 0xB0 //Former box 25: 1740 bytes
#define CHARACTER_SAVE_RAM_B_SIZE (30 * 58)

#define NUM_ECHOES_IN_RAM_A 4 //The rest go in RAM B

struct CharacterSavesA
{
	u8 loadedCharacter; //Character whose data is in the game's party, money and name right now
	u8 filler[3];
	struct MainCharacterSave main;
	struct EchoCharacterSave echoes[NUM_ECHOES_IN_RAM_A];
};

struct CharacterSavesB
{
	struct EchoCharacterSave echoes[NUM_ECHO_CHARACTERS - NUM_ECHOES_IN_RAM_A];
};

#define sCharacterSavesA ((struct CharacterSavesA*) ((u8*) gSaveBlock1 + CHARACTER_SAVE_SB1_OFFSET))
#define sCharacterSavesB ((struct CharacterSavesB*) ((u8*) gSaveBlock2 + CHARACTER_SAVE_SB2_OFFSET))

//A compile error here means the characters no longer fit in the freed boxes
typedef char CharacterSavesAFit[(sizeof(struct CharacterSavesA) <= CHARACTER_SAVE_RAM_A_SIZE) ? 1 : -1];
typedef char CharacterSavesBFit[(sizeof(struct CharacterSavesB) <= CHARACTER_SAVE_RAM_B_SIZE) ? 1 : -1];

//Echo protagonist n (1 = the first) is gEchoCharacters[n - 1]
struct EchoCharacter
{
	const u8* name; //Fixed name, at most 7 letters (strings/player_characters.string)
	u16 spriteVars[NUM_CHAR_SPRITE_VARS]; //Values of the sprite vars, in the CHAR_SPRITE_* order
	u32 startingMoney;
	u8 features; //CHAR_FEATURE_* this character has; the others are turned off while they're played
	const u8* bagClosedGfx; //64x64 bag pictures (LZ77 compressed): closed, and open for every pocket. NULL = the normal bag
	const u8* bagOpenGfx;
	const u16* bagPal; //Shared by both pictures
	const u8* menuIconGfx; //32x32 start menu icon for the trainer card option (uncompressed). NULL = the normal icon
	const u16* menuIconPal;
};

extern const u8 gText_EchoCharacterName_Myryam[];
extern const u8 gText_EchoCharacterName_2[];
extern const u8 gText_EchoCharacterName_3[];
extern const u8 gText_EchoCharacterName_4[];
extern const u8 gText_EchoCharacterName_5[];

//Time Echo bag (graphics/Other), the same for every echo protagonist
extern const u8 TimeEchoBagClosedTiles[];
extern const u8 TimeEchoBagOpenTiles[];
extern const u16 TimeEchoBagClosedPal[];
#define TIME_ECHO_BAG .bagClosedGfx = TimeEchoBagClosedTiles, .bagOpenGfx = TimeEchoBagOpenTiles, .bagPal = TimeEchoBagClosedPal

//Start menu icons (graphics/StartMenuBW/sprites, 32x64: normal and selected frames)
extern const u8 EchoIcon_MyryamTiles[];
extern const u16 EchoIcon_MyryamPal[];

//PLACEHOLDERS: echoes 2-5 repeat Myryam's overworld sprite and use the game's default pictures (0).
#define PLACEHOLDER_ECHO_SPRITES(walk) {walk, walk, walk, walk, walk, walk, walk, walk, 0, 0, 0, 0}

#define NAOMI_FRONT_PIC 0x86 //Trainer pictures, standing in for Myryam's until she has her own
#define NAOMI_BACK_PIC 3

const struct EchoCharacter gEchoCharacters[NUM_ECHO_CHARACTERS] =
{
	{ //1: Myryam (Dark Future)
		.name = gText_EchoCharacterName_Myryam,
		.spriteVars =
		{
			[CHAR_SPRITE_WALKRUN] = 0x155,
			[CHAR_SPRITE_BIKING] = 0x155, //She has no bike, surf or fishing sprites: the overworld ones stand in
			[CHAR_SPRITE_SURFING] = 0x155,
			[CHAR_SPRITE_HM_USE] = 0x155,
			[CHAR_SPRITE_FISHING] = 0x155,
			[CHAR_SPRITE_VS_SEEKER] = 0x155,
			[CHAR_SPRITE_VS_SEEKER_ON_BIKE] = 0x155,
			[CHAR_SPRITE_UNDERWATER] = 0x155,
			[CHAR_SPRITE_TRAINER_CARD_MALE] = NAOMI_FRONT_PIC, //PLACEHOLDER (both, since the card picks one by the main character's gender)
			[CHAR_SPRITE_TRAINER_CARD_FEMALE] = NAOMI_FRONT_PIC,
			[CHAR_SPRITE_BACK] = NAOMI_BACK_PIC, //PLACEHOLDER
			[CHAR_SPRITE_OUTFIT] = 0,
		},
		.startingMoney = 0,
		.features = CHAR_FEATURE_BAG | CHAR_FEATURE_TRAINER_CARD | CHAR_FEATURE_SAVE,
		TIME_ECHO_BAG,
		.menuIconGfx = EchoIcon_MyryamTiles, //PLACEHOLDER: a violet copy of the player's icon
		.menuIconPal = EchoIcon_MyryamPal,
	},
	{ //2
		.name = gText_EchoCharacterName_2,
		.spriteVars = PLACEHOLDER_ECHO_SPRITES(0x157),
		.features = CHAR_FEATURE_BAG | CHAR_FEATURE_TRAINER_CARD | CHAR_FEATURE_SAVE,
		TIME_ECHO_BAG,
	},
	{ //3
		.name = gText_EchoCharacterName_3,
		.spriteVars = PLACEHOLDER_ECHO_SPRITES(0x157),
		.features = CHAR_FEATURE_BAG | CHAR_FEATURE_TRAINER_CARD | CHAR_FEATURE_SAVE,
		TIME_ECHO_BAG,
	},
	{ //4
		.name = gText_EchoCharacterName_4,
		.spriteVars = PLACEHOLDER_ECHO_SPRITES(0x157),
		.features = CHAR_FEATURE_BAG | CHAR_FEATURE_TRAINER_CARD | CHAR_FEATURE_SAVE,
		TIME_ECHO_BAG,
	},
	{ //5
		.name = gText_EchoCharacterName_5,
		.spriteVars = PLACEHOLDER_ECHO_SPRITES(0x157),
		.features = CHAR_FEATURE_BAG | CHAR_FEATURE_TRAINER_CARD | CHAR_FEATURE_SAVE,
		TIME_ECHO_BAG,
	},
};

//Var of each CHAR_SPRITE_*
static const u16 sCharacterSpriteVars[NUM_CHAR_SPRITE_VARS] =
{
	[CHAR_SPRITE_WALKRUN] = VAR_PLAYER_WALKRUN,
	[CHAR_SPRITE_BIKING] = VAR_PLAYER_BIKING,
	[CHAR_SPRITE_SURFING] = VAR_PLAYER_SURFING,
	[CHAR_SPRITE_HM_USE] = VAR_PLAYER_HM_USE,
	[CHAR_SPRITE_FISHING] = VAR_PLAYER_FISHING,
	[CHAR_SPRITE_VS_SEEKER] = VAR_PLAYER_VS_SEEKER,
	[CHAR_SPRITE_VS_SEEKER_ON_BIKE] = VAR_PLAYER_VS_SEEKER_ON_BIKE,
	[CHAR_SPRITE_UNDERWATER] = VAR_PLAYER_UNDERWATER,
	[CHAR_SPRITE_TRAINER_CARD_MALE] = VAR_TRAINERCARD_MALE,
	[CHAR_SPRITE_TRAINER_CARD_FEMALE] = VAR_TRAINERCARD_FEMALE,
	[CHAR_SPRITE_BACK] = VAR_BACKSPRITE_SWITCH,
	[CHAR_SPRITE_OUTFIT] = 0x4068,
};

//Flag of each CHAR_FEATURE_*, in bit order
static const u16 sCharacterFeatureFlags[NUM_CHAR_FEATURES] =
{
	FLAG_RUNNING_ENABLED,
	FLAG_SYS_POKEDEX_GET,
	FLAG_SYS_DEXNAV,
	0x998, //Side quests
	0x990, //Time Echoes
	0x995, //Bag
	0x996, //Trainer card
	0x997, //Save
};

//CFRU's bag pockets (item.c): where each one is and how many slots it has
struct CharacterBagPocket
{
	struct ItemSlot* slots;
	u32 count;
};

#define NUM_BAG_POCKETS 5
#define gCharacterBagPockets ((struct CharacterBagPocket*) 0x203988C)

static struct EchoCharacterSave* GetEchoSave(u8 character)
{
	u8 echo = character - 1;
	return (echo < NUM_ECHOES_IN_RAM_A) ? &sCharacterSavesA->echoes[echo] : &sCharacterSavesB->echoes[echo - NUM_ECHOES_IN_RAM_A];
}

u8 GetLoadedPlayerCharacter(void)
{
	u8 character = sCharacterSavesA->loadedCharacter;
	return (character <= NUM_ECHO_CHARACTERS) ? character : CHARACTER_MAIN;
}

bool8 IsEchoCharacterLoaded(void)
{
	return GetLoadedPlayerCharacter() != CHARACTER_MAIN;
}

//Used by SetMemoryForBagStorage (item.c): during an echo the bag is the echo protagonist's small one
bool8 GetEchoCharacterBag(struct ItemSlot** items, struct ItemSlot** keyItems)
{
	struct EchoCharacterSave* save;

	if (!IsEchoCharacterLoaded())
		return FALSE;

	save = GetEchoSave(GetLoadedPlayerCharacter());
	*items = save->items;
	*keyItems = save->keyItems;
	return TRUE;
}

//Encodes or decodes (the same operation) the item quantities in the bag's current pockets
static void XorBagQuantities(void)
{
	u16 key = gSaveBlock2->encryptionKey;

	for (u32 pocket = 0; pocket < NUM_BAG_POCKETS; ++pocket)
	{
		for (u32 i = 0; i < gCharacterBagPockets[pocket].count; ++i)
			gCharacterBagPockets[pocket].slots[i].quantity ^= key;
	}
}

static void SetMoneyValue(u32 value)
{
	gSaveBlock1->money = value ^ gSaveBlock2->encryptionKey;
}

static u8 GetFeatures(void)
{
	u8 features = 0;

	for (u32 i = 0; i < NUM_CHAR_FEATURES; ++i)
	{
		if (FlagGet(sCharacterFeatureFlags[i]))
			features |= 1 << i;
	}

	return features;
}

static void SetFeatures(u8 features)
{
	for (u32 i = 0; i < NUM_CHAR_FEATURES; ++i)
	{
		if (features & (1 << i))
			FlagSet(sCharacterFeatureFlags[i]);
		else
			FlagClear(sCharacterFeatureFlags[i]);
	}
}

//Puts the character being played aside
static void StoreCharacter(u8 character)
{
	XorBagQuantities(); //Their bag stays where it is, decoded

	if (character == CHARACTER_MAIN)
	{
		struct MainCharacterSave* save = &sCharacterSavesA->main;

		Memcpy(save->party, gPlayerParty, sizeof(save->party));
		save->partyCount = gPlayerPartyCount;
		save->money = GetMoney(&gSaveBlock1->money);
		Memcpy(save->registeredItems, gSaveBlock1->registeredItems, sizeof(save->registeredItems));
		Memcpy(save->playerName, gSaveBlock2->playerName, sizeof(save->playerName));
		for (u32 i = 0; i < NUM_CHAR_SPRITE_VARS; ++i)
			save->spriteVars[i] = VarGet(sCharacterSpriteVars[i]);
		save->features = GetFeatures();
	}
	else
	{
		struct EchoCharacterSave* save = GetEchoSave(character);

		Memcpy(save->party, gPlayerParty, sizeof(save->party));
		save->partyCount = gPlayerPartyCount;
		save->money = GetMoney(&gSaveBlock1->money);
		Memcpy(save->registeredItems, gSaveBlock1->registeredItems, sizeof(save->registeredItems));
	}
}

//Makes a character the one being played
static void LoadCharacter(u8 character)
{
	if (character == CHARACTER_MAIN)
	{
		struct MainCharacterSave* save = &sCharacterSavesA->main;

		Memcpy(gPlayerParty, save->party, sizeof(save->party));
		SetMoneyValue(save->money);
		Memcpy(gSaveBlock1->registeredItems, save->registeredItems, sizeof(save->registeredItems));
		Memcpy(gSaveBlock2->playerName, save->playerName, sizeof(save->playerName));
		for (u32 i = 0; i < NUM_CHAR_SPRITE_VARS; ++i)
			VarSet(sCharacterSpriteVars[i], save->spriteVars[i]);
		SetFeatures(save->features);
	}
	else
	{
		const struct EchoCharacter* echo = &gEchoCharacters[character - 1];
		struct EchoCharacterSave* save = GetEchoSave(character);

		if (!save->started) //First time: empty party and bag
		{
			Memset(save, 0, sizeof(*save));
			save->money = echo->startingMoney;
			save->started = TRUE;
		}

		Memcpy(gPlayerParty, save->party, sizeof(save->party));
		SetMoneyValue(save->money);
		Memcpy(gSaveBlock1->registeredItems, save->registeredItems, sizeof(save->registeredItems));
		StringCopy(gSaveBlock2->playerName, echo->name);
		for (u32 i = 0; i < NUM_CHAR_SPRITE_VARS; ++i)
			VarSet(sCharacterSpriteVars[i], echo->spriteVars[i]);
		SetFeatures(echo->features);
	}

	sCharacterSavesA->loadedCharacter = character;
	CalculatePlayerPartyCount();
	SetMemoryForBagStorage(); //The bag's pockets now point at this character's bag...
	XorBagQuantities(); //...which is encoded with the current key
	ResetBagCursorPositions();
}

//Switches to the character in VAR_PLAYER_CHARACTER, if it isn't the one being played already.
//Called on every map load; scripts can also callasm it to switch straight away.
void PlayerCharacter_Switch(void)
{
	u8 target = VarGet(VAR_PLAYER_CHARACTER);
	u8 loaded = sCharacterSavesA->loadedCharacter;

	if (loaded > NUM_ECHO_CHARACTERS) //Never set up (old save): the main character is being played
		loaded = sCharacterSavesA->loadedCharacter = CHARACTER_MAIN;

	if (target > NUM_ECHO_CHARACTERS || target == loaded)
		return;

	StoreCharacter(loaded);
	LoadCharacter(target);
}

//New game: nobody has been played yet
void PlayerCharacters_Clear(void)
{
	Memset(sCharacterSavesA, 0, sizeof(struct CharacterSavesA));
	Memset(sCharacterSavesB, 0, sizeof(struct CharacterSavesB));
}

//Echo visuals: the bag//

#define BAG_SPRITE_SHEET_BACKPACK ((const struct CompressedSpriteSheet*) 0x83D41E4)
#define BAG_SPRITE_SHEET_SATCHEL ((const struct CompressedSpriteSheet*) 0x83D41EC)
#define BAG_SPRITE_PALETTE ((const struct CompressedSpritePalette*) 0x83D41F4)
#define BAG_FRAME_SIZE (64 * 64 / 2)
#define NUM_BAG_FRAMES 4 //Frame 0: no pocket chosen (closed for echo protagonists), 1-3: items, key items, Poke Balls
#define BagMenu_IsLinkActive ((bool8 (*)(void)) (0x810ADAC | 1))

void __attribute__((long_call)) LoadCompressedSpritePalette(const struct CompressedSpritePalette* src);

static const struct EchoCharacter* GetLoadedEchoCharacter(void)
{
	u8 character = GetLoadedPlayerCharacter();
	return (character == CHARACTER_MAIN) ? NULL : &gEchoCharacters[character - 1];
}

//Replaces the bag menu loading the backpack or satchel picture (0x8108310): an echo protagonist with bag
//pictures in gEchoCharacters gets the closed one on frame 0 and the open one on every pocket's frame
void LoadBagSpriteSheet(void)
{
	const struct EchoCharacter* echo = GetLoadedEchoCharacter();

	if (echo != NULL && echo->bagClosedGfx != NULL && echo->bagOpenGfx != NULL)
	{
		struct SpriteSheet sheet = {gDecompressionBuffer, BAG_FRAME_SIZE * NUM_BAG_FRAMES, BAG_SPRITE_SHEET_BACKPACK->tag};

		LZ77UnCompWram(echo->bagClosedGfx, gDecompressionBuffer);
		LZ77UnCompWram(echo->bagOpenGfx, gDecompressionBuffer + BAG_FRAME_SIZE);
		for (u32 i = 2; i < NUM_BAG_FRAMES; ++i)
			Memcpy(gDecompressionBuffer + i * BAG_FRAME_SIZE, gDecompressionBuffer + BAG_FRAME_SIZE, BAG_FRAME_SIZE);
		LoadSpriteSheet(&sheet);
	}
	else if (BagMenu_IsLinkActive() || gSaveBlock2->playerGender == MALE)
		LoadCompressedSpriteSheet(BAG_SPRITE_SHEET_BACKPACK);
	else
		LoadCompressedSpriteSheet(BAG_SPRITE_SHEET_SATCHEL);
}

//Replaces the bag menu loading the bag picture's palette (0x8108340)
void LoadBagSpritePalette(void)
{
	const struct EchoCharacter* echo = GetLoadedEchoCharacter();

	if (echo != NULL && echo->bagClosedGfx != NULL && echo->bagOpenGfx != NULL && echo->bagPal != NULL)
	{
		struct SpritePalette palette = {echo->bagPal, BAG_SPRITE_PALETTE->tag};
		LoadSpritePalette(&palette);
	}
	else
		LoadCompressedSpritePalette(BAG_SPRITE_PALETTE);
}

//Replaces the bag menu's check for moving to the next pocket (0x81091B8). Returns 2 to switch, 0 not to.
//Echo protagonists have no Poke Ball pocket, so their bag ends at the key items.
u8 TrySwitchBagPocketRight(u8 pocket)
{
	u8 lastPocket = IsEchoCharacterLoaded() ? 1 : 2; //Items, key items, Poke Balls

	if (pocket >= lastPocket)
		return 0;

	PlaySE(SE_RG_BAG2);
	return 2;
}

//Echo visuals: the trainer card//

#define sTrainerCardDataPtr (*((u8**) 0x20397A4))
#define TRAINER_CARD_STARS_OFFSET 10 //Hall of Fame, Pokedex, Battle Tower... (they set the card's colour), then the 8 badges
#define NUM_TRAINER_CARD_STARS 7
#define NUM_TRAINER_CARD_BADGES 8

//Called when the trainer card counts its stars and badges (0x8089A94). Echo protagonists have no badges (the
//level caps still follow the main character's) and none of his stars: TRUE skips the counting.
bool8 TrainerCard_HideAchievements(void)
{
	if (!IsEchoCharacterLoaded())
		return FALSE;

	Memset(sTrainerCardDataPtr + TRAINER_CARD_STARS_OFFSET, 0, NUM_TRAINER_CARD_STARS + NUM_TRAINER_CARD_BADGES);
	return TRUE;
}

//Echo visuals: the start menu//

//Used by the start menu (start_menu_bw) for the trainer card option's icon: TRUE with the icon of the
//echo protagonist being played, if they have one
bool8 GetEchoCharacterMenuIcon(const void** gfx, const u16** pal)
{
	const struct EchoCharacter* echo = GetLoadedEchoCharacter();

	if (echo == NULL || echo->menuIconGfx == NULL || echo->menuIconPal == NULL)
		return FALSE;

	*gfx = echo->menuIconGfx;
	*pal = echo->menuIconPal;
	return TRUE;
}
