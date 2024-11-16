.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Percorso_1_4_4_NPC0
EventScript_Percorso_1_4_4_NPC0:
	lock
	faceplayer
    checkflag 0x91E
    if 0x1 _call Percorso_1_4_4_NPC0_P1
	msgbox Percorso_1_4_4_NPC0_text0 MSG_NORMAL
	release
	end

    Percorso_1_4_4_NPC0_P1:
    msgbox Percorso_1_4_4_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_1_4_4_NPC1
EventScript_Percorso_1_4_4_NPC1:
	lock
	faceplayer
	msgbox Percorso_1_4_4_NPC1_text1 MSG_NORMAL
	release
	end


.global gMapScripts_Borgo_Ponente_4_4
gMapScripts_Borgo_Ponente_4_4:
    mapscript MAP_SCRIPT_ON_LOAD Borgo_Ponente_4_4_MapScriptOnLoad
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Borgo_Ponente_4_4_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

Borgo_Ponente_4_4_MapScriptOnLoad:
    compare 0x4051 0x13
    if 0x1 _call Borgo_Ponente_4_4_MapScriptOnLoad_hide_sprite1
    end

    Borgo_Ponente_4_4_MapScriptOnLoad_hide_sprite1:
        movesprite 0x1 0x0A 0x04
        return


Borgo_Ponente_4_4_MapScriptOnFrame:
    levelscript 0x4050, 3, Borgo_Ponente_4_4_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

Borgo_Ponente_4_4_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x13
    if 0x1 _call Borgo_Ponente_4_4_MapScriptOnFrameBegin_P1
    releaseall
    end

Borgo_Ponente_4_4_MapScriptOnFrameBegin_P1:
    lockall
    spriteface 0xFF 0x2
    msgbox Borgo_Ponente_4_4_MapScriptOnFrame_text1 MSG_NORMAL
    applymovement 0x1 Borgo_Ponente_4_4_MapScriptOnFrame_mov1
    waitmovement 0x0  
    pause 0x1E
    msgbox Borgo_Ponente_4_4_MapScriptOnFrame_text2 MSG_NORMAL    
    applymovement 0x1 Borgo_Ponente_4_4_MapScriptOnFrame_mov2
    waitmovement 0x0
    hidesprite 0x2
    pause 0x1E
    applymovement 0x1 Borgo_Ponente_4_4_MapScriptOnFrame_mov3
    waitmovement 0x0  
    msgbox Borgo_Ponente_4_4_MapScriptOnFrame_text3 MSG_NORMAL
    fanfare 0x0101
    msgbox Borgo_Ponente_4_4_MapScriptOnFrame_text4 MSG_NORMAL
    pause 0x1E
    msgbox Borgo_Ponente_4_4_MapScriptOnFrame_text5 MSG_NORMAL
    pause 0x1E
    pause 0x1E
    msgbox Borgo_Ponente_4_4_MapScriptOnFrame_text6 MSG_NORMAL
    setvar 0x4050 0x2
    setvar 0x4051 0x14
    setflag 0x91E
    release
    end


    Borgo_Ponente_4_4_MapScriptOnFrame_mov1:
        .byte 0x2 
        .byte 0x62
        .byte 0xFE

    Borgo_Ponente_4_4_MapScriptOnFrame_mov2:
        .byte 0x12
        .byte 0x12
        .byte 0x0 
        .byte 0xFE

    Borgo_Ponente_4_4_MapScriptOnFrame_mov3:
        .byte 0x13
        .byte 0x13
        .byte 0x0 
        .byte 0xFE

