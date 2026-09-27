#ifndef QUEST_TABLE_H
#define QUEST_TABLE_H

#include <pokeagb/pokeagb.h>
#include "gui.h"
#include "../config.h"

// Terminator entry: quest_name_ptr == NULL
struct QuestTableEntry{
	void *tile_ptr;       // compressed sprite tile data (NULL = no sprite). Only used if species is 0
	void *pal_ptr;        // compressed sprite palette data (NULL = no sprite). Only used if species is 0
	void *quest_name_ptr;
	void *quest_desc_ptr;
	u16 flag_is_available;
	u16 flag_is_completed;
	u16 species;          // Pokemon or mugshot whose 64x64 front sprite is shown, e.g. SPECIES_ZAPDOS or MUGSHOT_NAOMI (0 = use tile_ptr/pal_ptr)
};


#if USE_C_QUESTS
#include "debug_quests.h"
#else
#include "quests.h"
#endif

#define QUEST_IS_UNAVAILABLE 	0
#define QUEST_IS_AVAILABLE 		1
#define QUEST_IS_HIDDEN 		2
#define QUEST_IS_ACCEPTED 		3
#define QUEST_IS_DONE 			4	


u8 check_flag(u16 flag_id);

extern struct QuestTableEntry empty_quest; //Defined in quest_table.c

//Finds the compressed tiles and palette to show for a quest. Returns false if it has no sprite
u8 get_quest_sprite(const struct QuestTableEntry *quest, void **tile_ptr, void **pal_ptr);

void initGuiQuests(struct QuestGuiInfo * const quest_gui_info);

//returns true if and only if at least one more quest was available, false otherwise
u8 findNextAvailableQuests(struct QuestGuiInfo * const quest_gui_info);

//returns true if and only if at least one more quest was available, false otherwise
u8 findPrevAvailableQuests(struct QuestGuiInfo * const quest_gui_info);

u8 findNextActiveAvailableQuests(struct QuestGuiInfo * const quest_gui_info);
u8 findPrevActiveAvailableQuests(struct QuestGuiInfo * const quest_gui_info);

u8 findNextCompletedAvailableQuests(struct QuestGuiInfo * const quest_gui_info);
u8 findPrevCompletedAvailableQuests(struct QuestGuiInfo * const quest_gui_info);



#endif