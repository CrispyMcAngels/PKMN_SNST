.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Borgo_Ponente_4_1_Sign0
EventScript_Borgo_Ponente_4_1_Sign0:
	msgbox Borgo_Ponente_4_1_Sign0_text1 0x7
	end

.global EventScript_Borgo_Ponente_4_1_Sign1
EventScript_Borgo_Ponente_4_1_Sign1:
	msgbox Borgo_Ponente_4_1_Sign1_text1 0x7
	end

.global EventScript_Borgo_Ponente_4_1_Sign3
EventScript_Borgo_Ponente_4_1_Sign3:
	msgbox Borgo_Ponente_4_1_Sign3_text1 0x7
	end

.global gMapScripts_Borgo_Ponente_4_1
gMapScripts_Borgo_Ponente_4_1:
    mapscript MAP_SCRIPT_ON_LOAD Borgo_Ponente_4_1_MapScriptOnLoad
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Borgo_Ponente_4_1_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Borgo_Ponente_4_1_MapScriptOnLoad:
		compare 0x4051 0x29
		if 0x1 _call Borgo_Ponente_4_1_MapScriptOnLoad_night
		end

		Borgo_Ponente_4_1_MapScriptOnLoad_night:
			setweather 0xB
			doweather
			movesprite2 0x1 0x01 0x03
			end
		
	Borgo_Ponente_4_1_MapScriptOnFrame:
		levelscript 0x4050, 6, Borgo_Ponente_4_1_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN		

	Borgo_Ponente_4_1_MapScriptOnFrameBegin:
		compare 0x4051 0x29
		if 0x1 _call Borgo_Ponente_4_1_MapScriptOnFrame_P1
		compare 0x4051 0x2D
		if 0x1 _call Borgo_Ponente_4_1_MapScriptOnFrame_P2
		end
		
	Borgo_Ponente_4_1_MapScriptOnFrame_P1:
		playsong 0x0 0x0
		applymovement 0xFF Borgo_Ponente_4_1_mov1
		waitmovement 0x0 
		writebytetooffset 0x30 0x4000012
		msgbox EventScript_Borgo_Ponente_4_1_MapScriptOnFrameBegin_text1 0x7
		writebytetooffset 0x0 0x4000012
		setvar 0x4051 0x2A
		setvar 0x501F 0x12e
		warpmuted 0x0 0x6 0xFF 0x0C 0x16
		releaseall
		end
		
	Borgo_Ponente_4_1_mov1:
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xF 
		.byte 0xFE

	Borgo_Ponente_4_1_MapScriptOnFrame_P2:
		lockall
		pause 0x1E
		textcolor 0x00
		compare 0x501F 0x100
		if 0x1 _call Player_Blue
		compare 0x501F 0x1A3
		if 0x1 _call Player_Orange
		compare 0x501F 0x1A4
		if 0x1 _call Player_Green
		msgbox EventScript_Borgo_Ponente_4_1_MapScriptOnFrameBegin_text2 MSG_NORMAL
		special 0x15A
		applymovement 0xFF Borgo_Ponente_4_1_mov2
		waitmovement 0x0
		pause 0x1E
		textcolor 0x00
		compare 0x501F 0x100
		if 0x1 _call Player_Blue
		compare 0x501F 0x1A3
		if 0x1 _call Player_Orange
		compare 0x501F 0x1A4
		if 0x1 _call Player_Green
		msgbox EventScript_Borgo_Ponente_4_1_MapScriptOnFrameBegin_text3 MSG_NORMAL
		special 0x15A
		setvar 0x4051 0x2E
		setvar 0x4050 0x7
		setvar 0x5201 0x0
		releaseall
		end

	Borgo_Ponente_4_1_mov2:
		.byte 0x51
		.byte 0x0 
		.byte 0xFE

		Player_Blue:
			showpokepic 0x3b6 0x15 0x6
			return

		Player_Orange:
			showpokepic 0x3bE 0x15 0x6
			return

		Player_Green:
			showpokepic 0x3bF 0x15 0x6
			return