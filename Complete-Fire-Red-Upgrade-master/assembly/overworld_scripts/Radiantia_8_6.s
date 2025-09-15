.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___SIGNs___

.global EventScript_Radiantia_8_6_Sign0
EventScript_Radiantia_8_6_Sign0:
	msgbox Radiantia_8_6_Sign0_text1 0x7
	end

//____LEVEL___

.global gMapScripts_Radiantia_8_6
gMapScripts_Radiantia_8_6:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Radiantia_8_6_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Radiantia_8_6_MapScriptOnFrame:
		levelscript 0x4062, 1, Radiantia_8_6_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Radiantia_8_6_MapScriptOnFrameBegin:
			lockall
			checkflag 0x970
			if 0x1 _goto Radiantia_8_6_MapScriptOnFrameBegin_P1
			applymovement 0x1 Radiantia_8_6_mov0
			applymovement 0x2 Radiantia_8_6_mov0
			applymovement 0x3 Radiantia_8_6_mov0
			waitmovement 0x0
			cry 0xC6 0x0
			pause 0xE
			cry 0xC6 0x0
			pause 0xE
			msgbox Radiantia_8_5_NPC0_text1 MSG_NORMAL
			applymovement 0x1 Radiantia_8_6_mov1
			applymovement 0x2 Radiantia_8_6_mov2
			applymovement 0x3 Radiantia_8_6_mov3
			waitmovement 0x0			
			cry 0xC6 0x0
			pause 0x1E
			applymovement 0xFF Radiantia_8_6_mov4
			waitmovement 0xFF
			setvar 0x4060 0x6
			warpmuted 0x03 0x04 0xFF 0x13 0x0B
			releaseall
			end

			Radiantia_8_6_mov0:
				.byte 0x0 
				.byte 0x62
				.byte 0xFE

			Radiantia_8_6_mov1:
				.byte 0x20
				.byte 0x1D
				.byte 0x3 
				.byte 0xFE

			Radiantia_8_6_mov2:
				.byte 0x1D
				.byte 0x1D
				.byte 0xFE

			Radiantia_8_6_mov3:
				.byte 0x1D
				.byte 0x1D
				.byte 0x2 
				.byte 0xFE

			Radiantia_8_6_mov4:
				.byte 0x65
				.byte 0x1D
				.byte 0xFE

		Radiantia_8_6_MapScriptOnFrameBegin_P1:
			applymovement 0x1 Radiantia_8_6_mov0
			applymovement 0x2 Radiantia_8_6_mov0
			applymovement 0x3 Radiantia_8_6_mov0
			waitmovement 0x0
			pause 0x1E
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			msgbox Radiantia_8_5_NPC0_text2 MSG_NORMAL
			special 0x15A
			checkflag 0x975
			if 0x1 _goto Radiantia_8_6_MapScriptOnFrameBegin_P1_2
			checkflag 0x974
			if 0x1 _goto Radiantia_8_6_MapScriptOnFrameBegin_P1_1
			
			applymovement 0x2 Radiantia_8_6_mov2
			waitmovement 0x2
			cry 0xC6 0x0
			msgbox Radiantia_8_5_NPC0_text1 MSG_NORMAL
			wildbattle 0xC6 0x10 0x0
			movesprite 0x2 0x0 0x6
			hidesprite 0x2
			setflag 0x974
			pause 0x1E
			checkflag 0x974
			if 0x1 _goto Radiantia_8_6_MapScriptOnFrameBegin_P1_1
			releaseall
			end

			Radiantia_8_6_MapScriptOnFrameBegin_P1_1:
				applymovement 0x1 Radiantia_8_6_mov1
				waitmovement 0x1
				spriteface 0xFF 0x3
				cry 0xC6 0x0
				msgbox Radiantia_8_5_NPC0_text1 MSG_NORMAL
				wildbattle 0xC6 0x11 0x0
				movesprite 0x1 0x0 0x6
				hidesprite 0x1
				setflag 0x975
				pause 0x1E
				checkflag 0x975
				if 0x1 _goto Radiantia_8_6_MapScriptOnFrameBegin_P1_2
				releaseall
				end						

				Radiantia_8_6_MapScriptOnFrameBegin_P1_2:
					applymovement 0x3 Radiantia_8_6_mov3
					waitmovement 0x3
					spriteface 0xFF 0x4
					cry 0xC6 0x0
					msgbox Radiantia_8_5_NPC0_text1 MSG_NORMAL
					wildbattle 0xC6 0x12 0x0
					movesprite 0x3 0x0 0x6
					hidesprite 0x3
					setflag 0x976
					pause 0x1E
					compare 0x501F 0x100
					if 0x1 _call Player_Blue
					compare 0x501F 0x1A3
					if 0x1 _call Player_Orange
					compare 0x501F 0x1A4
					if 0x1 _call Player_Green
					pause 0x1E
					msgbox Radiantia_8_5_NPC0_text3 MSG_NORMAL
					special 0x15A
					setvar 0x4062 0x2
					releaseall
					end	


		Player_Blue:
			showpokepic 0x3b6 0x15 0x6
			return

		Player_Orange:
			showpokepic 0x3bE 0x15 0x6
			return

		Player_Green:
			showpokepic 0x3bF 0x15 0x6
			return