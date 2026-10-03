#pragma once

#include "../global.h"
#include "../pokemon.h"

/**
 * \file player_characters.h
 * \brief Playable characters: the main character and the Time Echo protagonists. Each has its own
 *        party, bag, money, name and sprites; VAR_PLAYER_CHARACTER picks the one being played.
 */

#define NUM_ECHO_CHARACTERS 5
#define ECHO_BAG_ITEMS 10 //Normal items an echo character can carry
#define ECHO_BAG_KEY_ITEMS 5 //Key items an echo character can carry
#define CHARACTER_MAIN 0 //VAR_PLAYER_CHARACTER: 0 = main character, 1 to NUM_ECHO_CHARACTERS = echo protagonists

//Features a character can have (EchoCharacter.features). Each is a flag the game already checks; switching
//to an echo protagonist sets or clears them, switching back restores the main character's.
#define CHAR_FEATURE_RUNNING_SHOES (1 << 0) //FLAG_RUNNING_ENABLED (0x82F)
#define CHAR_FEATURE_POKEDEX       (1 << 1) //Start menu Pokedex (FLAG_SYS_POKEDEX_GET, 0x829)
#define CHAR_FEATURE_DEXNAV        (1 << 2) //Start menu DexNav and its shortcut (FLAG_SYS_DEXNAV, 0x91E)
#define CHAR_FEATURE_SIDE_QUESTS   (1 << 3) //Start menu side quests (0x998)
#define CHAR_FEATURE_TIME_ECHOES   (1 << 4) //Start menu Time Echoes (0x990)
#define CHAR_FEATURE_BAG           (1 << 5) //Start menu bag (0x995)
#define CHAR_FEATURE_TRAINER_CARD  (1 << 6) //Start menu trainer card (0x996)
#define CHAR_FEATURE_SAVE          (1 << 7) //Start menu save (0x997)
#define NUM_CHAR_FEATURES 8

//The overworld, trainer card and back sprite vars, saved and switched with the character
enum
{
	CHAR_SPRITE_WALKRUN,
	CHAR_SPRITE_BIKING,
	CHAR_SPRITE_SURFING,
	CHAR_SPRITE_HM_USE,
	CHAR_SPRITE_FISHING,
	CHAR_SPRITE_VS_SEEKER,
	CHAR_SPRITE_VS_SEEKER_ON_BIKE,
	CHAR_SPRITE_UNDERWATER,
	CHAR_SPRITE_TRAINER_CARD_MALE,
	CHAR_SPRITE_TRAINER_CARD_FEMALE,
	CHAR_SPRITE_BACK,
	CHAR_SPRITE_OUTFIT, //Palette swap of the main character's clothes (0x4068)
	NUM_CHAR_SPRITE_VARS,
};

//The main character while an echo protagonist is being played
struct MainCharacterSave
{
	struct Pokemon party[PARTY_SIZE];
	u32 money;
	u16 registeredItems[6];
	u16 spriteVars[NUM_CHAR_SPRITE_VARS];
	u8 playerName[PLAYER_NAME_LENGTH + 1];
	u8 partyCount;
	u8 features; //Which CHAR_FEATURE_* the main character had
	u8 filler[2];
};

//An echo protagonist, kept between echoes
struct EchoCharacterSave
{
	struct Pokemon party[PARTY_SIZE];
	struct ItemSlot items[ECHO_BAG_ITEMS];
	struct ItemSlot keyItems[ECHO_BAG_KEY_ITEMS];
	u32 money;
	u16 registeredItems[6];
	u8 partyCount;
	bool8 started; //Played before: otherwise their save is filled from gEchoCharacters
	u8 filler[2];
};

//Exported Functions
u8 GetLoadedPlayerCharacter(void);
bool8 IsEchoCharacterLoaded(void);
bool8 GetEchoCharacterBag(struct ItemSlot** items, struct ItemSlot** keyItems);
bool8 GetEchoCharacterMenuIcon(const void** gfx, const u16** pal);
void PlayerCharacter_Switch(void);
void PlayerCharacters_Clear(void);

//Functions Hooked In
void LoadBagSpriteSheet(void);
void LoadBagSpritePalette(void);
u8 TrySwitchBagPocketRight(u8 pocket);
bool8 TrainerCard_HideAchievements(void);
