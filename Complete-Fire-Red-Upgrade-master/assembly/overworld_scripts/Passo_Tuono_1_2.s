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
			compare 0x4051 0x41
			if 0x1 _call Passo_Tuono_1_2_MapScriptOnResume_P2
			end	

			Passo_Tuono_1_2_MapScriptOnResume_P1:
				playsong2 0x0
				return

			Passo_Tuono_1_2_MapScriptOnResume_P2:
				playsong2 0x189
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
			compare 0x4051 0x41 
			if 0x1 _goto Passo_Tuono_1_2_MapScriptOnFrameBegin_P1
			compare 0x4051 0x42
			if 0x1 _goto Passo_Tuono_1_2_MapScriptOnFrameBegin_P2
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

			Passo_Tuono_1_2_MapScriptOnFrameBegin_P1:
				pause 0x3E
				applymovement 0xFF Passo_Tuono_1_2_mov3
				waitmovement 0xFF
				sound 0x9
				pause 0x2E
				fadescreen 0x1
				writebytetooffset 0x0 0x2036E28
				writebytetooffset 0x25 0x350A34
				compare 0x5026 0x0
				if 0x1 _call blue_z
				compare 0x5026 0x88
				if 0x1 _call orange_z
				compare 0x5026 0x85
				if 0x1 _call green_z
				setvar 0x4051 0x42
				warpmuted 0x1 0x2 0xFF 0x0A 0x0C
				releaseall
				end

				blue_z:
					setvar 0x501F 0x100
					return

				orange_z:
					setvar 0x501F 0x1a3
					return

				green_z:
					setvar 0x501F 0x1a4
					return

				Passo_Tuono_1_2_mov3:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x1A
					.byte 0x60
					.byte 0xFE

			Passo_Tuono_1_2_MapScriptOnFrameBegin_P2:
				pause 0x25
				applymovement 0xFF Passo_Tuono_1_2_mov4
				waitmovement 0xFF
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox Passo_Tuono_1_2_tile0_text3 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_2_mov5
				waitmovement 0xFF
				sound 0x9
				pause 0x21
				movesprite 0x1 0x0A 0x0D
				applymovement 0xFF Passo_Tuono_1_2_mov6
				waitmovement 0xFF
				pause 0x1E

				textcolor 0x0
				showpokepic 0x3aD 0x0 0x6
				msgbox Passo_Tuono_1_2_tile0_text4 MSG_NORMAL	
				special 0x15A
				pause 0x25
				applymovement 0xFF Passo_Tuono_1_2_mov7
				waitmovement 0xFF				
				pause 0x1E
				warpmuted 0x1 0x7C 0xFF 0x06 0x0D
				releaseall
				end

				Passo_Tuono_1_2_mov4:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_2_mov5:
					.byte 0x11
					.byte 0x11
					.byte 0x60
					.byte 0xFE

				Passo_Tuono_1_2_mov6:
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0xFE

				Passo_Tuono_1_2_mov7:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0xFE


//____TILE_____

.global EventScript_Passo_Tuono_1_2_tile0
EventScript_Passo_Tuono_1_2_tile0:
	lockall
	spriteface 0xFF 0x2
	pause 0x1E
	compare 0x5026 0x0
	if 0x1 _call Player_Blue
	compare 0x5026 0x88
	if 0x1 _call Player_Orange
	compare 0x5026 0x85
	if 0x1 _call Player_Green	
	textcolor 0x0
	msgbox Passo_Tuono_1_2_tile0_text1 MSG_NORMAL	
	special 0x15A	
	pause 0x1E
	applymovement 0xFF Passo_Tuono_1_2_tile0_mov1
	waitmovement 0xFF
	pause 0x1E
	compare 0x5026 0x0
	if 0x1 _call Player_Blue
	compare 0x5026 0x88
	if 0x1 _call Player_Orange
	compare 0x5026 0x85
	if 0x1 _call Player_Green	
	textcolor 0x0
	msgbox Passo_Tuono_1_2_tile0_text2 MSG_NORMAL	
	special 0x15A	
	setvar 0x501F 0x149
	writebytetooffset 0x2 0x2036E28
	writebytetooffset 0x89 0x350A34
	
	//flashback
	fadescreen 0x1
	setvar 0x4051 0x41
	setvar 0x4052 0x6
	warpmuted 0x1 0x2 0xFF 0x0A 0x08
	releaseall
	end





	
	releaseall
	end

		Player_Blue:
			showpokepic 0x3b6 0x0 0x6
			return

		Player_Orange:
			showpokepic 0x3bE 0x0 0x6
			return

		Player_Green:
			showpokepic 0x3bF 0x0 0x6
			return

	Passo_Tuono_1_2_tile0_mov1:
		.byte 0x1 
		.byte 0x1C
		.byte 0x2 
		.byte 0x1C
		.byte 0x1A
		.byte 0x3 
		.byte 0x1C
		.byte 0x1 
		.byte 0x1B
		.byte 0x62
		.byte 0xFE
