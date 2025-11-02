.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Passo_Tuono_1_124
gMapScripts_Passo_Tuono_1_124:
	mapscript MAP_SCRIPT_ON_LOAD Passo_Tuono_1_124_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_FRAME_TABLE Passo_Tuono_1_124_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Passo_Tuono_1_124_MapScriptOnWarpIntoMapTable
	mapscript MAP_SCRIPT_ON_RESUME Passo_Tuono_1_124_MapScriptOnResume
    .byte MAP_SCRIPT_TERMIN

	Passo_Tuono_1_124_MapScriptOnResume:
		compare 0x4051 0x3D
		if 0x1 _call Passo_Tuono_1_124_MapScriptOnResume_P1
		end	

		Passo_Tuono_1_124_MapScriptOnResume_P1:
			playsong2 0x188
			return

	Passo_Tuono_1_124_MapScriptOnLoad:
		compare 0x4051 0x3E
		if 0x1 _call Passo_Tuono_1_124_MapScriptOnLoad_P2
		compare 0x4051 0x3F
		if 0x1 _call Passo_Tuono_1_124_MapScriptOnLoad_P2
		compare 0x4051 0x3F
		if 0x1 _call Passo_Tuono_1_124_MapScriptOnLoad_P3
		compare 0x4051 0x43
		if 0x1 _call Passo_Tuono_1_124_MapScriptOnLoad_P2
		compare 0x4051 0x43
		if 0x1 _call Passo_Tuono_1_124_MapScriptOnLoad_P3
		compare 0x4051 0x43
		if 0x1 _call Passo_Tuono_1_124_MapScriptOnLoad_P4
		end

		Passo_Tuono_1_124_MapScriptOnLoad_P2:
			playsong2 0x188
			setmaptile 0x02 0x03 0x288 0x0 
			setmaptile 0x03 0x03 0x289 0x0 
			setmaptile 0x04 0x03 0x2A0 0x0 
			setmaptile 0x02 0x04 0x28E 0x0 
			setmaptile 0x03 0x04 0x2A8 0x0 
			setmaptile 0x04 0x04 0x2AC 0x0 

			setmaptile 0x08 0x03 0x2A1 0x0 
			setmaptile 0x09 0x03 0x29B 0x0 
			setmaptile 0x0A 0x03 0x28A 0x0 
			setmaptile 0x08 0x04 0x28E 0x0 
			setmaptile 0x09 0x04 0x2A8 0x0 
			setmaptile 0x0A 0x04 0x2AC 0x0 

			setmaptile 0x02 0x09 0x2A1 0x0 
			setmaptile 0x03 0x09 0x29C 0x0 
			setmaptile 0x04 0x09 0x2A0 0x0 
			setmaptile 0x02 0x0A 0x28E 0x0 
			setmaptile 0x03 0x0A 0x2A8 0x0 
			setmaptile 0x04 0x0A 0x2AC 0x0 

			setmaptile 0x08 0x09 0x2A1 0x0 
			setmaptile 0x09 0x09 0x29C 0x0 
			setmaptile 0x0A 0x09 0x2A0 0x0 
			setmaptile 0x08 0x0A 0x28E 0x0 
			setmaptile 0x09 0x0A 0x2A8 0x0 
			setmaptile 0x0A 0x0A 0x2AC 0x0 
			return

		Passo_Tuono_1_124_MapScriptOnLoad_P3:
			setmaptile 0x06 0x01 0x2C6 0x0
			setmaptile 0x05 0x02 0x2CD 0x0
			setmaptile 0x06 0x02 0x2CE 0x0
			setmaptile 0x07 0x02 0x2CF 0x0
			setmaptile 0x05 0x03 0x2D5 0x0
			setmaptile 0x06 0x03 0x2D6 0x0
			setmaptile 0x07 0x03 0x2D7 0x0

			setmaptile 0x06 0x05 0x2C1 0x0
			setmaptile 0x05 0x06 0x2C8 0x0
			setmaptile 0x06 0x06 0x2C9 0x0
			setmaptile 0x07 0x06 0x2CA 0x0
			setmaptile 0x04 0x07 0x2CB 0x0
			setmaptile 0x05 0x07 0x2D0 0x0
			setmaptile 0x06 0x07 0x2D1 0x0
			setmaptile 0x07 0x07 0x2D2 0x0
			setmaptile 0x08 0x07 0x2D3 0x0
			setmaptile 0x05 0x08 0x2D8 0x0
			setmaptile 0x06 0x08 0x2D9 0x0
			setmaptile 0x07 0x08 0x2DA 0x0
			setmaptile 0x06 0x09 0x2E1 0x0

		Passo_Tuono_1_124_MapScriptOnLoad_P4:
			setmaptile 0x05 0x06 0x2E8 0x0
			setmaptile 0x06 0x06 0x2EA 0x0
			setmaptile 0x07 0x06 0x2EC 0x0
			setmaptile 0x04 0x07 0x2F0 0x0
			setmaptile 0x05 0x07 0x2F2 0x0
			setmaptile 0x06 0x07 0x2F4 0x0			
			return

	Passo_Tuono_1_124_MapScriptOnWarpIntoMapTable:
		levelscript 0x4052, 6, Passo_Tuono_1_124_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_124_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end

	Passo_Tuono_1_124_MapScriptOnFrame:
		levelscript 0x4052, 6, Passo_Tuono_1_124_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_124_MapScriptOnFrameBegin:
			compare 0x4051 0x3D
			if 0x1 _goto Passo_Tuono_1_124_MapScriptOnFrameBegin_P1
			compare 0x4051 0x42
			if 0x1 _goto Passo_Tuono_1_124_MapScriptOnFrameBegin_P2
			compare 0x4051 0x44
			if 0x1 _goto Passo_Tuono_1_124_MapScriptOnFrameBegin_P3
			releaseall
			end

			Passo_Tuono_1_124_MapScriptOnFrameBegin_P1:
				applymovement 0xFF Passo_Tuono_1_124_mov1
				waitmovement 0xFF
				pause 0x1E
				special 0x113
				applymovement 0x7F Passo_Tuono_1_124_mov2
				waitmovement 0x7F
				pause 0x1E
				pause 0x1E
				applymovement 0x7F Passo_Tuono_1_124_mov3
				waitmovement 0x7F
				special 0x114
				pause 0x1E
				pause 0x1E
				showpokepic 0x3AC 0x0 0x6
				textcolor 0x0
				msgbox Passo_Tuono_1_124_text1 MSG_NORMAL
				special 0x15A
				pause 0x1E
				pause 0x1E
				showpokepic 0x3AC 0x0 0x6
				textcolor 0x0
				msgbox Passo_Tuono_1_124_text2 MSG_NORMAL
				special 0x15A				
				pause 0x1E
				//compare la fiamma Gialla
				movesprite 0x4 0x07 0x0A
				//Cutscene???
				pause 0x1E
				showpokepic 0x3AC 0x0 0x6
				textcolor 0x0
				msgbox Passo_Tuono_1_124_text3 MSG_NORMAL
				special 0x15A	
				pause 0x25
				//scompare fiamma Gialla
				movesprite 0x4 0x00 0x0A
				applymovement 0xFF Passo_Tuono_1_124_mov4a
				waitmovement 0xFF
				pause 0x1E
				movesprite 0x4 0x04 0xA
				pause 0x25

				//focolare 1
				setmaptile 0x02 0x09 0x2A1 0x0 
				setmaptile 0x03 0x09 0x29C 0x0 
				setmaptile 0x04 0x09 0x2A0 0x0 
				setmaptile 0x02 0x0A 0x28E 0x0 
				setmaptile 0x03 0x0A 0x2A8 0x0 
				setmaptile 0x04 0x0A 0x2AC 0x0 
				special 0x8E
				pause 0x25
				movesprite 0x4 0x0C 0xB
				pause 0x25

				applymovement 0xFF Passo_Tuono_1_124_mov4b
				waitmovement 0xFF
				pause 0x1E
				movesprite 0x4 0x08 0xA
				pause 0x25

				//focolare 2
				setmaptile 0x08 0x09 0x2A1 0x0 
				setmaptile 0x09 0x09 0x29C 0x0 
				setmaptile 0x0A 0x09 0x2A0 0x0 
				setmaptile 0x08 0x0A 0x28E 0x0 
				setmaptile 0x09 0x0A 0x2A8 0x0 
				setmaptile 0x0A 0x0A 0x2AC 0x0
				special 0x8E
				pause 0x25
				movesprite 0x4 0x0C 0x5
				pause 0x25

				applymovement 0xFF Passo_Tuono_1_124_mov4c
				waitmovement 0xFF
				pause 0x1E
				movesprite 0x4 0x08 0x6
				pause 0x25

				//focolare 3
				setmaptile 0x08 0x03 0x2A1 0x0 
				setmaptile 0x09 0x03 0x29B 0x0 
				setmaptile 0x0A 0x03 0x28A 0x0 
				setmaptile 0x08 0x04 0x28E 0x0 
				setmaptile 0x09 0x04 0x2A8 0x0 
				setmaptile 0x0A 0x04 0x2AC 0x0 
				special 0x8E
				pause 0x25
				movesprite 0x4 0x00 0x4
				pause 0x25

				applymovement 0xFF Passo_Tuono_1_124_mov4d
				waitmovement 0xFF
				pause 0x1E
				movesprite 0x4 0x04 0x6
				pause 0x25

				//focolare 4
				setmaptile 0x02 0x03 0x288 0x0 
				setmaptile 0x03 0x03 0x289 0x0 
				setmaptile 0x04 0x03 0x2A0 0x0 
				setmaptile 0x02 0x04 0x28E 0x0 
				setmaptile 0x03 0x04 0x2A8 0x0 
				setmaptile 0x04 0x04 0x2AC 0x0  
				special 0x8E
				pause 0x25
				movesprite 0x4 0x00 0x4
				pause 0x3A


				//part 2
				
				applymovement 0xFF Passo_Tuono_1_124_mov4e
				waitmovement 0xFF
				pause 0x1E
				showpokepic 0x3AC 0x0 0x6
				textcolor 0x0
				msgbox Passo_Tuono_1_124_text4 MSG_NORMAL
				special 0x15A	
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov5
				waitmovement 0xFF			
				pause 0x1E
				showpokepic 0x3AC 0x0 0x6
				msgbox Passo_Tuono_1_124_text5 MSG_NORMAL
				special 0x15A	
				pause 0x1E
				showpokepic 0x3AC 0x0 0x6
				msgbox Passo_Tuono_1_124_text6 MSG_NORMAL
				special 0x15A
				sound 0xC
				pause 0x1E
				fadescreen 0x3
				setmaptile 0x06 0x01 0x2C6 0x0
				setmaptile 0x05 0x02 0x2CD 0x0
				setmaptile 0x06 0x02 0x2CE 0x0
				setmaptile 0x07 0x02 0x2CF 0x0
				setmaptile 0x05 0x03 0x2D5 0x0
				setmaptile 0x06 0x03 0x2D6 0x0
				setmaptile 0x07 0x03 0x2D7 0x0

				setmaptile 0x06 0x05 0x2C1 0x0
				setmaptile 0x05 0x06 0x2C8 0x0
				setmaptile 0x06 0x06 0x2C9 0x0
				setmaptile 0x07 0x06 0x2CA 0x0
				setmaptile 0x04 0x07 0x2CB 0x0
				setmaptile 0x05 0x07 0x2D0 0x0
				setmaptile 0x06 0x07 0x2D1 0x0
				setmaptile 0x07 0x07 0x2D2 0x0
				setmaptile 0x08 0x07 0x2D3 0x0
				setmaptile 0x05 0x08 0x2D8 0x0
				setmaptile 0x06 0x08 0x2D9 0x0
				setmaptile 0x07 0x08 0x2DA 0x0
				setmaptile 0x06 0x09 0x2E1 0x0			
				special 0x8E
				fadescreen 0x2
				
				//part 3

				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov6
				waitmovement 0xFF
				showpokepic 0x3AC 0x0 0x6
				textcolor 0x0
				msgbox Passo_Tuono_1_124_text7 MSG_NORMAL
				special 0x15A
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov7
				waitmovement 0xFF
				pause 0x1E
				showpokepic 0x3AC 0x0 0x6
				msgbox Passo_Tuono_1_124_text8 MSG_NORMAL
				special 0x15A
				pause 0x1E
				sound 0x13
				applymovement 0xFF Passo_Tuono_1_124_mov8
				waitmovement 0xFF
				sound 0x13
				pause 0x1E
				movesprite 0x1 0x06 0x08
				movesprite 0x2 0x06 0x04
				sound 0x9
				pause 0x30
				sound 0x9
				pause 0x30
				sound 0x9
				pause 0x2A
				fadescreen 0x3
				cry 0xF3 0x0
				pause 0x1E
				movesprite 0x3 0x6 0x7
				pause 0x2A

				movesprite 0x1 0x0E 0x07
				movesprite 0x2 0x0E 0x07
				fadescreen 0x2
				pause 0xB4
				textcolor 0x2
				cry 0xF3 0x0
				msgbox Passo_Tuono_1_124_text9 MSG_NORMAL
				pause 0x2E

				textcolor 0x0
				showpokepic 0x3AC 0x0 0x6
				msgbox Passo_Tuono_1_124_text10 MSG_NORMAL
				special 0x15A
				pause 0x1E

				//ANIMAZIONE 2
				textcolor 0x2
				cry 0xF3 0x0
				msgbox Passo_Tuono_1_124_text9 MSG_NORMAL
				pause 0xB4
				
				fadescreen 0x3
				fadedefault
				setvar 0x4051 0x3E
				setvar 0x501F 0x12E
				warp 0x1 0x7B 0xFF 0x07 0x06
				releaseall
				end
				releaseall
				end

				Passo_Tuono_1_124_mov1:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov2:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov3:
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0xFE

				Passo_Tuono_1_124_mov4a:
					.byte 0x1C
					.byte 0x12
					.byte 0x12
					.byte 0x1C
					.byte 0x1C
					.byte 0xFE

				Passo_Tuono_1_124_mov4b:
					.byte 0x13
					.byte 0x13
					.byte 0x13
					.byte 0x13
					.byte 0x1C
					.byte 0x1C
					.byte 0xFE

				Passo_Tuono_1_124_mov4c:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x03
					.byte 0x1C
					.byte 0x1C
					.byte 0xFE

				Passo_Tuono_1_124_mov4d:
					.byte 0x12
					.byte 0x12
					.byte 0x12
					.byte 0x12
					.byte 0x1C
					.byte 0x1C
					.byte 0xFE

				Passo_Tuono_1_124_mov4e:
					.byte 0x13 
					.byte 0x13 
					.byte 0x1 
					.byte 0xFE

				Passo_Tuono_1_124_mov5:
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov6:
					.byte 0x0 
					.byte 0x1A
					.byte 0x62
					.byte 0x1C
					.byte 0xFE

				Passo_Tuono_1_124_mov7:
					.byte 0x1C
					.byte 0x1C
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x1 
					.byte 0xFE

				Passo_Tuono_1_124_mov8:
					.byte 0x1C
					.byte 0x65
					.byte 0x1C
					.byte 0xFE

			Passo_Tuono_1_124_MapScriptOnFrameBegin_P2:
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov9
				waitmovement 0xFF
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox Passo_Tuono_1_124_text11 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov10
				waitmovement 0xFF
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				msgbox Passo_Tuono_1_124_text12 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov11
				waitmovement 0xFF
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green					
				msgbox Passo_Tuono_1_124_text13 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov12
				waitmovement 0xFF				
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green					
				msgbox Passo_Tuono_1_124_text14 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov13
				waitmovement 0xFF		
				msgbox Passo_Tuono_1_124_text15 MSG_NORMAL
				setvar 0x4051 0x43
				//invisible player
				//setvar 0x501F 0x12E
				//call puzzle
				//warpmuted 0x0 0xC 0xFF 0x7 0x5
				compare 0x4051 0x43
				if 0x1 _goto Passo_Tuono_1_124_MapScriptOnFrameBegin_P3

				releaseall
				end



				

			Passo_Tuono_1_124_MapScriptOnFrameBegin_P3:
				pause 0x1E
				applymovement 0xFF Passo_Tuono_1_124_mov14
				waitmovement 0xFF
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green					
				msgbox Passo_Tuono_1_124_text16 MSG_NORMAL	
				special 0x15A	
				pause 0x1E				
				applymovement 0xFF Passo_Tuono_1_124_mov15
				waitmovement 0xFF
				pause 0x1E
				special 0x113
				applymovement 0x7F Passo_Tuono_1_124_mov16
				waitmovement 0x7F			
				pause 0x1E
				//bigger flame
				setmaptile 0x05 0x05 0x2F8 0x0
				setmaptile 0x06 0x05 0x2FA 0x0
				setmaptile 0x07 0x05 0x2FD 0x0
				setmaptile 0x05 0x06 0x300 0x0
				setmaptile 0x06 0x06 0x302 0x0
				setmaptile 0x07 0x06 0x304 0x0
				setmaptile 0x05 0x07 0x308 0x0
				setmaptile 0x06 0x07 0x30A 0x0
				setmaptile 0x07 0x07 0x30C 0x0						
				special 0x8E
				//bigger flame sound

				//to be enhanced

				sound 0xC
				pause 0x2E
				applymovement 0x7F Passo_Tuono_1_124_mov17
				waitmovement 0x7F					
				special 0x114
				pause 0x25
				applymovement 0xFF Passo_Tuono_1_124_mov18
				waitmovement 0xFF				
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green					
				msgbox Passo_Tuono_1_124_text17 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				movesprite 0x5 0x06 0x07
				pause 0x2E	
				showpokepic 0x3C2 0x15 0x6
				msgbox Passo_Tuono_1_124_text18 MSG_NORMAL	
				special 0x15A	
				pause 0x2E					
				showpokepic 0x3C2 0x15 0x6
				msgbox Passo_Tuono_1_124_text19 MSG_NORMAL	
				special 0x15A	
				pause 0x2E
				applymovement 0xFF Passo_Tuono_1_124_mov14
				waitmovement 0xFF
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green					
				msgbox Passo_Tuono_1_124_text20 MSG_NORMAL	
				special 0x15A	
				pause 0x2E	
				showpokepic 0x3C2 0x15 0x6
				msgbox Passo_Tuono_1_124_text21 MSG_NORMAL	
				special 0x15A	
				pause 0x2E
				movesprite 0x6 0x06 0x07
				movesprite 0x5 0x0D 0x09
				applymovement 0x6 Passo_Tuono_1_124_mov19
				applymovement 0xFF Passo_Tuono_1_124_mov20
				waitmovement 0x6
				pause 0x25
				showpokepic 0x3BA 0x15 0x6
				msgbox Passo_Tuono_1_124_text22 MSG_NORMAL	
				special 0x15A	
				pause 0x1E				
				applymovement 0xFF Passo_Tuono_1_124_mov14
				waitmovement 0xFF
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green					
				msgbox Passo_Tuono_1_124_text23 MSG_NORMAL	
				special 0x15A	
				pause 0x2E	
				showpokepic 0x3BA 0x15 0x6
				msgbox Passo_Tuono_1_124_text24 MSG_NORMAL	
				special 0x15A	
				pause 0x1E			
				//Arriva Team Dusk
				playsong 0x112 0x0
				spriteface 0xFF 0x1
				//movecamera down
				pause 0x1E
				special 0x113
				applymovement 0x7F Passo_Tuono_1_124_mov16
				waitmovement 0x7F	
				sound 0x9
				movesprite 0x7 0x6 0xE
				pause 0x1E
				applymovement 0x7 Passo_Tuono_1_124_mov21
				waitmovement 0x7
				pause 0x1E
				showpokepic 0x3AD 0x15 0x6
				msgbox Passo_Tuono_1_124_text25 MSG_NORMAL	
				special 0x15A	
				pause 0x24
				movesprite 0x8 0x6 0xE
				sound 0x9
				pause 0x1E
				applymovement 0x8 Passo_Tuono_1_124_mov22
				waitmovement 0x8			
				pause 0x1E
				movesprite 0x9 0x6 0xE
				sound 0x9
				pause 0x1E
				applymovement 0x9 Passo_Tuono_1_124_mov23
				waitmovement 0x9	
				pause 0x1E
				movesprite 0xA 0x6 0xE
				sound 0x9
				pause 0x1E
				applymovement 0xA Passo_Tuono_1_124_mov24
				waitmovement 0xA	
				pause 0x1E
				showpokepic 0x3BB 0x15 0x6
				msgbox Passo_Tuono_1_124_text26 MSG_NORMAL	
				special 0x15A 	
				pause 0x2E
				showpokepic 0x3AD 0x15 0x6
				msgbox Passo_Tuono_1_124_text27 MSG_NORMAL	
				special 0x15A				
				pause 0x25
				applymovement 0x7F Passo_Tuono_1_124_mov17
				applymovement 0x7 Passo_Tuono_1_124_mov13
				waitmovement 0x7F
				special 0x114
				pause 0x22
				showpokepic 0x3AD 0x15 0x6
				msgbox Passo_Tuono_1_124_text28 MSG_NORMAL	
				special 0x15A					
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green					
				msgbox Passo_Tuono_1_124_text29 MSG_NORMAL	
				special 0x15A	
				pause 0x2E	
				showpokepic 0x3AD 0x15 0x6
				msgbox Passo_Tuono_1_124_text30 MSG_NORMAL	
				special 0x15A	
				pause 0x2E
				applymovement 0x7 Passo_Tuono_1_124_mov25
				waitmovement 0x7
				pause 0x1E
				applymovement 0x8 Passo_Tuono_1_124_mov26
				applymovement 0x9 Passo_Tuono_1_124_mov27
				applymovement 0xA Passo_Tuono_1_124_mov28
				waitmovement 0x8
				pause 0x1E
				spriteface 0xFF 0x3
				pause 0x1E
				setvar 0x4051 0x45
				compare 0x4051 0x45
				if 0x1 _goto Passo_Tuono_1_124_MapScriptOnFrameBegin_P4
				releaseall
				end

			Passo_Tuono_1_124_MapScriptOnFrameBegin_P4:	 
				trainerbattle0 0x0 0x42 0x0 Passo_Tuono_1_124_text31 Passo_Tuono_1_124_text32
				pause 0x1E
				


				spriteface 0xFF 0x1
				pause 0x1E
				setvar 0x4051 0x46
				compare 0x4051 0x46
				if 0x1 _goto Passo_Tuono_1_124_MapScriptOnFrameBegin_P5
				releaseall
				end

			Passo_Tuono_1_124_MapScriptOnFrameBegin_P5:	 
				trainerbattle0 0x0 0x43 0x0 Passo_Tuono_1_124_text34 Passo_Tuono_1_124_text35
				pause 0x23



				spriteface 0xFF 0x4
				pause 0x1E
				setvar 0x4051 0x47
				compare 0x4051 0x47
				if 0x1 _goto Passo_Tuono_1_124_MapScriptOnFrameBegin_P6
				releaseall
				end

			Passo_Tuono_1_124_MapScriptOnFrameBegin_P6:	 
				trainerbattle0 0x0 0x44 0x0 Passo_Tuono_1_124_text36 Passo_Tuono_1_124_text37
				pause 0x23				
				
				//turn towards raito
				spriteface 0xFF 0x2
				
				pause 0x1E
				showpokepic 0x3BA 0x15 0x6
				msgbox Passo_Tuono_1_124_text33 MSG_NORMAL	
				special 0x15A					
				//heal party
				pause 0x1E
				fadescreen 0x1
				fanfare 0x0100
				waitfanfare
				special 0x0 
				fadescreen 0x0
				pause 0x22
				showpokepic 0x3BA 0x15 0x6
				msgbox Passo_Tuono_1_124_text38 MSG_NORMAL	
				special 0x15A	
				pause 0x23
				spriteface 0xFF 0x1
				pause 0x1E
				//move reclute & vesper up 
				//still to be done 

				setvar 0x4051 0x48
				compare 0x4051 0x48
				if 0x1 _goto Passo_Tuono_1_124_MapScriptOnFrameBegin_P7
				releaseall
				end

			Passo_Tuono_1_124_MapScriptOnFrameBegin_P7:

				//discorsi Vesper
				pause 0x1E
				showpokepic 0x3AD 0x15 0x6
				msgbox Passo_Tuono_1_124_text39 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				trainerbattle0 0x0 0x45 0x0 Passo_Tuono_1_124_text40 Passo_Tuono_1_124_text41
				movesprite 0x8 0x4 0x7
				spriteface 0x8 0x4
				movesprite 0xA 0x8 0x7
				spriteface 0x8 0x3
				pause 0x23	
				showpokepic 0x3AD 0x15 0x6
				msgbox Passo_Tuono_1_124_text42 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				applymovement 0xA Passo_Tuono_1_124_mov29
				waitmovement 0xA
				spriteface 0x7 0x4
				pause 0x1E
				movesprite 0x3 0x7 0xA
				pause 0x1E
				spriteface 0x7 0x2
				spriteface 0xA 0x2
				spriteface 0x8 0x1
				pause 0x25
				applymovement 0xFF Passo_Tuono_1_124_mov14
				applymovement 0x5 Passo_Tuono_1_124_mov14
				waitmovement 0xFF
				pause 0x1E
				showpokepic 0x3BA 0x0 0x6
				msgbox Passo_Tuono_1_124_text43 MSG_NORMAL	
				special 0x15A	
				pause 0x1E				
				showpokepic 0x3AD 0x15 0x6
				msgbox Passo_Tuono_1_124_text44 MSG_NORMAL	
				special 0x15A					
				pause 0x1E
				spriteface 0x7 0x1
				pause 0x1E				
				showpokepic 0x3AD 0x15 0x6
				msgbox Passo_Tuono_1_124_text45 MSG_NORMAL	
				special 0x15A		
				pause 0x1E
				fadescreen 0x1
				hidesprite 0x7
				hidesprite 0x8
				hidesprite 0x9
				hidesprite 0xA
				sound 0x9
				fadedefault
				fadescreen 0x0
				pause 0x1E
				applymovement 0x5 Passo_Tuono_1_124_mov30
				waitmovement 0x5
				spriteface 0xFF 0x3
				playsong 0x189
				pause 0x1E
				showpokepic 0x3BA 0x15 0x6
				msgbox Passo_Tuono_1_124_text46 MSG_NORMAL	
				special 0x15A		
				pause 0x1E				

				//arrived till here





				//(Arrivano Crispy e un agente di polizia.)

				//CRISPY:
				//PLAYER! Ehi! Come sei arrivato qui così in fretta?!
				//Aspetta… non dirmi che hai risolto tu l’enigma!

				//AGENTE:
				//Il luogo sembra sicuro, ma… qualcuno mi spiega cosa diavolo è successo qui dentro?

				//RAITO:
				//Non molto tempo fa il Team Dusk ha fatto irruzione nel tempio.
				//Sono riusciti a rubare la Fiamma Gialla, una reliquia antica di Eyros.

//				AGENTE:
//				Il Team Dusk, eh…
//				Non sentivo quel nome da anni.
//				Sembravano scomparsi, e ora spuntano dal nulla come un temporale!
//
//				CRISPY:
//				Una Fiamma Gialla, dici? Perché mai rubare una cosa del genere?

//				RAITO:
//				Perché non è una semplice fiamma.
//				È uno dei tre frammenti del potere che un tempo risvegliò il leggendario guardiano di Eyros… Ho-oh.

//				CRISPY:
//				Aspetta, quindi le incisioni di Filiberto avevano ragione…
//				E tu, Raito, come puoi sapere tutto questo?

//				RAITO:
//				Perché… io sono il guardiano di questo tempio.

//				CRISPY:
//				Il guardiano…? Ma allora chi sei davvero?

//				RAITO:
//				Le spiegazioni dovranno attendere.
//				Questo luogo non è più sicuro.
//				Raggiungetemi a Roccavento: lì vi racconterò tutto.

//				RAITO:
//				Conto su di voi. Proteggere il tempo, ora, è nelle vostre mani.

//				(Raito svanisce tra una luce gialla e scosse elettriche leggere.)

//				CRISPY:
//				Che tipo strano…
//				E poi quella storia del “prescelto”…

//				(Guarda il protagonista e sorride.)

//				CRISPY:
//				Beh, l’unico modo per capirci qualcosa è andare a Roccavento, no?
//				Preparati: ci andremo in volo con il mio Flygon, dal terrazzo panoramico di Radiantia!

//				CRISPY:
//				Quando sei pronto, raggiungimi lì.
//				Da adesso in poi… tutto si farà più serio.

				Passo_Tuono_1_124_mov9:
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov10:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x1C
					.byte 0x2 
					.byte 0x1A
					.byte 0x62
					.byte 0x1C
					.byte 0x3 
					.byte 0x1B
					.byte 0xFE

				Passo_Tuono_1_124_mov11:
					.byte 0x0 
					.byte 0x1C
					.byte 0x62
					.byte 0xFE

				Passo_Tuono_1_124_mov12:
					.byte 0x1
					.byte 0x1C
					.byte 0x62
					.byte 0xFE

				Passo_Tuono_1_124_mov13:
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov14:
					.byte 0x62
					.byte 0xFE

				Passo_Tuono_1_124_mov15:
					.byte 0x1C
					.byte 0x2 
					.byte 0x1C
					.byte 0x1A
					.byte 0x3 
					.byte 0x1C
					.byte 0x1A
					.byte 0x0 
					.byte 0x1C
					.byte 0x63
					.byte 0x1C
					.byte 0xFE

				Passo_Tuono_1_124_mov16:
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0xFE

				Passo_Tuono_1_124_mov17:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov18:
					.byte 0x10
					.byte 0x12
					.byte 0x12
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x13
					.byte 0x13
					.byte 0x1 
					.byte 0x1C
					.byte 0x63
					.byte 0x1A
					.byte 0xFE

				Passo_Tuono_1_124_mov19:
					.byte 0x4E
					.byte 0xFE

				Passo_Tuono_1_124_mov20:
					.byte 0x1D
					.byte 0x1 
					.byte 0x62
					.byte 0xFE

				Passo_Tuono_1_124_mov21:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov22:
					.byte 0x11
					.byte 0x11
					.byte 0x12
					.byte 0x1 
					.byte 0xFE

				Passo_Tuono_1_124_mov23:
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov24:
					.byte 0x11
					.byte 0x13
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_124_mov25:
					.byte 0xC 
					.byte 0x1 
					.byte 0xFE

				Passo_Tuono_1_124_mov26:
					.byte 0x1E
					.byte 0x1E
					.byte 0x20
					.byte 0x1 
					.byte 0xFE

				Passo_Tuono_1_124_mov27:
					.byte 0x1F
					.byte 0x1E
					.byte 0x1E
					.byte 0x1E
					.byte 0x3 
					.byte 0xFE

				Passo_Tuono_1_124_mov28:
					.byte 0x1E
					.byte 0x1E
					.byte 0x1E
					.byte 0x2 
					.byte 0xFE

				Passo_Tuono_1_124_mov29:
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x2 
					.byte 0x1C
					.byte 0xFE

				Passo_Tuono_1_124_mov30:
					.byte 0x12
					.byte 0x10
					.byte 0x3 
					.byte 0xFE




		Player_Blue:
			showpokepic 0x3b6 0x0 0x6
			return

		Player_Orange:
			showpokepic 0x3bE 0x0 0x6
			return

		Player_Green:
			showpokepic 0x3bF 0x0 0x6
			return