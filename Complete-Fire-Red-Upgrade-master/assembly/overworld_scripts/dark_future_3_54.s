.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//LEVELS

.global gMapScripts_Dark_Future_3_54
gMapScripts_Dark_Future_3_54:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Dark_Future_3_54_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

Dark_Future_3_54_MapScriptOnFrame:
    levelscript 0x4050, 0xB, Dark_Future_3_54_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

Dark_Future_3_54_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x50
    if 0x1 _call Dark_Future_3_54_MapScriptOnFrameBegin_P1
    compare 0x4051 0x51
    if 0x1 _call Dark_Future_3_54_MapScriptOnFrameBegin_P2
    releaseall
    end

Dark_Future_3_54_MapScriptOnFrameBegin_P1:
    applymovement 0xFF dark_future_3_54_mov1
    waitmovement 0xFF  
    getplayerpos 0x4001 0x4002
    compare 0x4001 0x9
    if 0x1 _call Dark_Future_3_54_MapScriptOnFrameBegin_P1a
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_54_text1 MSG_NORMAL
	special 0x15A
    pause 0x1E
    special 0x113
    applymovement 0x7F dark_future_3_54_mov3
    waitmovement 0x7F
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_54_text2 MSG_NORMAL
	special 0x15A
    pause 0x1E
    spriteface 0xFF 0x4
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_54_text3 MSG_NORMAL
	special 0x15A
    pause 0x1E
    movesprite 0x2 0x09 0x0D
    pause 0x1E
    movesprite 0x1 0x09 0x0D
    pause 0x10
    hidesprite 0x2
    pause 0x1E
    cry 0x3A 0x0
	msgbox Dark_Future_3_54_text4 MSG_NORMAL
    pause 0x25
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_54_text5 MSG_NORMAL
	special 0x15A   
    pause 0x1E
    applymovement 0xFF dark_future_3_54_mov4
    applymovement 0x1 dark_future_3_54_mov5
    waitmovement 0xFF
    warp 0x27 0x1 0xFF 0x05 0x0A
    releaseall
    end

    dark_future_3_54_mov1:
        .byte 0x11
        .byte 0x11
        .byte 0x11
        .byte 0x11
        .byte 0x11
        .byte 0xFE

    dark_future_3_54_mov3:
        .byte 0x11
        .byte 0x11
        .byte 0x11
        .byte 0x11
        .byte 0x11
        .byte 0x11
        .byte 0x11
        .byte 0x1C
        .byte 0x1C
        .byte 0x1C
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0xFE

    dark_future_3_54_mov4:
        .byte 0x11
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x11
        .byte 0x11
        .byte 0xFE


    dark_future_3_54_mov5:
        .byte 0x12
        .byte 0x11
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x11
        .byte 0x11
        .byte 0xFE


    Dark_Future_3_54_MapScriptOnFrameBegin_P1a:
        applymovement 0xFF dark_future_3_54_mov2
        waitmovement 0xFF
        return

        dark_future_3_54_mov2:
            .byte 0x12
            .byte 0x1 
            .byte 0xFE


Dark_Future_3_54_MapScriptOnFrameBegin_P2:
    applymovement 0xFF dark_future_3_54_mov6
    waitmovement 0xFF
    spriteface 0xFF 0x2
    sound 0x9
    movesprite 0x1 0x04 0x0A
    applymovement 0x1 dark_future_3_54_mov6
    waitmovement 0x1
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_54_text6 MSG_NORMAL
	special 0x15A   
    pause 0x1E
    applymovement 0xFF dark_future_3_54_mov7
    applymovement 0x1 dark_future_3_54_mov8
    waitmovement 0xFF
    sound 0xD
    pause 0x1E
    spriteface 0xFF 0x3
    sound 0x15
    applymovement 0xFF mov_exclamation
    waitmovement 0xFF
    playsong 0x182
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_54_text7 MSG_NORMAL
	special 0x15A 
    pause 0x1E
    sound 0xD
    pause 0x1E
    spriteface 0x1 0x3
    applymovement 0x1 dark_future_3_54_mov10
    waitmovement 0x1
    cry 0x3A 0x0
	msgbox Dark_Future_3_54_text4 MSG_NORMAL
    pause 0x2E
    fadescreen 0x1
    sound 0xD
    pause 0x2E
    cry 0x169 0x0
    pause 0x1E
    fadescreen 0x0
    pause 0x1E
    applymovement 0xFF dark_future_3_54_mov10
    waitmovement 0xFF
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_54_text8 MSG_NORMAL
	special 0x15A    
    pause 0x1E
    applymovement 0xFF dark_future_3_54_mov12
    applymovement 0x1 dark_future_3_54_mov13
    waitmovement 0xFF
    warp 0x3 0x31 0xFF 0x5 0x12
    releaseall
    end

    dark_future_3_54_mov6:
        .byte 0x10
        .byte 0xFE

    dark_future_3_54_mov7:
        .byte 0x13
        .byte 0x13
        .byte 0x13
        .byte 0x13
        .byte 0xFE

    dark_future_3_54_mov8:
        .byte 0x10
        .byte 0x13
        .byte 0x13
        .byte 0x13
        .byte 0xFE

    dark_future_3_54_mov9:
        .byte 0x11
        .byte 0x1F
        .byte 0x1F
        .byte 0x1F
        .byte 0x1C
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0xFE

    dark_future_3_54_mov10:
        .byte 0x54
        .byte 0x54
        .byte 0xFE

    dark_future_3_54_mov11:
        .byte 0x1F
        .byte 0x1F
        .byte 0x1F
        .byte 0x1C
        .byte 0x20
        .byte 0x20
        .byte 0xFE

    dark_future_3_54_mov12:
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x1D
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x1E
        .byte 0x1E
        .byte 0x1E
        .byte 0x60
        .byte 0xFE

    dark_future_3_54_mov13:
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x1D
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x20
        .byte 0x1E
        .byte 0x1E
        .byte 0x1E
        .byte 0x60
        .byte 0xFE



//SELVA SPENTA____

.global gMapScripts_Selva_Spenta_3_49
gMapScripts_Selva_Spenta_3_49:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Selva_Spenta_3_49_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Selva_Spenta_3_49_MapScriptOnWarpIntoMapTable
    .byte MAP_SCRIPT_TERMIN

	Selva_Spenta_3_49_MapScriptOnWarpIntoMapTable:
	levelscript 0x4050, 0xB, Selva_Spenta_3_49_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN

	Selva_Spenta_3_49_MapScriptOnWarpIntoMapTableBegin:
		spriteface 0xFF 0x2
		end	

Selva_Spenta_3_49_MapScriptOnFrame:
    levelscript 0x4050, 0xB, Selva_Spenta_3_49_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

Selva_Spenta_3_49_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x51
    if 0x1 _call Selva_Spenta_3_49_MapScriptOnFrameBegin_P1
    releaseall
    end

Selva_Spenta_3_49_MapScriptOnFrameBegin_P1:
    applymovement 0xFF Selva_Spenta_3_49_mov1
    waitmovement 0xFF  
    movesprite 0x1 0x5 0x12
    sound 0x9
    applymovement 0x1 Selva_Spenta_3_49_mov2
    waitmovement 0x1
    pause 0x1E
    sound 0x15
    applymovement 0xFF mov_question
    waitmovement 0xFF
    pause 0x1E
    spriteface 0xFF 0x4
    pause 0x2E
    spriteface 0xFF 0x2
    pause 0x2E
    spriteface 0xFF 0x1
    showpokepic 0x3C7 0x0 0x6
	msgbox Selva_Spenta_3_49_text1 MSG_NORMAL
	special 0x15A
    setvar 0x8000 0x1
    setvar 0x8001 0x1
    special 0xD1
    setvar 0x4051 0x52
    setvar 0x4050 0xC
    //set healing place in Selva SPENTA
    setvar 0x5037 0x3103
    //X and Y coordinates
    setvar 0x5038 0x05
    setvar 0x5039 0x10
    releaseall
    end


Selva_Spenta_3_49_mov1:
    .byte 0x11
    .byte 0x11
    .byte 0x0 
    .byte 0xFE

Selva_Spenta_3_49_mov2:
    .byte 0x11
    .byte 0xFE


.global EventScript_Selva_Spenta_3_49_tile0
EventScript_Selva_Spenta_3_49_tile0:
	lockall
	sound 0x15
    applymovement 0xFF mov_exclamation
	waitmovement 0xFF
    showpokepic 0x3C7 0x0 0x6
	msgbox Selva_Spenta_3_49_text2 MSG_NORMAL
	special 0x15A	
    applymovement 0xFF Selva_Spenta_3_49_mov2
	waitmovement 0xFF
    releaseall
    end

.global EventScript_Selva_Spenta_3_49_NPC0
EventScript_Selva_Spenta_3_49_NPC0:
	lock
	faceplayer
	cry 0x3A 0x0
	msgbox Dark_Future_3_54_text4 MSG_NORMAL
	special 0x15A
	release
	end


//____SCOGLIERA____CREPUSCOLO


.global gMapScripts_Scogliera_Crepuscolo_3_55
gMapScripts_Scogliera_Crepuscolo_3_55:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Scogliera_Crepuscolo_3_55_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Scogliera_Crepuscolo_3_55_MapScriptOnWarpIntoMapTable
    .byte MAP_SCRIPT_TERMIN

	Scogliera_Crepuscolo_3_55_MapScriptOnWarpIntoMapTable:
	levelscript 0x4050, 0xB, Scogliera_Crepuscolo_3_55_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN

	Scogliera_Crepuscolo_3_55_MapScriptOnWarpIntoMapTableBegin:
		spriteface 0xFF 0x2
		end	

Scogliera_Crepuscolo_3_55_MapScriptOnFrame:
    levelscript 0x4050, 0xC, Scogliera_Crepuscolo_3_55_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

Scogliera_Crepuscolo_3_55_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x52
    if 0x1 _call Scogliera_Crepuscolo_3_55_MapScriptOnFrameBegin_P1
    releaseall
    end

Scogliera_Crepuscolo_3_55_MapScriptOnFrameBegin_P1:
    pause 0x1E
    applymovement 0xFF Scogliera_Crepuscolo_3_55_mov0
    waitmovement 0xFF
    pause 0x1E
    sound 0x9
    movesprite 0x1 0xC 0x12
    applymovement 0xFF Scogliera_Crepuscolo_3_55_mov1
    applymovement 0x1 Scogliera_Crepuscolo_3_55_mov1a
    waitmovement 0xFF
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_3_55_text1 MSG_NORMAL
	special 0x15A	
    pause 0x2E
    spriteface 0xFF 0x2
    pause 0x1E
    sound 0x15
    applymovement 0xFF mov_exclamation
    waitmovement 0xFF
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_3_55_text2 MSG_NORMAL
	special 0x15A
    special 0x113
    applymovement 0x7F Scogliera_Crepuscolo_3_55_mov3	
    applymovement 0xFF Scogliera_Crepuscolo_3_55_mov2
    applymovement 0x1 Scogliera_Crepuscolo_3_55_mov2
    waitmovement 0x7F
    special 0x114
    pause 0x2E
    spriteface 0xFF 0x4
    pause 0x1E
    sound 0x15
    applymovement 0xFF mov_question
    waitmovement 0xFF
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_3_55_text3 MSG_NORMAL
	special 0x15A
    pause 0x1E
    spriteface 0xFF 0x2
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_3_55_text4 MSG_NORMAL
	special 0x15A
    pause 0x1E
    applymovement 0xFF Scogliera_Crepuscolo_3_55_mov4
    applymovement 0x1 Scogliera_Crepuscolo_3_55_mov4
    waitmovement 0xFF
    warp 0x2A 0x0 0xFF 0x03 0x06
    releaseall
    end


Scogliera_Crepuscolo_3_55_mov0:
    .byte 0x11
    .byte 0xFE

Scogliera_Crepuscolo_3_55_mov1:
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x0  
    .byte 0xFE

Scogliera_Crepuscolo_3_55_mov1a:
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0xFE

Scogliera_Crepuscolo_3_55_mov2:
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11 
    .byte 0xFE

Scogliera_Crepuscolo_3_55_mov3:
    .byte 0xD 
    .byte 0xD 
    .byte 0xD 
    .byte 0xD 
    .byte 0xD 
    .byte 0xD 
    .byte 0xD 
    .byte 0xD 
    .byte 0x1C
    .byte 0x1C
    .byte 0xC 
    .byte 0xC 
    .byte 0xC 
    .byte 0xC 
    .byte 0xFE


Scogliera_Crepuscolo_3_55_mov4:
    .byte 0x11
    .byte 0x11
    .byte 0xFE



//____TENDA


.global gMapScripts_Scogliera_Crepuscolo_42_0
gMapScripts_Scogliera_Crepuscolo_42_0:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Scogliera_Crepuscolo_42_0_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Scogliera_Crepuscolo_42_0_MapScriptOnWarpIntoMapTable
    .byte MAP_SCRIPT_TERMIN

	Scogliera_Crepuscolo_42_0_MapScriptOnWarpIntoMapTable:
	levelscript 0x4050, 0xB, Scogliera_Crepuscolo_42_0_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN

	Scogliera_Crepuscolo_42_0_MapScriptOnWarpIntoMapTableBegin:
		spriteface 0xFF 0x2
		end	

Scogliera_Crepuscolo_42_0_MapScriptOnFrame:
    levelscript 0x4050, 0xC, Scogliera_Crepuscolo_42_0_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

Scogliera_Crepuscolo_42_0_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x52
    if 0x1 _call Scogliera_Crepuscolo_42_0_MapScriptOnFrameBegin_P1
    releaseall
    end

Scogliera_Crepuscolo_42_0_MapScriptOnFrameBegin_P1:
    playsong 0x192
    pause 0x2E
    sound 0x15 
    applymovement 0xFF mov_exclamation
    waitmovement 0xFF
    pause 0x1E
    applymovement 0xFF Scogliera_Crepuscolo_42_0_mov1
    waitmovement 0xFF
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text1 MSG_NORMAL
	special 0x15A	
    pause 0x2E
    spriteface 0xFF 0x2
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text2 MSG_NORMAL
	special 0x15A
    pause 0x1E
    applymovement 0x1 Scogliera_Crepuscolo_42_0_mov2
    waitmovement 0x1
    pause 0x1E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text3 MSG_NORMAL
	special 0x15A
    pause 0x1E
    spriteface 0x1 0x3 
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text4 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text5 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text6 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text7 MSG_NORMAL
	special 0x15A
    pause 0x1E
    spriteface 0x1 0x1 
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text8 MSG_NORMAL
	special 0x15A
    pause 0x2E
    sound 0x15 
    applymovement 0xFF mov_question
    waitmovement 0xFF
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text9 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text10 MSG_NORMAL
	special 0x15A
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text11 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0x1 0x3 
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text12 MSG_NORMAL
	special 0x15A
    pause 0x1E
    sound 0x15
    applymovement 0xFF mov_exclamation
    waitmovement 0xFF
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text13 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text14 MSG_NORMAL
	special 0x15A
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text15 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0x1 0x1 
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text16 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0x1 0x2 
    pause 0x1E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text17 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0x1 0x1 
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text18 MSG_NORMAL
	special 0x15A  
    pause 0x2E
    sound 0x15 
    applymovement 0xFF mov_exclamation
    waitmovement 0xFF 
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text19 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text20 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0xFF 0x3 
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text21 MSG_NORMAL
	special 0x15A
    pause 0x3E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text22 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0xFF 0x2 
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text23 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text24 MSG_NORMAL
	special 0x15A
    pause 0x2E
    sound 0x15 
    applymovement 0xFF mov_exclamation
    waitmovement 0xFF
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text25 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0x1 0x1
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text26 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text27 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0x1 0x3 
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text28 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text29 MSG_NORMAL
	special 0x15A
    pause 0x2E
    applymovement 0x1 Scogliera_Crepuscolo_42_0_mov3
    waitmovement 0x1
    pause 0x1E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text30 MSG_NORMAL
	special 0x15A
    pause 0x2E
    sound 0x15
    applymovement 0xFF mov_question
    waitmovement 0xFF
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text31 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text32 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0x1 0x1 
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text33 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text34 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text35 MSG_NORMAL
	special 0x15A
    pause 0x1E
    applymovement 0x1 Scogliera_Crepuscolo_42_0_mov2
    waitmovement 0x1
    pause 0x1E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text36 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0xFF 0x3 
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text37 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text38 MSG_NORMAL
	special 0x15A
    pause 0x1E
    spriteface 0xFF 0x2 
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text39 MSG_NORMAL
	special 0x15A
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text40 MSG_NORMAL
	special 0x15A
    pause 0x2E
    applymovement 0xFF Scogliera_Crepuscolo_42_0_mov4
    waitmovement 0xFF
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text41 MSG_NORMAL
	special 0x15A
    pause 0x1E
    special 0x113
    applymovement 0xFF Scogliera_Crepuscolo_42_0_mov5
    waitmovement 0xFF
    sound 0x9
    applymovement 0x3 Scogliera_Crepuscolo_42_0_mov6
    waitmovement 0x6
    sound 0x9
    pause 0x2E
    applymovement 0x7F Scogliera_Crepuscolo_42_0_mov7
    waitmovement 0x7F
    special 0x114
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text42 MSG_NORMAL
	special 0x15A
    pause 0x2E
    spriteface 0x1 0x3 
    pause 0x2E
    showpokepic 0x3CA 0x0 0x6
	msgbox Scogliera_Crepuscolo_42_0_text43 MSG_NORMAL
	special 0x15A
    pause 0x3E


    //setplayer invisible
    setvar 0x501F 0x12E

    //enable running shoes, 
    setflag 0x82F
    //enable pokedex
    setflag 0x829
    //enable bag
    setflag 0x995
    //enable trainer name
    setflag 0x996
    //enable dexnav
    setflag 0x91E
    //enable save
    setflag 0x997
    //enable side quest 
    setflag 0x998 
    //enable time echoes 
    setflag 0x990

    setvar 0x4051 0x53
    //warp a time travel
    warp 0x0 0x11 0xFF 0x7 0x6
    releaseall
    end


Scogliera_Crepuscolo_42_0_mov1:
    .byte 0x11
    .byte 0x2 
    .byte 0xFE

Scogliera_Crepuscolo_42_0_mov2:
    .byte 0x10
    .byte 0xFE

Scogliera_Crepuscolo_42_0_mov3:
    .byte 0x11
    .byte 0xFE

Scogliera_Crepuscolo_42_0_mov4:
    .byte 0x10
    .byte 0x1
    .byte 0xFE

Scogliera_Crepuscolo_42_0_mov5:
    .byte 0x10
    .byte 0x60
    .byte 0xFE

Scogliera_Crepuscolo_42_0_mov6:
    .byte 0x13
    .byte 0x10
    .byte 0x60
    .byte 0xFE

Scogliera_Crepuscolo_42_0_mov7:
    .byte 0x11
    .byte 0x11
    .byte 0xFE

