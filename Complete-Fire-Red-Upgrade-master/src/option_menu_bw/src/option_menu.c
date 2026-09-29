#include "global.h"
#include "option_menu.h"
#include "main.h"
#include "menu.h"
#include "scanline_effect.h"
#include "palette.h"
#include "sprite.h"
#include "task.h"
#include "bg.h"
#include "gpu_regs.h"
#include "window.h"
#include "text.h"
#include "text_window.h"
#include "international_string_util.h"
#include "string_util.h"
#include "event_data.h"

#define MENUITEM_DESCRIPTION MENUITEM_COUNT

// Following Pokemon: flag set = ON (CFRU's FLAG_FOLLOWER_POKEMON)
#define FLAG_FOLLOWER           0x999
#define FOLLOWER_ON             0
#define FOLLOWER_OFF            1

// Difficulty: var holds 0/1/2, hard mode also sets its own flag
#define VAR_DIFFICULTY          0x406A
#define DIFFICULTY_NORMAL       0
#define DIFFICULTY_TOUGH        1
#define DIFFICULTY_HARD         2
#define DIFFICULTY_COUNT        3

// VAR_DIFFICULTY holds CFRU's difficulty numbers (VAR_GAME_DIFFICULTY in config.h): the menu shows Normal, Tough, Hard
static const u8 sDifficultyToGameDifficulty[DIFFICULTY_COUNT] = {0, 2, 3}; // Normal, CFRU Hard, CFRU Expert

// Task data
enum
{
    TD_MENUSELECTION,
    TD_TEXTSPEED,
    TD_BATTLESCENE,
    TD_BATTLESTYLE,
    TD_FOLLOWER,
    TD_BUTTONMODE,
    TD_DIFFICULTY,
	TD_TIMER,
};

// Menu items
enum
{
    MENUITEM_TEXTSPEED,
    MENUITEM_BATTLESCENE,
    MENUITEM_BATTLESTYLE,
    MENUITEM_FOLLOWER,
    MENUITEM_BUTTONMODE,
    MENUITEM_DIFFICULTY,
    MENUITEM_COUNT,
};

// this file's functions
static void Task_OptionMenuFadeIn(u8 taskId);
static void Task_OptionMenuProcessInput(u8 taskId);
static void Task_OptionMenuSave(u8 taskId);
static void Task_OptionMenuCancel(u8 taskId);
static void Task_OptionMenuFadeOut(u8 taskId);
static u8   TextSpeed_ProcessInput(u8 selection);
static void TextSpeed_DrawChoices(u8 selection);
static u8   BattleScene_ProcessInput(u8 selection);
static void BattleScene_DrawChoices(u8 selection);
static u8   BattleStyle_ProcessInput(u8 selection);
static void BattleStyle_DrawChoices(u8 selection);
static u8   Follower_ProcessInput(u8 selection);
static void Follower_DrawChoices(u8 selection);
static u8   Difficulty_ProcessInput(u8 selection);
static void Difficulty_DrawChoices(u8 selection);
static u8   ButtonMode_ProcessInput(u8 selection);
static void ButtonMode_DrawChoices(u8 selection);
static void DrawOptionMenuTexts(void);
static void OptionMenu_ClearWindow(u8 option);
static void ShowDescription(const u8 *text);
static void SetDescription(u8 selection);

// EWRAM vars
u8 sArrowPressed = FALSE;

// const rom data

// One background per highlighted row, built from graphics/OptionMenu/OptionMenu_<row>.png (256x160, 32 colours:
// 0-15 and 16-31 become BG palettes 0 and 1, each 8x8 tile uses one half)
#define OPTION_MENU_SCREEN(name) extern const u32 OptionMenu_##name##Tiles[]; extern const u32 OptionMenu_##name##Map[]; extern const u16 OptionMenu_##name##Pal[];
OPTION_MENU_SCREEN(TextSpeed)
OPTION_MENU_SCREEN(BattleScene)
OPTION_MENU_SCREEN(BattleStyle)
OPTION_MENU_SCREEN(Following)
OPTION_MENU_SCREEN(Controls)
OPTION_MENU_SCREEN(Difficulty)

// Text colours, loaded into BG palette 5 (window 0). Dark text for the light option menu graphics:
// 1 = row names, the selected choice and the description (dark purple), 2 = title and SAVE/CANCEL (dark purple),
// 3 = shadow (light grey), 5 = unselected choices (grey-purple)
static const u16 sOptionMenuTextPal[16] =
{
    0x0000, 0x44AA, 0x44AA, 0x675A, 0x318C, 0x5A33, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x675A, 0x0000,
};

// Texts are in strings/option_menu_bw.string
extern const u8 localText_Option[];
extern const u8 localText_Instructions[];
extern const u8 localText_InstructionsCancel[];
extern const u8 localText_TextSpeed[];
extern const u8 localText_BattleScene[];
extern const u8 localText_BattleStyle[];
extern const u8 localText_Follower[];
extern const u8 localText_Difficulty[];
extern const u8 localText_ButtonMode[];
extern const u8 localText_TextSpeedSlow[];
extern const u8 localText_TextSpeedMid[];
extern const u8 localText_TextSpeedFast[];
extern const u8 localText_BattleSceneOn[];
extern const u8 localText_BattleSceneOff[];
extern const u8 localText_BattleStyleShift[];
extern const u8 localText_BattleStyleSet[];
extern const u8 localText_FollowerOn[];
extern const u8 localText_FollowerOff[];
extern const u8 localText_DifficultyNormal[];
extern const u8 localText_DifficultyTough[];
extern const u8 localText_DifficultyHard[];
extern const u8 localText_ButtonTypeNormal[];
extern const u8 localText_ButtonTypeLR[];
extern const u8 localText_ButtonTypeLEqualsA[];
extern const u8 localText_TextSpeedDescription[];
extern const u8 localText_BattleSceneDescription[];
extern const u8 localText_BattleStyleDescription[];
extern const u8 localText_FollowerDescription[];
extern const u8 localText_DifficultyDescription[];
extern const u8 localText_ButtonModeDescription[];
extern const u8 localText_ExitWithSave[];
extern const u8 localText_ExitWithoutSave[];

static const u8 *const sOptionMenuItemsNames[MENUITEM_COUNT] =
{
    localText_TextSpeed,
    localText_BattleScene,
    localText_BattleStyle,
    localText_Follower,
    localText_ButtonMode,
    localText_Difficulty,
};

static const u8 *const sOptionMenuDescriptions[] =
{
    localText_TextSpeedDescription,
    localText_BattleSceneDescription,
    localText_BattleStyleDescription,
    localText_FollowerDescription,
    localText_ButtonModeDescription,
    localText_DifficultyDescription,
	localText_ExitWithSave,
	localText_ExitWithoutSave,
};

struct OptionMenuScreen
{
    const u32 *tiles;
    const u32 *map;
    const u16 *pal;
};

// Order of MENUITEM_*
static const struct OptionMenuScreen sOptionMenuScreens[MENUITEM_COUNT] =
{
    {OptionMenu_TextSpeedTiles,   OptionMenu_TextSpeedMap,   OptionMenu_TextSpeedPal},
    {OptionMenu_BattleSceneTiles, OptionMenu_BattleSceneMap, OptionMenu_BattleScenePal},
    {OptionMenu_BattleStyleTiles, OptionMenu_BattleStyleMap, OptionMenu_BattleStylePal},
    {OptionMenu_FollowingTiles,   OptionMenu_FollowingMap,   OptionMenu_FollowingPal},
    {OptionMenu_ControlsTiles,    OptionMenu_ControlsMap,    OptionMenu_ControlsPal},
    {OptionMenu_DifficultyTiles,  OptionMenu_DifficultyMap,  OptionMenu_DifficultyPal},
};

// BG1: tiles at the start of VRAM (char base 0), map in screen block 7
static void LoadOptionMenuScreen(u8 selection)
{
    const struct OptionMenuScreen *screen = &sOptionMenuScreens[selection];

    LZ77UnCompVram(screen->tiles, (void *)VRAM);
    LZ77UnCompVram(screen->map, (void *)(VRAM + 0x3800));
    LoadPalette(screen->pal, 0x00, 0x40); // BG palettes 0 and 1
}

static const struct WindowTemplate sOptionMenuWinTemplates[] =
{
    {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 30,
        .height = 20,
        .paletteNum = 5,
        .baseBlock = 0
    },
	DUMMY_WIN_TEMPLATE //The description box is part of the background graphics
};

static const struct BgTemplate sOptionMenuBgTemplates[] =
{
   {
       .bg = 0,
       .charBaseIndex = 1,
       .mapBaseIndex = 31,
       .screenSize = 0,
       .paletteMode = 0,
       .priority = 0,
       .baseTile = 0	   
   },
   {
       .bg = 1,
       .charBaseIndex = 0,
       .mapBaseIndex = 7,
       .screenSize = 0,
       .paletteMode = 0,
       .priority = 2,
       .baseTile = 0
   },
   {
       .bg = 2,
       .charBaseIndex = 0,
       .mapBaseIndex = 30,
       .screenSize = 0,
       .paletteMode = 0,
       .priority = 1,
       .baseTile = 0
   }
};

enum
{
	DESCRIPTION,
	FRAME,
};

// code
static void MainCB2(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_NewInitOptionMenu(void)
{
    switch (gMain.state)
    {
    default:
    case 0:
        SetVBlankCallback(NULL);
		SetHBlankCallback(NULL);
        gMain.state++;
        break;
    case 1:
		DmaClearLarge16(3, (void*)(VRAM), VRAM_SIZE, 0x1000);
        DmaClear32(3, OAM, OAM_SIZE);
        DmaClear16(3, PLTT, PLTT_SIZE);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
		ResetBgsAndClearDma3BusyFlags(0);
		InitBgsFromTemplates(0, sOptionMenuBgTemplates, ARRAY_COUNT(sOptionMenuBgTemplates));
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        ChangeBgX(1, 0, 0);
		ChangeBgY(1, 0, 0);
        ChangeBgX(2, 0, 0);
        ChangeBgY(2, 0, 0);
        ChangeBgX(3, 0, 0);
        ChangeBgY(3, 0, 0);
    	InitWindows(sOptionMenuWinTemplates);
		DeactivateAllTextPrinters();
        SetGpuReg(REG_OFFSET_WIN0H, 0);
        SetGpuReg(REG_OFFSET_WIN0V, 0);
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
	    ShowBg(0);
        ShowBg(1); //BG2 held the old description box frame
		gMain.state++;
        break;
    case 2:
        ResetSpriteData();
		ResetPaletteFade();
		FreeAllSpritePalettes();
     	ResetTasks();
        ScanlineEffect_Stop();
        gMain.state++;
        break;
    case 3:
    case 4:
        gMain.state++;
        break;
    case 5:
		LoadOptionMenuScreen(MENUITEM_TEXTSPEED);
        gMain.state++;
        break;
    case 6:
        gMain.state++;
        break;
    case 7:
		LoadPalette(sOptionMenuTextPal, 0x50, 0x20);
        gMain.state++;
        break;
    case 8:
		PutWindowTilemap(0);
		DrawOptionMenuTexts();
        gMain.state++;
        break;
    case 9:
        gMain.state++;
        break;
    case 10:
    {
        u8 taskId = CreateTask(Task_OptionMenuFadeIn, 0);

        gTasks[taskId].data[TD_MENUSELECTION] = 0;
        gTasks[taskId].data[TD_TEXTSPEED] = gSaveBlock2Ptr->optionsTextSpeed;
        gTasks[taskId].data[TD_BATTLESCENE] = gSaveBlock2Ptr->optionsBattleSceneOff;
        gTasks[taskId].data[TD_BATTLESTYLE] = gSaveBlock2Ptr->optionsBattleStyle;
        gTasks[taskId].data[TD_FOLLOWER] = FlagGet(FLAG_FOLLOWER) ? FOLLOWER_ON : FOLLOWER_OFF;
        gTasks[taskId].data[TD_BUTTONMODE] = gSaveBlock2Ptr->optionsButtonMode;
        gTasks[taskId].data[TD_DIFFICULTY] = DIFFICULTY_NORMAL;
        for (u32 i = 0; i < DIFFICULTY_COUNT; i++)
        {
            if (VarGet(VAR_DIFFICULTY) == sDifficultyToGameDifficulty[i])
                gTasks[taskId].data[TD_DIFFICULTY] = i;
        }

        TextSpeed_DrawChoices(gTasks[taskId].data[TD_TEXTSPEED]);
        BattleScene_DrawChoices(gTasks[taskId].data[TD_BATTLESCENE]);
        BattleStyle_DrawChoices(gTasks[taskId].data[TD_BATTLESTYLE]);
        Follower_DrawChoices(gTasks[taskId].data[TD_FOLLOWER]);
        ButtonMode_DrawChoices(gTasks[taskId].data[TD_BUTTONMODE]);
        Difficulty_DrawChoices(gTasks[taskId].data[TD_DIFFICULTY]);
        
		CopyWindowToVram(0, 3);
        gMain.state++;
        break;
    }
    case 11:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0x10, 0, 0);
        SetVBlankCallback(VBlankCB);
        SetMainCallback2(MainCB2);
		return;
    }
}

static void Task_OptionMenuFadeIn(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_OptionMenuProcessInput;
}

static void Task_OptionMenuProcessInput(u8 taskId)
{
	if (gMain.newKeys & A_BUTTON)
    {
		OptionMenu_ClearWindow(DESCRIPTION);
        gTasks[taskId].data[TD_TIMER] = 20;
		gTasks[taskId].func = Task_OptionMenuSave;
    }
	else if (gMain.newKeys & B_BUTTON)
    {
		OptionMenu_ClearWindow(DESCRIPTION);
        gTasks[taskId].data[TD_TIMER] = 20;
		gTasks[taskId].func = Task_OptionMenuCancel;
    }
    else if (gMain.newKeys & DPAD_UP)
    {
        if (gTasks[taskId].data[TD_MENUSELECTION] > 0)
            gTasks[taskId].data[TD_MENUSELECTION]--;
        else
            gTasks[taskId].data[TD_MENUSELECTION] = 5;
		LoadOptionMenuScreen(gTasks[taskId].data[TD_MENUSELECTION]);
		OptionMenu_ClearWindow(DESCRIPTION);
		SetDescription(gTasks[taskId].data[TD_MENUSELECTION]);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        if (gTasks[taskId].data[TD_MENUSELECTION] < 5)
            gTasks[taskId].data[TD_MENUSELECTION]++;
        else
            gTasks[taskId].data[TD_MENUSELECTION] = 0;
		LoadOptionMenuScreen(gTasks[taskId].data[TD_MENUSELECTION]);
		OptionMenu_ClearWindow(DESCRIPTION);
		SetDescription(gTasks[taskId].data[TD_MENUSELECTION]);
    }
    else
    {
        u8 previousOption;

        switch (gTasks[taskId].data[TD_MENUSELECTION])
        {
        case MENUITEM_TEXTSPEED:
			previousOption = gTasks[taskId].data[TD_TEXTSPEED];
            gTasks[taskId].data[TD_TEXTSPEED] = TextSpeed_ProcessInput(gTasks[taskId].data[TD_TEXTSPEED]);

            if (previousOption != gTasks[taskId].data[TD_TEXTSPEED])
                TextSpeed_DrawChoices(gTasks[taskId].data[TD_TEXTSPEED]);
            break;
        case MENUITEM_BATTLESCENE:
            previousOption = gTasks[taskId].data[TD_BATTLESCENE];
            gTasks[taskId].data[TD_BATTLESCENE] = BattleScene_ProcessInput(gTasks[taskId].data[TD_BATTLESCENE]);

            if (previousOption != gTasks[taskId].data[TD_BATTLESCENE])
                BattleScene_DrawChoices(gTasks[taskId].data[TD_BATTLESCENE]);
			break;
        case MENUITEM_BATTLESTYLE:
            previousOption = gTasks[taskId].data[TD_BATTLESTYLE];
            gTasks[taskId].data[TD_BATTLESTYLE] = BattleStyle_ProcessInput(gTasks[taskId].data[TD_BATTLESTYLE]);

            if (previousOption != gTasks[taskId].data[TD_BATTLESTYLE])
                BattleStyle_DrawChoices(gTasks[taskId].data[TD_BATTLESTYLE]);
            break;
        case MENUITEM_FOLLOWER:
            previousOption = gTasks[taskId].data[TD_FOLLOWER];
            gTasks[taskId].data[TD_FOLLOWER] = Follower_ProcessInput(gTasks[taskId].data[TD_FOLLOWER]);

            if (previousOption != gTasks[taskId].data[TD_FOLLOWER])
                Follower_DrawChoices(gTasks[taskId].data[TD_FOLLOWER]);
            break;
        case MENUITEM_BUTTONMODE:
            previousOption = gTasks[taskId].data[TD_BUTTONMODE];
            gTasks[taskId].data[TD_BUTTONMODE] = ButtonMode_ProcessInput(gTasks[taskId].data[TD_BUTTONMODE]);

            if (previousOption != gTasks[taskId].data[TD_BUTTONMODE])
                ButtonMode_DrawChoices(gTasks[taskId].data[TD_BUTTONMODE]);
			break;
        case MENUITEM_DIFFICULTY:
            previousOption = gTasks[taskId].data[TD_DIFFICULTY];
            gTasks[taskId].data[TD_DIFFICULTY] = Difficulty_ProcessInput(gTasks[taskId].data[TD_DIFFICULTY]);

            if (previousOption != gTasks[taskId].data[TD_DIFFICULTY])
                Difficulty_DrawChoices(gTasks[taskId].data[TD_DIFFICULTY]);
            break;
        default:
            return;
        }

        if (sArrowPressed)
        {
            sArrowPressed = FALSE;
            CopyWindowToVram(0, 2);
        }
    }
}

static void OptionMenu_ClearWindow(u8 option)
{
	if (option == DESCRIPTION)
	{	
		FillWindowPixelRect(0, 0, 8, 120, 224, 32);
	}
	else //(option == FRAME)
	{	
		FillWindowPixelRect(0, 0, 142, 96, 16, 16);
	}
	CopyWindowToVram(0, 2);
}

static void Task_OptionMenuSave(u8 taskId)
{
	SetDescription(6);
	if (gTasks[taskId].data[TD_TIMER])
    {
        gTasks[taskId].data[TD_TIMER]--;
    }
    else
	{
		gSaveBlock2Ptr->optionsTextSpeed = gTasks[taskId].data[TD_TEXTSPEED];
		gSaveBlock2Ptr->optionsBattleSceneOff = gTasks[taskId].data[TD_BATTLESCENE];
		gSaveBlock2Ptr->optionsBattleStyle = gTasks[taskId].data[TD_BATTLESTYLE];
		gSaveBlock2Ptr->optionsButtonMode = gTasks[taskId].data[TD_BUTTONMODE];

		if (gTasks[taskId].data[TD_FOLLOWER] == FOLLOWER_ON)
			FlagSet(FLAG_FOLLOWER);
		else
			FlagClear(FLAG_FOLLOWER);

		VarSet(VAR_DIFFICULTY, sDifficultyToGameDifficulty[gTasks[taskId].data[TD_DIFFICULTY]]);

		BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0);
		gTasks[taskId].func = Task_OptionMenuFadeOut;
	}
}

static void Task_OptionMenuCancel(u8 taskId)
{
	SetDescription(7);
	if (gTasks[taskId].data[TD_TIMER])
    {
        gTasks[taskId].data[TD_TIMER]--;
    }
    else
	{
		BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0);
		gTasks[taskId].func = Task_OptionMenuFadeOut;
	}
}

static void Task_OptionMenuFadeOut(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        FreeAllWindowBuffers();
        SetMainCallback2(gMain.savedCallback);
    }
}

static void DrawOptionMenuChoice(const u8 *text, u8 x, u8 y, u8 style)
{
    u8 dst[160];
    u16 i;

    for (i = 0; *text != EOS && i <= 160; i++)
        dst[i] = *(text++);
	
	dst[2] = style;
    dst[i] = EOS;
    AddTextPrinterParameterized(0, 1, dst, x, y + 1, TEXT_SPEED_FF, NULL);
	CopyWindowToVram(0, 2);
}

static void SetDescription(u8 selection)
{
	ShowDescription(sOptionMenuDescriptions[selection]);
}

static void ShowDescription(const u8 *text)
{
	u8 dst[160];
    u16 i;

    for (i = 0; *text != EOS && i <= 160; i++)
        dst[i] = *(text++);
	
	dst[2] = 1; //Dark purple on the white description box
    dst[i] = EOS;
	AddTextPrinterParameterized4(0, 1, 12, 120, 0, 0, 0, 0, dst);
}

static u8 TextSpeed_ProcessInput(u8 selection)
{
    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (selection < 2)
            selection++;
        else
            selection = 0;

        sArrowPressed = TRUE;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (selection != 0)
            selection--;
        else
            selection = 2;

        sArrowPressed = TRUE;
    }
    return selection;
}

static void TextSpeed_DrawChoices(u8 selection)
{
    u8 styles[3];

    styles[0] = 5;
    styles[1] = 5;
    styles[2] = 5;
    styles[selection] = 1;

    DrawOptionMenuChoice(localText_TextSpeedSlow, 112, 16, styles[0]);
    DrawOptionMenuChoice(localText_TextSpeedMid,  148, 16, styles[1]);
    DrawOptionMenuChoice(localText_TextSpeedFast, 184, 16, styles[2]);
}

static u8 BattleScene_ProcessInput(u8 selection)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        selection ^= 1;
        sArrowPressed = TRUE;
    }

    return selection;
}

static void BattleScene_DrawChoices(u8 selection)
{
    u8 styles[2];

    styles[0] = 5;
    styles[1] = 5;
    styles[selection] = 1;

    DrawOptionMenuChoice(localText_BattleSceneOn,  112, 32, styles[0]);
    DrawOptionMenuChoice(localText_BattleSceneOff, 162, 32, styles[1]);
}

static u8 BattleStyle_ProcessInput(u8 selection)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        selection ^= 1;
        sArrowPressed = TRUE;
    }

    return selection;
}

static void BattleStyle_DrawChoices(u8 selection)
{
    u8 styles[2];

    styles[0] = 5;
    styles[1] = 5;
    styles[selection] = 1;

    DrawOptionMenuChoice(localText_BattleStyleShift, 112, 48, styles[0]);
    DrawOptionMenuChoice(localText_BattleStyleSet,   162, 48, styles[1]);
}

static u8 Follower_ProcessInput(u8 selection)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        selection ^= 1;
        sArrowPressed = TRUE;
    }

    return selection;
}

static void Follower_DrawChoices(u8 selection)
{
    u8 styles[2];

    styles[0] = 5;
    styles[1] = 5;
    styles[selection] = 1;

    DrawOptionMenuChoice(localText_FollowerOn,  112, 64, styles[FOLLOWER_ON]);
    DrawOptionMenuChoice(localText_FollowerOff, 162, 64, styles[FOLLOWER_OFF]);
}

static u8 Difficulty_ProcessInput(u8 selection)
{
    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (selection < DIFFICULTY_COUNT - 1)
            selection++;
        else
            selection = 0;

        sArrowPressed = TRUE;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (selection != 0)
            selection--;
        else
            selection = DIFFICULTY_COUNT - 1;

        sArrowPressed = TRUE;
    }
    return selection;
}

static void Difficulty_DrawChoices(u8 selection)
{
    u8 styles[DIFFICULTY_COUNT];

    styles[DIFFICULTY_NORMAL] = 5;
    styles[DIFFICULTY_TOUGH] = 5;
    styles[DIFFICULTY_HARD] = 5;
    styles[selection] = 1;

    DrawOptionMenuChoice(localText_DifficultyNormal, 112, 96, styles[DIFFICULTY_NORMAL]);
    DrawOptionMenuChoice(localText_DifficultyTough,  162, 96, styles[DIFFICULTY_TOUGH]);
    DrawOptionMenuChoice(localText_DifficultyHard,   200, 96, styles[DIFFICULTY_HARD]);
}

static u8 ButtonMode_ProcessInput(u8 selection)
{
    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (selection <= 1)
            selection++;
        else
            selection = 0;

        sArrowPressed = TRUE;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (selection != 0)
            selection--;
        else
            selection = 2;

        sArrowPressed = TRUE;
    }
    return selection;
}

static void ButtonMode_DrawChoices(u8 selection)
{
    u8 styles[3];

    styles[0] = 5;
    styles[1] = 5;
    styles[2] = 5;
    styles[selection] = 1;

    DrawOptionMenuChoice(localText_ButtonTypeNormal,   112, 80, styles[0]);
    DrawOptionMenuChoice(localText_ButtonTypeLR,       162, 80, styles[1]);
    DrawOptionMenuChoice(localText_ButtonTypeLEqualsA, 188, 80, styles[2]);
}

static void DrawOptionMenuTexts(void)
{
    u8 i;

    FillWindowPixelBuffer(0, PIXEL_FILL(0));
	AddTextPrinterParameterized(0, 1, localText_Option, 8, 1, TEXT_SPEED_FF, NULL);
	AddTextPrinterParameterized(0, 1, localText_Instructions, 140, 0 , TEXT_SPEED_FF, NULL); //SAVE, right of the A icon (x 128-135)
	AddTextPrinterParameterized(0, 1, localText_InstructionsCancel, 196, 0 , TEXT_SPEED_FF, NULL); //CANCEL, right of the B icon (x 184-191)
	SetDescription(0);
	for (i = 0; i < MENUITEM_COUNT; i++)
    {
        AddTextPrinterParameterized(0, 1, sOptionMenuItemsNames[i], 8, (i * 16) + 17, TEXT_SPEED_FF, NULL);
    }
    CopyWindowToVram(0, 2);
}

