.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Dark_Future_32_3
gMapScripts_Dark_Future_32_3:
    mapscript MAP_SCRIPT_ON_LOAD Dark_Future_32_3_MapScriptOnLoad
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Dark_Future_32_3_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

Dark_Future_32_3_MapScriptOnLoad:
    compare 0x4067 0x2
    if 0x1 _call Dark_Future_32_3_MapScriptOnLoad_P1
    end

    Dark_Future_32_3_MapScriptOnLoad_P1:
        movesprite2 0x2 0x4 0x2
        spritebehave 0x2 0xA
        return

Dark_Future_32_3_MapScriptOnFrame:
    levelscript 0x4050, 0, Dark_Future_32_3_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

Dark_Future_32_3_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x1
    if 0x1 _call Dark_Future_32_3_Part1
    compare 0x4051 0x4D
    if 0x1 _call Dark_Future_32_3_Part2
    releaseall
    end

Dark_Future_32_3_Part1:
    pause 0x2E
    movesprite 0x1 0x3 0x5
    sound 0x9
    pause 0x1E
    spriteface 0x2 0x1
    sound 0x15
    applymovement 0x2 mov_exclamation
    waitmovement 0x2
    pause 0x1E
    showpokepic 0x3C9 0x0 0x6
	msgbox Dark_Future_32_3_text1 MSG_NORMAL
	special 0x15A
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_32_3_text2 MSG_NORMAL
	special 0x15A
    pause 0x1E
    applymovement 0x1 dark_future_32_3_mov2
    waitmovement 0x1      
    pause 0x1E
    showpokepic 0x3C9 0x0 0x6
	msgbox Dark_Future_32_3_text3 MSG_NORMAL
	special 0x15A
    pause 0x1E   
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_32_3_text4 MSG_NORMAL
	special 0x15A
    pause 0x3E
    showpokepic 0x3C9 0x0 0x6
	msgbox Dark_Future_32_3_text5 MSG_NORMAL
	special 0x15A
    pause 0x1E
    spriteface 0x1 0x4
    pause 0x1E
    spriteface 0x1 0x2
    pause 0x1E
    showpokepic 0x3C7 0x0 0x6
	msgbox Dark_Future_32_3_text6 MSG_NORMAL
	special 0x15A        
    pause 0x2E

    //gancio al vecchio script
    fadescreen 0x1
    playsong 0x0 0x0
    pause 0x1E
    writebytetooffset 0x30 0x4000012
    msgbox CieloStellato_2_60_MapScriptOnFrame_text6 0x7
    writebytetooffset 0x0 0x4000012
    pause 0x1E
    //setflag 0x900
    setflag 0x967
    setvar 0x4050 0x1
    setvar 0x501F 0x0157
    warpmuted 0x2 0x1B 0xFF 0x05 0x26
    fadescreen 0x0
    releaseall
    end   

    dark_future_32_3_mov2:
        .byte 0x12
        .byte 0x11
        .byte 0x11
        .byte 0xFE

    Dark_Future_32_3_Part2:
        special 0x113
        pause 0x2E
        sound 0x15
        applymovement 0x2 mov_exclamation
        waitmovement 0x2
        pause 0x1E
        spriteface 0x2 0x3
        pause 0x2E
        spriteface 0xFF 0x4
        showpokepic 0x3C9 0x0 0x6
	    msgbox Dark_Future_32_3_text7 MSG_NORMAL
	    special 0x15A
        pause 0x1E
        showpokepic 0x3C7 0x0 0x6
	    msgbox Dark_Future_32_3_text8 MSG_NORMAL
	    special 0x15A
        pause 0x1E
        applymovement 0x2 dark_future_32_3_mov3
        waitmovement 0x2                            
        pause 0x1E
        showpokepic 0x3C9 0x0 0x6
	    msgbox Dark_Future_32_3_text9 MSG_NORMAL
	    special 0x15A
        pause 0x1E
        spriteface 0xFF 0x1
        pause 0x25
        sound 0x15
        applymovement 0xFF mov_question
        waitmovement 0xFF
        pause 0x1E
        spriteface 0xFF 0x4
        pause 0x1E
        showpokepic 0x3C7 0x0 0x6
	    msgbox Dark_Future_32_3_text10 MSG_NORMAL
	    special 0x15A
        pause 0x1E
        sound 0x15
        applymovement 0x2 mov_question
        waitmovement 0x2
        pause 0x1E
        showpokepic 0x3C9 0x0 0x6
	    msgbox Dark_Future_32_3_text11 MSG_NORMAL
	    special 0x15A
        pause 0x1E
        showpokepic 0x3C7 0x0 0x6
	    msgbox Dark_Future_32_3_text12 MSG_NORMAL
	    special 0x15A
        applymovement 0xFF dark_future_32_3_mov4
        waitmovement 0xFF
        showpokepic 0x3C9 0x0 0x6
	    msgbox Dark_Future_32_3_text13 MSG_NORMAL
	    special 0x15A
        pause 0x1E
        applymovement 0xFF mov_exclamation
        waitmovement 0xFF
        spriteface 0xFF 0x2
        pause 0x1E
        showpokepic 0x3C7 0x0 0x6
	    msgbox Dark_Future_32_3_text14 MSG_NORMAL
	    special 0x15A
        pause 0x1E
        applymovement 0xFF dark_future_32_3_mov5
        waitmovement 0xFF
        setvar 0x4050 0xB
        setvar 0x4051 0x4E

        //remove running shoes, pokedex, bag, trainer name and dexnav
        clearflag 0x82F
        clearflag 0x829
        clearflag 0x995
        clearflag 0x996
        clearflag 0x91E


        warp 0x3 0xc 0xFF 0x3 0x7
        releaseall
        end

        dark_future_32_3_mov3:
            .byte 0x12
            .byte 0xFE

        dark_future_32_3_mov4:
            .byte 0x10
            .byte 0x10
            .byte 0xFE

        dark_future_32_3_mov5:
            .byte 0x10
            .byte 0x13
            .byte 0x10
            .byte 0x60
            .byte 0xFE

