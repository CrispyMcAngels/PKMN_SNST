.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//LEVELS

.global gMapScripts_Dark_Future_39_0
gMapScripts_Dark_Future_39_0:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Dark_Future_39_0_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

Dark_Future_39_0_MapScriptOnFrame:
    levelscript 0x4050, 0xB, Dark_Future_39_0_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

Dark_Future_39_0_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x50
    if 0x1 _call Dark_Future_39_0_MapScriptOnFrameBegin_P1
    releaseall
    end

Dark_Future_39_0_MapScriptOnFrameBegin_P1:
    lockall
    applymovement 0xFF dark_future_39_0_mov1
    waitmovement 0xFF
    sound 0x9
    movesprite 0x1 0x5 0xA
    pause 0x1E
    applymovement 0xFF dark_future_39_0_mov2
    applymovement 0x1 dark_future_39_0_mov3
    waitmovement 0xFF
    pause 0x1E
    show_mugshot MYRYAM
	msgbox Dark_Future_39_0_text1 MSG_NORMAL
	special 0x15A
    pause 0x1E
    spriteface 0xFF 0x4
    pause 0x1E
    sound 0x15
    applymovement 0xFF mov_question
    waitmovement 0xFF
    pause 0x1E
    show_mugshot MYRYAM
	msgbox Dark_Future_39_0_text2 MSG_NORMAL
	special 0x15A   
    pause 0x1E
    applymovement 0xFF dark_future_39_0_mov4
    waitmovement 0xFF
    pause 0x1E
    pause 0x1E
    show_mugshot MYRYAM
	msgbox Dark_Future_39_0_text3 MSG_NORMAL
	special 0x15A   
    pause 0x15
    spriteface 0x1 0x2 
    pause 0x15
    sound 0x15
    applymovement 0x1 mov_exclamation
    waitmovement 0x1 
    cry 0x3A 0x0
    msgbox Dark_Future_3_54_text4 MSG_NORMAL
    pause 0x1E
    spriteface 0xFF 0x1
    applymovement 0x1 dark_future_39_0_mov5
    waitmovement 0x1 
    pause 0x1E
    applymovement 0x1 dark_future_39_0_mov6
    waitmovement 0x1
    spriteface 0xFF 0x2 
    cry 0x3A 0x0
    show_mugshot MYRYAM
	msgbox Dark_Future_39_0_text4 MSG_NORMAL
	special 0x15A  
    pause 0x1E
    applymovement 0xFF dark_future_39_0_mov7
    applymovement 0x1 dark_future_39_0_mov8
    waitmovement 0xFF
    pause 0x2E
    sound 0x15
    applymovement 0xFF mov_question
    waitmovement 0xFF
    pause 0x1E
    fanfare 0x0101
    waitfanfare
    movesprite 0x2 0x0 0xC
    pause 0x1E
    show_mugshot MYRYAM
	msgbox Dark_Future_39_0_text5 MSG_NORMAL
	special 0x15A   
    pause 0x2E
    spriteface 0xFF 0x3 
    show_mugshot MYRYAM
	msgbox Dark_Future_39_0_text6 MSG_NORMAL
	special 0x15A         
    pause 0x1E
    sound 0x15
    applymovement 0x1 dark_future_39_0_mov9
    waitmovement 0x1
    pause 0x3E
    show_mugshot MYRYAM
	msgbox Dark_Future_39_0_text7 MSG_NORMAL
	special 0x15A     
    pause 0x1E
    applymovement 0xFF dark_future_39_0_mov10
    applymovement 0x1 dark_future_39_0_mov11
    waitmovement 0xFF 
    setvar 0x4051 0x51
    warp 0x3 0x36 0xFF 0x4 0xB
    releaseall
    end

    dark_future_39_0_mov1:
        .byte 0x11
        .byte 0xFE

    dark_future_39_0_mov2:
        .byte 0x11
        .byte 0x12
        .byte 0xFE

    dark_future_39_0_mov3:
        .byte 0x11
        .byte 0x11
        .byte 0x02
        .byte 0xFE

    dark_future_39_0_mov4:
        .byte 0x11
        .byte 0x13
        .byte 0xFE

    dark_future_39_0_mov5:
        .byte 0x53
        .byte 0x53
        .byte 0xFE

    dark_future_39_0_mov6:
        .byte 0x1F
        .byte 0x1E
        .byte 0x1E
        .byte 0x1E
        .byte 0x20
        .byte 0x0 
        .byte 0x52
        .byte 0x52
        .byte 0xFE

    dark_future_39_0_mov7:
        .byte 0x11
        .byte 0x11
        .byte 0xFE

    dark_future_39_0_mov8:
        .byte 0x12
        .byte 0x3 
        .byte 0xFE

    dark_future_39_0_mov9:
        .byte 0x66
        .byte 0xFE

    dark_future_39_0_mov10:
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x60
        .byte 0xFE

    dark_future_39_0_mov11:
        .byte 0x13
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0x10
        .byte 0xFE


