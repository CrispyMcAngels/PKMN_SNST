#include "../config.h"
#include "../../include/global.h"

//Trainers who get stronger on Tough and Hard (+DIFFICULTY_BOSS_LEVEL_BONUS_TOUGH / _HARD levels, see config.h):
//Gym Leaders, Elite Four, rivals, story bosses... Use the same ID as in trainerbattle / HMA's trainer list.
const u16 gDifficultyBossTrainers[] =
{
	0x19, //Naomi Ardesiopoli
	0x1E, //Filiberto
	0x36, //Eleonora
	0x37, //Eris
	0x4E, //Vesper
	0xFFFF, //End of the list: keep this last
};

//Level cap for each number of badges. Tough: 1/4 experience above it. Hard: no experience above it, no Rare Candies.
//100 = no cap. The last entry is for after the game is cleared.
const u8 gLevelCapsByBadges[] =
{
	20,  //0 badges: heading to the 1st gym
	30,  //1 badge
	35,  //2 badges
	40,  //3 badges
	100, //4 badges (not scripted yet)
	100, //5
	100, //6
	100, //7
	100, //8
	100, //After the game is cleared
};
