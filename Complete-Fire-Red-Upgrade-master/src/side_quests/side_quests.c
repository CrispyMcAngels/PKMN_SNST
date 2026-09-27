//Side Quests menu, merged from "80 SideQuests" (it used to be injected by hand at 0x090C5870).
//Opened from the BW start menu through Script_Quests (assembly/start_menu_bw_scripts.s).
//
//It's built on the same quest engine as Time Echoes (src/time_echoes), but it's a separate menu with its own
//quests, texts and graphics. Everything here is static and prefixed with sq_ / SideQuests_, so nothing is
//shared with Time Echoes by accident.
//
//Editing:
// - Quests: sSideQuests below. Texts: strings/side_quests.string.
// - GUI: graphics/SideQuests/SideQuests_Gui.png (see the notes at SQ_GUI_PAL_COMPLETED).

#include <pokeagb/pokeagb.h>

#define SQ_ENTRIES_PER_PAGE 4 //Changing this also needs the GUI, sCursorPositions and sTextboxTemplates changing
#define SQ_DESC_RBOX_ID 4
#define SQ_NO_NPC 0xFFFF

#define SQ_GUI_INFO ((struct SqGuiInfo *) 0x0202402C) //Scratch RAM: the enemy party, unused in the overworld (Time Echoes uses it too, never at the same time)
#define SQ_CURSOR_TILES_TAG 0x6F
#define SQ_CURSOR_PALS_TAG 0x5A10
#define SQ_CURSOR_TILES ((void *) 0x08463328) //Vanilla arrow, drawn pointing left: it's flipped to point right
#define SQ_NPC_TILES_TAG 0 //+ the row, 0-3

#define SQ_MODE_COMPLETED 0
#define SQ_MODE_ACTIVE 1

#define CPUFSSET 1
#define CPUModeFS(size, mode) ((size >> 2) | (mode << 24))

struct SideQuest
{
	const u8 *name;
	const u8 *desc;
	u16 flagAvailable; //The quest is listed once this is set...
	u16 flagCompleted; //...under Completed once this is set too, under Active before that
	u16 npc;           //Overworld sprite shown next to the quest (the NPC sprite number, decimal as in AdvanceMap or 0x.. hex), or SQ_NO_NPC
};

struct SqGuiInfo
{
	u8 cursor_i;
	u8 page_start_quest_i;
	u8 page_end_quest_i;
	u8 cursor_oam_id;
	u8 mode;
	u8 npc_oam_ids[SQ_ENTRIES_PER_PAGE];
	const struct SideQuest *page_quests[SQ_ENTRIES_PER_PAGE];
};

//The part of CFRU's EventObjectGraphicsInfo used here
struct SqNpcFrame
{
	const void *data;
	u16 size;
	u16 relativeFrames;
};

struct SqNpcGraphicsInfo
{
	u16 tileTag;
	u16 paletteTag;
	u16 reflectionPaletteTag;
	u16 size;
	s16 width;
	s16 height;
	u8 flags;
	u8 tracks;
	const void *oam;
	const void *subspriteTables;
	const void *anims;
	const struct SqNpcFrame *images;
	const void *affineAnims;
};

struct SqShapeSize
{
	u8 shape;
	u8 size;
};

//CFRU and vanilla functions
extern const struct SqNpcGraphicsInfo *GetEventObjectGraphicsInfo(u16 graphicsId); //CFRU: follows the NPC tables, including the ones CFRU adds
extern void __attribute__((long_call)) LoadObjectEventPaletteSet(u16 *paletteTags); //Loads NPC palettes by tag from the game's palette table
extern u8 __attribute__((long_call)) FlagGet(u16 flag);
extern void __attribute__((long_call)) CpuFastSet(const void *src, void *dst, u32 mode);
extern void __attribute__((long_call)) gpu_tile_obj_decompress_alloc_tag_and_upload_small_decompression_buffer(struct SpriteTiles *tile);

//GUI, built from graphics/SideQuests/SideQuests_Gui.png
extern const u8 SideQuests_GuiTiles[];
extern const u8 SideQuests_GuiMap[];
extern const u16 SideQuests_GuiPal[];

//Texts, in strings/side_quests.string
extern const u8 gText_SideQuests_Empty[];
extern const u8 gText_SideQuests_LostChild[];
extern const u8 gText_SideQuests_LostChildDesc[];
extern const u8 gText_SideQuests_LostScroll[];
extern const u8 gText_SideQuests_LostScrollDesc[];
extern const u8 gText_SideQuests_CatchSkiddo[];
extern const u8 gText_SideQuests_CatchSkiddoDesc[];
extern const u8 gText_SideQuests_FindShinx[];
extern const u8 gText_SideQuests_FindShinxDesc[];
extern const u8 gText_SideQuests_PokemonThief[];
extern const u8 gText_SideQuests_PokemonThiefDesc[];
extern const u8 gText_SideQuests_StarryKitchen[];
extern const u8 gText_SideQuests_StarryKitchenDesc[];
extern const u8 gText_SideQuests_MurkrowInvasion[];
extern const u8 gText_SideQuests_MurkrowInvasionDesc[];

//The quest list, shown in this order. Add new quests before the last line.
static const struct SideQuest sSideQuests[] =
{
	{gText_SideQuests_LostChild,       gText_SideQuests_LostChildDesc,       0x961, 0x962, 16},  //32x32
	{gText_SideQuests_LostScroll,      gText_SideQuests_LostScrollDesc,      0x95E, 0x960, 99},  //16x16
	{gText_SideQuests_CatchSkiddo,     gText_SideQuests_CatchSkiddoDesc,     0x965, 0x966, 22},  //32x32
	{gText_SideQuests_FindShinx,       gText_SideQuests_FindShinxDesc,       0x969, 0x96A, 0xA8},
	{gText_SideQuests_PokemonThief,    gText_SideQuests_PokemonThiefDesc,    0x96B, 0x96C, 0xA9},
	{gText_SideQuests_StarryKitchen,   gText_SideQuests_StarryKitchenDesc,   0x96D, 0x96E, 0xAA},
	{gText_SideQuests_MurkrowInvasion, gText_SideQuests_MurkrowInvasionDesc, 0x970, 0x971, 0xAD},
	{NULL}
};

static const struct SideQuest sEmptyQuest = {gText_SideQuests_Empty, gText_SideQuests_Empty, 0, 0, SQ_NO_NPC};

//Quest texts are drawn with BG palette 15
static const u16 sTextPal[] = {
	0x7C1F, 0x7FFF, 0x39CE, 0x0000, 0x6B5A, 0x1269, 0x230C, 0x2535,
	0x25DC, 0x15F6, 0x1EFE, 0x7C1F, 0x7C1F, 0x7C1F, 0x661F, 0x7F28};

//Colours from sTextPal: {background, text, shadow}
static struct TextColor sTextBlack = {0, 3, 4};

//The cursor arrow's colours: 1 is the fill, 2 the outline (vanilla: 0x015F orange and 0x0090 dark red)
static const u16 sCursorPal[16] = {0x0000, 0x7FFF, 0x7FFF};

//Where to write GUI_COMPLETED's colours: SideQuests_Gui.png has a 32-colour palette.
//Colours 0-15 are the Active look and the only ones the pixels may use. Colours 16-31 replace them, one for one,
//when SELECT switches to the Completed quests.
#define SQ_GUI_PAL_ACTIVE (SideQuests_GuiPal)
#define SQ_GUI_PAL_COMPLETED (SideQuests_GuiPal + 16)

static const struct BgConfig sBgConfig[4] = {
	{.padding = 0, .b_padding = 0, .priority = 2, .palette = 0, .size = 0, .map_base = 29, .character_base = 2, .bgid = 0},
	{.padding = 0, .b_padding = 0, .priority = 3, .palette = 0, .size = 0, .map_base = 28, .character_base = 0, .bgid = 1},
	{.padding = 0, .b_padding = 0, .priority = 3, .palette = 0, .size = 0, .map_base = 30, .character_base = 2, .bgid = 2},
	{.padding = 0, .b_padding = 0, .priority = 3, .palette = 0, .size = 1, .map_base = 31, .character_base = 3, .bgid = 3},
};

//Positions and sizes in tiles (8 px)
static struct TextboxTemplate sTextboxTemplates[] = {
	{.bg_id = 0, .x = 8, .y = 3,  .width = 20, .height = 2, .pal_id = 15, .charbase = 1},   //Quest 1 name
	{.bg_id = 0, .x = 8, .y = 6,  .width = 20, .height = 2, .pal_id = 15, .charbase = 71},  //Quest 2 name
	{.bg_id = 0, .x = 8, .y = 9,  .width = 20, .height = 2, .pal_id = 15, .charbase = 141}, //Quest 3 name
	{.bg_id = 0, .x = 8, .y = 12, .width = 20, .height = 2, .pal_id = 15, .charbase = 211}, //Quest 4 name
	{.bg_id = 0, .x = 2, .y = 15, .width = 20, .height = 5, .pal_id = 15, .charbase = 281}, //Description
	{.bg_id = 0xFF}, //End of the list
};

//In pixels
static const u8 sCursorPositions[SQ_ENTRIES_PER_PAGE][2] = {
	{31, 32 + 24 * 0},
	{31, 32 + 24 * 1},
	{31, 32 + 24 * 2},
	{31, 32 + 24 * 3},
};
//NPC sprites stand on each row's baseline, centred on SQ_NPC_X. Wide ones (32 px) move left so they end
//before SQ_NPC_MAX_RIGHT, where the quest name starts
#define SQ_NPC_X 52
#define SQ_NPC_MAX_RIGHT 66
#define SQ_NPC_BOTTOM(row) (24 * (row) + 41)

static void sq_gui_handler(void);

// ------------------- QUEST LIST ------------------- //

//Active: available and not completed. Completed: completed (whatever flagAvailable says)
static bool sq_is_listed(const struct SideQuest *quest, u8 mode)
{
	if (mode == SQ_MODE_ACTIVE)
		return FlagGet(quest->flagAvailable) && !FlagGet(quest->flagCompleted);

	return FlagGet(quest->flagCompleted);
}

static void sq_init_page(struct SqGuiInfo *info)
{
	for (u8 i = 0; i < SQ_ENTRIES_PER_PAGE; i++)
		info->page_quests[i] = &sEmptyQuest;
}

//Returns true if at least one more quest was available (and the page was filled with them), false otherwise
static bool sq_find_next_quests(struct SqGuiInfo *info)
{
	u8 quest_i = info->page_end_quest_i;
	u8 page_i = 0;

	for (; sSideQuests[quest_i].name != NULL && page_i < SQ_ENTRIES_PER_PAGE; quest_i++)
	{
		if (sq_is_listed(&sSideQuests[quest_i], info->mode))
		{
			if (page_i == 0)
			{
				sq_init_page(info); //Only clear the page once the next one is known to have a quest, otherwise the page can't turn
				info->page_start_quest_i = quest_i;
			}
			info->page_quests[page_i++] = &sSideQuests[quest_i];
		}
	}

	info->page_end_quest_i = quest_i;
	return page_i != 0;
}

//Returns true if at least one previous quest was available (and the page was filled with them), false otherwise
static bool sq_find_prev_quests(struct SqGuiInfo *info)
{
	s16 quest_i = info->page_start_quest_i - 1;
	s8 page_i = SQ_ENTRIES_PER_PAGE - 1;

	for (; quest_i >= 0 && page_i >= 0; quest_i--)
	{
		if (sq_is_listed(&sSideQuests[quest_i], info->mode))
		{
			if (page_i == SQ_ENTRIES_PER_PAGE - 1)
				info->page_end_quest_i = quest_i + 1;
			info->page_quests[page_i--] = &sSideQuests[quest_i]; //The previous page is always full, so every row is overwritten
		}
	}

	info->page_start_quest_i = quest_i + 1;
	return page_i != SQ_ENTRIES_PER_PAGE - 1;
}

// ------------------- SPRITES ------------------- //

static struct SqShapeSize sq_shape_size(u8 w, u8 h)
{
	struct SqShapeSize ret = {0};

	if (w == h)
	{
		ret.shape = 0; //Square
		switch (w) {
			case 8:  ret.size = 0; break;
			case 16: ret.size = 1; break;
			case 32: ret.size = 2; break;
			case 64: ret.size = 3; break;
		}
	}
	else if (w > h)
	{
		ret.shape = 1; //Horizontal
		if (w == 16)
			ret.size = 0;
		else if (w == 32)
			ret.size = (h == 8) ? 1 : 2;
		else
			ret.size = 3;
	}
	else
	{
		ret.shape = 2; //Vertical
		if (h == 16)
			ret.size = 0;
		else if (h == 32)
			ret.size = (w == 8) ? 1 : 2;
		else
			ret.size = 3;
	}

	return ret;
}

static u8 sq_display_sprite(u8 w, u8 h, u8 x, u8 y, u16 tiles_tag, const void *tiles_ptr, u16 tiles_size,
                            u16 pals_tag, bool compressed, bool h_flip)
{
	struct SqShapeSize shsi = sq_shape_size(w, h);
	const struct OamData oam = {
		.shape = shsi.shape,
		.size = shsi.size,
		.h_flip = h_flip,
		.priority = 2,
	};
	struct SpriteTiles tiles = {tiles_ptr, tiles_size, tiles_tag};
	struct Template template = {
		.tiles_tag = tiles_tag,
		.pal_tag = pals_tag,
		.oam = &oam,
		.animation = (const struct Frame (**)[]) 0x8231CF0,
		.graphics = &tiles,
		.rotscale = (const struct RotscaleFrame (**)[]) 0x8231CFC,
		.callback = oac_nullsub,
	};

	if (compressed)
		gpu_tile_obj_decompress_alloc_tag_and_upload_small_decompression_buffer(&tiles);
	else
		gpu_tile_obj_alloc_tag_and_upload(&tiles);

	return template_instanciate_forward_search(&template, x, y, 0);
}

static u8 sq_display_cursor(void)
{
	struct SpritePalette pal = {sCursorPal, SQ_CURSOR_PALS_TAG};
	gpu_pal_obj_alloc_tag_and_apply(&pal);
	return sq_display_sprite(16, 16, sCursorPositions[0][0], sCursorPositions[0][1],
	                         SQ_CURSOR_TILES_TAG, SQ_CURSOR_TILES, 16 * 16, SQ_CURSOR_PALS_TAG, true, true);
}

//Shows the first frame of an overworld sprite of any size (16x16, 16x32, 32x32...) on a row
static u8 sq_display_npc(u16 npc, u8 row, u16 tiles_tag)
{
	const struct SqNpcGraphicsInfo *gfx = GetEventObjectGraphicsInfo(npc);
	u16 palTags[] = {gfx->paletteTag, 0x11FF}; //0x11FF ends the list
	s16 x = SQ_NPC_X;
	s16 y = SQ_NPC_BOTTOM(row) - gfx->height / 2; //Sprites are positioned by their centre

	if (x + gfx->width / 2 > SQ_NPC_MAX_RIGHT)
		x = SQ_NPC_MAX_RIGHT - gfx->width / 2;

	LoadObjectEventPaletteSet(palTags);
	return sq_display_sprite(gfx->width, gfx->height, x, y,
	                         tiles_tag, gfx->images[0].data, gfx->images[0].size, gfx->paletteTag, false, false);
}

// ------------------- TEXT ------------------- //

static void sq_write_title(u8 id, const u8 *s)
{
	rboxid_print(id, 0, 3, 0, &sTextBlack, 0, (const pchar *) s);
}

static void sq_write_desc(const u8 *s)
{
	rboxid_clear_pixels(SQ_DESC_RBOX_ID, 0);
	rboxid_print(SQ_DESC_RBOX_ID, 0, 0, 6, &sTextBlack, 0, (const pchar *) s);
	rboxid_update(SQ_DESC_RBOX_ID, 1);
	rboxid_tilemap_update(SQ_DESC_RBOX_ID);
}

// ------------------- SETUP ------------------- //

static void sq_close_startmenu(void)
{
	safari_stepscount_close();
	sm_close_description();
	sm_close_menu();
}

static void sq_setup(void)
{
	u32 set = 0;

	//Callbacks
	vblank_handler_set(0);
	hblank_handler_set(0);
	set_callback1(0);
	set_callback2(0);

	//BGs
	overworld_free_bgmaps();
	gpu_tile_bg_drop_all_sets(0);
	for (u8 i = 0; i < 4; i++)
	{
		bgid_mod_x_offset(i, 0, 0);
		bgid_mod_y_offset(i, 0, 0);
	}

	//Palettes
	pal_fade_control_and_dead_struct_reset();
	palette_bg_faded_fill_black();
	gpu_pal_allocator_reset();
	gpu_pal_tag_search_lower_boundary = 0; //No reserved sprite palettes

	//Sprites
	obj_and_aux_reset_all();
	gpu_tile_obj_tags_reset();

	//VRAM
	CpuFastSet(&set, (void *) ADDR_VRAM, CPUModeFS(0x10000, CPUFSSET));

	//Tasks
	malloc_init((void *) 0x2000000, 0x1C000);
	tasks_init();
}

static void sq_c2(void)
{
	obj_sync_superstate();
	objc_exec();
	process_palfade();
	task_exec();
	tilemaps_sync();
	remoboxes_upload_tilesets(); //Merges the textbox and text tilemaps
}

static void sq_vblank(void)
{
	gpu_sprites_upload();
	copy_queue_process();
	gpu_pal_upload();
}

// ------------------- GUI ------------------- //

static void sq_exit(void)
{
	switch (super.multi_purpose_state_tracker) {
		case 0:
			fade_screen(0xFFFFFFFF, 0, 0, 16, 0x0000);
			gpu_sync_bg_hide(1);
			gpu_sync_bg_hide(0);
			super.multi_purpose_state_tracker++;
			break;
		case 1:
			m4aMPlayVolumeControl(&mplay_BGM, 0xFFFF, 256);
			set_callback1(c1_overworld);
			set_callback2(c2_overworld_switch_start_menu); //Back to the start menu
			super.multi_purpose_state_tracker++;
			break;
		case 2:
			fade_screen(0xFFFFFFFF, 0, 16, 0, 0x0000);
			gpu_sync_bg_show(0);
			gpu_sync_bg_show(1);
			super.multi_purpose_state_tracker++;
			break;
	}
}

static void sq_update_cursor(void)
{
	struct SqGuiInfo *info = SQ_GUI_INFO;

	objects[info->cursor_oam_id].pos1.x = sCursorPositions[info->cursor_i][0];
	objects[info->cursor_oam_id].pos1.y = sCursorPositions[info->cursor_i][1];
	sq_write_desc(info->page_quests[info->cursor_i]->desc);
}

static void sq_turn_page(void)
{
	struct SqGuiInfo *info = SQ_GUI_INFO;

	gpu_sync_bg_hide(1);
	gpu_sync_bg_hide(0);
	info->cursor_i = 0;
	super.multi_purpose_state_tracker = 2; //Redraw the texts and sprites

	for (u8 i = 0; i < SQ_ENTRIES_PER_PAGE; i++)
	{
		obj_free(&objects[info->npc_oam_ids[i]]);
		obj_delete(&objects[info->npc_oam_ids[i]]);
	}
	obj_free(&objects[info->cursor_oam_id]);
	obj_delete(&objects[info->cursor_oam_id]);
	audio_play(SOUND_GENERIC_CLINK);
}

//Opens the Side Quests menu. Called from scripts with "callasm SideQuests_Open +1" (see Script_Quests)
u8 SideQuests_Open(void)
{
	sq_close_startmenu();
	pal_fade_control_and_dead_struct_reset(); //In case a previous script's fade never fully cleared
	fade_screen(0xFFFFFFFF, 0, 0, 16, 0x0000);
	set_callback1(sq_gui_handler);
	super.multi_purpose_state_tracker = 0;
	return 1;
}

static void sq_gui_handler(void)
{
	struct SqGuiInfo *info = SQ_GUI_INFO;

	switch (super.multi_purpose_state_tracker) {
		case 0:
			if (!pal_fade_control.active)
			{
				u32 set = 0;

				sq_setup(); //Clear all graphics
				rboxes_free();
				bgid_mod_x_offset(0, 0, 0); //Configure the BGs whatever their previous state
				bgid_mod_y_offset(0, 0, 0);
				bgid_mod_x_offset(1, 0, 0);
				bgid_mod_y_offset(1, 0, 0);
				gpu_tile_bg_drop_all_sets(0);
				bg_vram_setup(0, (struct BgConfig *) sBgConfig, 4);
				CpuFastSet(&set, (void *) ADDR_VRAM, CPUModeFS(0x10000, CPUFSSET));
				gpu_sync_bg_hide(1);
				gpu_sync_bg_hide(0);
				set_callback2(sq_c2);
				vblank_handler_set(sq_vblank);
				set_callback1(sq_gui_handler);

				info->cursor_i = 0;
				info->page_start_quest_i = 0;
				info->page_end_quest_i = 0;
				info->mode = SQ_MODE_ACTIVE;
				for (u8 i = 0; i < SQ_ENTRIES_PER_PAGE; i++)
					info->npc_oam_ids[i] = 0;

				super.multi_purpose_state_tracker++;
			}
			break;
		case 1: //Load the background, textboxes and quest list
		{
			void *tilemap = malloc(0x800);

			gpu_pal_apply((void *) sTextPal, 15 * 16, 32);
			gpu_pal_apply((void *) SQ_GUI_PAL_ACTIVE, 0, 32);
			LZ77UnCompWram((void *) SideQuests_GuiMap, tilemap);
			lz77UnCompVram((void *) SideQuests_GuiTiles, (void *) 0x06000000);
			bgid_set_tilemap(1, tilemap);
			bgid_mark_for_sync(1);
			bgid_mark_for_sync(0);
			rbox_init_from_templates(sTextboxTemplates);
			sq_init_page(info);
			sq_find_next_quests(info);
			super.multi_purpose_state_tracker++;
			break;
		}
		case 2: //Fill the textboxes
			if (!pal_fade_control.active)
			{
				for (u8 i = 0; i < 5; i++)
					rboxid_clear_pixels(i, 0);

				for (u8 i = 0; i < SQ_ENTRIES_PER_PAGE; i++)
				{
					sq_write_title(i, info->page_quests[i]->name);
					rboxid_update(i, 1);
					rboxid_tilemap_update(i);
				}

				sq_write_desc(info->page_quests[0]->desc);
				super.multi_purpose_state_tracker++;
			}
			//Fallthrough
		case 3: //Show the cursor and the NPCs
			info->cursor_oam_id = sq_display_cursor();
			for (u8 i = 0; i < SQ_ENTRIES_PER_PAGE && info->page_quests[i]->npc != SQ_NO_NPC; i++)
				info->npc_oam_ids[i] = sq_display_npc(info->page_quests[i]->npc, i, SQ_NPC_TILES_TAG + i);
			super.multi_purpose_state_tracker++;
			//Fallthrough
		case 4: //Show the screen
			fade_screen(0xFFFFFFFF, 0, 16, 0, 0x0000);
			gpu_sync_bg_show(0);
			gpu_sync_bg_show(1);
			super.multi_purpose_state_tracker++;
			break;
		case 5: //Input. NOTE: L and R are swapped in pokeagb
			if (!pal_fade_control.active)
			{
				switch (super.buttons_new_remapped & (KEY_B | KEY_DOWN | KEY_UP | KEY_L | KEY_R | KEY_SELECT)) {
					case KEY_SELECT: //Switch between Active and Completed quests
						if (info->mode == SQ_MODE_ACTIVE)
						{
							gpu_pal_apply((void *) SQ_GUI_PAL_COMPLETED, 0, 32);
							info->mode = SQ_MODE_COMPLETED;
						}
						else
						{
							gpu_pal_apply((void *) SQ_GUI_PAL_ACTIVE, 0, 32);
							info->mode = SQ_MODE_ACTIVE;
						}
						info->cursor_i = 0;
						info->page_start_quest_i = 0;
						info->page_end_quest_i = 0;
						sq_init_page(info);
						sq_find_next_quests(info);
						sq_turn_page();
						break;
					case KEY_R:
						if (!sq_find_next_quests(info))
							audio_play(SOUND_WALLRUN); //No more quests: "denied" sound
						else
							sq_turn_page();
						break;
					case KEY_L:
						if (!sq_find_prev_quests(info))
							audio_play(SOUND_WALLRUN);
						else
							sq_turn_page();
						break;
					case KEY_B: //Back to the start menu
						set_callback1(sq_exit);
						super.multi_purpose_state_tracker = 0;
						return;
					case KEY_DOWN:
						info->cursor_i = info->cursor_i == SQ_ENTRIES_PER_PAGE - 1 ? 0 : info->cursor_i + 1;
						audio_play(SOUND_GENERIC_CLINK);
						break;
					case KEY_UP:
						info->cursor_i = info->cursor_i == 0 ? SQ_ENTRIES_PER_PAGE - 1 : info->cursor_i - 1;
						audio_play(SOUND_GENERIC_CLINK);
						break;
				}
				sq_update_cursor();
			}
			break;
	}
}
