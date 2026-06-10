.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Dark_Future_3_12
gMapScripts_Dark_Future_3_12:
    mapscript MAP_SCRIPT_ON_RESUME Dark_Future_3_12_MapScriptOnResume
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Dark_Future_3_12_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

    Dark_Future_3_12_MapScriptOnResume:
        compare 0x4050 0x0
    	if 0x1 _call Dark_Future_3_12_MapScriptOnResume_P1
        end

        Dark_Future_3_12_MapScriptOnResume_P1:
            callasm 0x883e901
            return

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
