.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Passo_Tuono_1_2
gMapScripts_Passo_Tuono_1_2:
	mapscript MAP_SCRIPT_ON_FRAME_TABLE Passo_Tuono_1_2_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Passo_Tuono_1_2_MapScriptOnWarpIntoMapTable
	mapscript MAP_SCRIPT_ON_RESUME Passo_Tuono_1_2_MapScriptOnResume
    .byte MAP_SCRIPT_TERMIN

		Passo_Tuono_1_2_MapScriptOnResume:
			compare 0x4051 0x3D
			if 0x1 _call Passo_Tuono_1_2_MapScriptOnResume_P1
			end	

			Passo_Tuono_1_2_MapScriptOnResume_P1:
				playsong2 0x0
				return


	Passo_Tuono_1_2_MapScriptOnWarpIntoMapTable:
		levelscript 0x4052, 6, Passo_Tuono_1_2_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_2_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end

	Passo_Tuono_1_2_MapScriptOnFrame:
		levelscript 0x4052, 6, Passo_Tuono_1_2_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_2_MapScriptOnFrameBegin:
			pause 0x1E
			pause 0x1E
			showpokepic 0x3AC 0x0 0x6
			textcolor 0x0
			//???:...
			msgbox Passo_Tuono_1_2_text1 MSG_NORMAL
			special 0x15A
			pause 0x1E
			playsong 0x188 0x0
			applymovement 0xFF Passo_Tuono_1_2_mov1
			waitmovement 0xFF
			pause 0x1E
			showpokepic 0x3AC 0x0 0x6
			textcolor 0x0
			//???: Questo posto...
			msgbox Passo_Tuono_1_2_text2 MSG_NORMAL
			special 0x15A
			pause 0x1E
			pause 0x1E
			showpokepic 0x3AC 0x0 0x6
			textcolor 0x0
			//???: Dopo quasi 500 anni è ancora come prima... ...D'altronde solo pochi ne conoscono la sua esistenza...
			msgbox Passo_Tuono_1_2_text3 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0xFF Passo_Tuono_1_2_mov2
			waitmovement 0xFF
			warp 0x1 0x7C 0xFF 0x06 0x0E
			releaseall
			end

			
			Passo_Tuono_1_2_mov1:
				.byte 0x3 
				.byte 0x1C
				.byte 0x19
				.byte 0x0 
				.byte 0x1C
				.byte 0x18
				.byte 0x2 
				.byte 0x1C
				.byte 0x1 
				.byte 0x1B
				.byte 0x62
				.byte 0x1A
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x1A
				.byte 0x2 
				.byte 0x1C
				.byte 0x3 
				.byte 0x1C
				.byte 0x0 
				.byte 0x62
				.byte 0xFE

			Passo_Tuono_1_2_mov2:
				.byte 0x11
				.byte 0x11
				.byte 0x60
				.byte 0xFE
