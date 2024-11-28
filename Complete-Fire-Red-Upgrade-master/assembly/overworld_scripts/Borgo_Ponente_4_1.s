.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Borgo_Ponente_4_1_Sign0
EventScript_Borgo_Ponente_4_1_Sign0:
	msgbox Borgo_Ponente_4_1_Sign0_text1 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_4_1_Sign1
EventScript_Borgo_Ponente_4_1_Sign1:
	msgbox Borgo_Ponente_4_1_Sign1_text1 MSG_SIGN
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
			end
		
	Borgo_Ponente_4_1_MapScriptOnFrame:
		levelscript 0x4050, 6, Borgo_Ponente_4_1_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN		

	Borgo_Ponente_4_1_MapScriptOnFrameBegin:
		playsong 0x0 0x0
		applymovement 0xFF Borgo_Ponente_4_1_mov1
		waitmovement 0x0 
		writebytetooffset 0x30 0x4000012
		msgbox EventScript_Borgo_Ponente_4_1_MapScriptOnFrameBegin_text1 MSG_NORMAL
		writebytetooffset 0x0 0x4000012
		setvar 0x4051 0x2A
		setflag 0x230
		setvar 0x501F 0x149
		warpmuted 0x3 0x 0xFF 0x0C 0x11
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
