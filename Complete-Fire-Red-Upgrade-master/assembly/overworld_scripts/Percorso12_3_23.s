.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Percorso12_3_23
gMapScripts_Percorso12_3_23:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Percorso12_3_23_MapScriptOnFrame
    mapscript MAP_SCRIPT_ON_RESUME Percorso12_3_23_MapScriptOnResume
    .byte MAP_SCRIPT_TERMIN


		Percorso12_3_23_MapScriptOnResume:
			compare 0x4051 0x4C
		    if 0x1 _call Percorso12_3_23_MapScriptOnResume_P1
			end	

			Percorso12_3_23_MapScriptOnResume_P1:
				playsong2 0x18C
				return

	Percorso12_3_23_MapScriptOnFrame:
		levelscript 0x4051, 0x4B, Radiantia_3_4_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Radiantia_3_4_MapScriptOnFrameBegin:
			applymovement 0xFF Percorso12_3_23_MapScriptOnFrameBegin_mov1
			applymovement 0x1 Percorso12_3_23_MapScriptOnFrameBegin_mov1
			waitmovement 0x0
			playsong 0x18C
			pause 0x1E
			applymovement 0x1 mov_exclamation
			waitmovement 0x1
			showpokepic 0x3B4 0x0 0x6
			msgbox Percorso12_3_23_MapScriptOnFrame_text1 MSG_NORMAL
			special 0x15A	
			setvar 0x4051 0x4C	
			//animazione Roccavento
			setvar 0x8002 0x5
			loadpointer 0x0 VoidText
			loadpointer 0x1 VoidText
			loadpointer 0x2 VoidText
			special 0x108
			waitstate			
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Percorso12_3_23_MapScriptOnFrame_text2 MSG_NORMAL
			special 0x15A	
			applymovement 0xFF Percorso12_3_23_MapScriptOnFrameBegin_mov2
			applymovement 0x1 Percorso12_3_23_MapScriptOnFrameBegin_mov2
			waitmovement 0x0	
			warp 0x3 0x3 0xFF 0x44 0x2C
			releaseall
			end

			Percorso12_3_23_MapScriptOnFrameBegin_mov1:
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0xFE



			Percorso12_3_23_MapScriptOnFrameBegin_mov2:
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0x1F
				.byte 0xFE
