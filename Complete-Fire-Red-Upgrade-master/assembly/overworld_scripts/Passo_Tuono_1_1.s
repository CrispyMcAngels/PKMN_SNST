.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Passo_Tuono_1_1
gMapScripts_Passo_Tuono_1_1:
	mapscript MAP_SCRIPT_ON_FRAME_TABLE Passo_Tuono_1_1_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Passo_Tuono_1_1_MapScriptOnFrame:
		levelscript 0x4066, 0, Passo_Tuono_1_1_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_1_MapScriptOnFrameBegin:
			pause 0x3E
			special 0x113
			applymovement 0x7F Passo_Tuono_1_1_mov1
			waitmovement 0x7F
			pause 0x1E
			showpokepic 0x3AB 0x0 0x6
			textcolor 0x0
			msgbox Passo_Tuono_1_1_text1 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0x2 Passo_Tuono_1_1_mov2
			waitmovement 0x2
			spriteface 0x1 0x2
			pause 0x1E
			showpokepic 0x3AD 0x15 0x6
			msgbox Passo_Tuono_1_1_text2 MSG_NORMAL
			special 0x15A						
			pause 0x1E
			applymovement 0x2 Passo_Tuono_1_1_mov3
			waitmovement 0x2	
			spriteface 0x1 0x4	
			pause 0x1E
			showpokepic 0x3AD 0x15 0x6
			msgbox Passo_Tuono_1_1_text3 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			spriteface 0x2 0x3
			pause 0x1E	
			showpokepic 0x3AB 0x0 0x6
			msgbox Passo_Tuono_1_1_text4 MSG_NORMAL
			special 0x15A
			pause 0x2E
			showpokepic 0x3AD 0x15 0x6
			msgbox Passo_Tuono_1_1_text5 MSG_NORMAL
			special 0x15A	
			pause 0x2E
			applymovement 0x1 Passo_Tuono_1_1_mov4
			waitmovement 0x1
			pause 0x1E
			showpokepic 0x3AB 0x0 0x6
			msgbox Passo_Tuono_1_1_text6 MSG_NORMAL
			special 0x15A
			pause 0x2E
			fadescreen 0x3
			pause 0x2E
			hidesprite 0x1
			sound 0x9
			fadescreen 0x2
			pause 0x2E
			applymovement 0x2 Passo_Tuono_1_1_mov5
			waitmovement 0x2
			pause 0x1E
			showpokepic 0x3AD 0x0 0x6
			msgbox Passo_Tuono_1_1_text7 MSG_NORMAL
			special 0x15A				
			pause 0x2E
			showpokepic 0x3AD 0x0 0x6
			msgbox Passo_Tuono_1_1_text8 MSG_NORMAL
			special 0x15A	
			pause 0x2E
			applymovement 0x2 Passo_Tuono_1_1_mov6
			waitmovement 0x2
			pause 0x1E
			showpokepic 0x3AD 0x0 0x6
			msgbox Passo_Tuono_1_1_text9 MSG_NORMAL
			special 0x15A	
			fadescreen 0x3
			pause 0x1E
			hidesprite 0x2
			sound 0x9
			fadescreen 0x2
			pause 0x3E
			setvar 0x4066 0x1
			compare 0x5026 0x0
			if 0x1 _goto blue_1_1
			compare 0x5026 0x88
			if 0x1 _goto orange_1_1
			compare 0x5026 0x85
			if 0x1 _goto green_1_1	
			releaseall
			end

				blue_1_1:
					setvar 0x501F 0x100
					warpmuted 0x3 0x15 0xFF 0x64 0x6
					releaseall
					end

				orange_1_1:
					setvar 0x501F 0x1a3
					warpmuted 0x3 0x15 0xFF 0x64 0x6
					releaseall
					end

				green_1_1:
					setvar 0x501F 0x1a4
					warpmuted 0x3 0x15 0xFF 0x64 0x6
					releaseall
					end


			
			Passo_Tuono_1_1_mov1:
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xFE

			Passo_Tuono_1_1_mov2:
				.byte 0x1 
				.byte 0x1A
				.byte 0x62
				.byte 0x1C
				.byte 0x11
				.byte 0xFE

			Passo_Tuono_1_1_mov3:
				.byte 0x3 
				.byte 0x1B
				.byte 0x55
				.byte 0x55
				.byte 0x20
				.byte 0x20
				.byte 0x20
				.byte 0xFE

			Passo_Tuono_1_1_mov4:
				.byte 0x10
				.byte 0xFE

			Passo_Tuono_1_1_mov5:
				.byte 0x63
				.byte 0x1A
				.byte 0x2 
				.byte 0x1B
				.byte 0x1 
				.byte 0x1B
				.byte 0x0 
				.byte 0xFE

			Passo_Tuono_1_1_mov6:
				.byte 0x1B
				.byte 0x2 
				.byte 0x1B
				.byte 0x1 
				.byte 0x1A
				.byte 0x3 
				.byte 0x1A
				.byte 0x0 
				.byte 0xFE
