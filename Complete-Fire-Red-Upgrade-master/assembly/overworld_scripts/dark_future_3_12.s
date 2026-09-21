.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//LEVELS

.global gMapScripts_Dark_Future_3_12
gMapScripts_Dark_Future_3_12:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Dark_Future_3_12_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

Dark_Future_3_12_MapScriptOnFrame:
    levelscript 0x4050, 0, Dark_Future_3_12_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

Dark_Future_3_12_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x1
    if 0x1 _call Dark_Future_3_12_Part1
    releaseall
    end

Dark_Future_3_12_Part1:
    pause 0x3E
    applymovement 0xFF dark_future_3_12_mov1
    waitmovement 0xFF
    pause 0x3E
    movesprite 0x1 0x0D 0x09
    applymovement 0x1 dark_future_3_12_mov2
    waitmovement 0x1
    //door animation placeholder 
    warp 0x20 0x3 0xFF 0x03 0x03
    releaseall
    end

    dark_future_3_12_mov1:
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xE 
        .byte 0xFE

    dark_future_3_12_mov2:
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x11
        .byte 0x12
        .byte 0x12
        .byte 0x11
        .byte 0x11
        .byte 0xFE


//___TILEs___

.global EventScript_Dark_Future_3_12_tile0
EventScript_Dark_Future_3_12_tile0:
	lockall
	sound 0x15
    applymovement 0xFF mov_exclamation
	waitmovement 0xFF
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_12_text1 MSG_NORMAL
	special 0x15A	
	pause 0x1E
    special 0x113
    applymovement 0x7F dark_future_3_12_mov3
	waitmovement 0x7F
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_12_text2 MSG_NORMAL
	special 0x15A	
	pause 0x2E
    applymovement 0x7F dark_future_3_12_mov4
	waitmovement 0x7F
    special 0x114
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_12_text3 MSG_NORMAL
	special 0x15A	
    pause 0x1E
    spriteface 0xFF 0x1
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_12_text4 MSG_NORMAL
	special 0x15A	
    setvar 0x4051 0x4F
    releaseall
    end



    dark_future_3_12_mov3:
        .byte 0x13
        .byte 0x13
        .byte 0x13
        .byte 0x13
        .byte 0x13
        .byte 0x13
        .byte 0x13
        .byte 0xFE

    dark_future_3_12_mov4:
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0x12
        .byte 0xFE


.global EventScript_Dark_Future_3_12_tile3
EventScript_Dark_Future_3_12_tile3:
	lockall
	sound 0x15
    applymovement 0xFF mov_question
	waitmovement 0xFF
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_3_12_text5 MSG_NORMAL
	special 0x15A	
    setvar 0x4051 0x50
    releaseall
    end

.global EventScript_Dark_Future_3_12_Sign0
EventScript_Dark_Future_3_12_Sign0:
	special 0x27
    special 0x23
    setvar 0x8004 0xF
    special 0x62
    givepokemon 0x3A 0x14 0x0 0x0 0x0 0x0
	end