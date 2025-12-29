.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_GrtVentiSuss_1_38
gMapScripts_GrtVentiSuss_1_38:
    mapscript MAP_SCRIPT_ON_LOAD GrtVentiSuss_1_38_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_FRAME_TABLE GrtVentiSuss_1_38_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE GrtVentiSuss_1_38_MapScriptOnWarpIntoMapTable
    .byte MAP_SCRIPT_TERMIN

	GrtVentiSuss_1_38_MapScriptOnLoad:
		compare 0x4051 0x3B
		if 0x1 _call GrtVentiSuss_1_38_MapScriptOnLoad_1
		compare 0x4051 0x3C
		if 0x1 _call GrtVentiSuss_1_38_MapScriptOnLoad_1
		compare 0x4051 0x3E
		if 0x1 _call GrtVentiSuss_1_38_MapScriptOnLoad_2
		compare 0x4051 0x3F
		if 0x4 _call GrtVentiSuss_1_38_MapScriptOnLoad_3
		end

		GrtVentiSuss_1_38_MapScriptOnLoad_1:
			spritebehave 0xA 0x8
			spritebehave 0xB 0x8
			movesprite2 0xC 0x09 0x0A
			movesprite2 0x3 0x07 0x04
			return

		GrtVentiSuss_1_38_MapScriptOnLoad_2:
			movesprite2 0xB 0x07 0x04
			movesprite2 0xA 0x07 0x04
			movesprite2 0xC 0x09 0x0A
			movesprite2 0x3 0x07 0x04
			return

		GrtVentiSuss_1_38_MapScriptOnLoad_3:
			movesprite2 0xB 0x0 0x10
			movesprite2 0xA 0x0 0x10
			return

	GrtVentiSuss_1_38_MapScriptOnWarpIntoMapTable:
	levelscript 0x4052, 6, GrtVentiSuss_1_38_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN


	GrtVentiSuss_1_38_MapScriptOnWarpIntoMapTableBegin:
		spriteface 0xFF 0x2
		end

	GrtVentiSuss_1_38_MapScriptOnFrame:
		levelscript 0x4052, 6, GrtVentiSuss_1_38_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		GrtVentiSuss_1_38_MapScriptOnFrameBegin:
			compare 0x4051 0x3A
			if 0x1 _goto GrtVentiSuss_1_38_MapScriptOnFrameBegin_P1
			compare 0x4051 0x3B
			if 0x1 _goto GrtVentiSuss_1_38_MapScript_P2_A
			compare 0x4051 0x3C
			if 0x1 _goto GrtVentiSuss_1_38_MapScript_P3_A
			compare 0x4051 0x3E
			if 0x1 _goto GrtVentiSuss_1_38_MapScript_P6
			releaseall
			end

			GrtVentiSuss_1_38_MapScriptOnFrameBegin_P1:
				//player "finalmente ecco quel pokemon..."
				pause 0x1E
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov4
				waitmovement 0xFF
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text0 MSG_NORMAL
				special 0x15A	
				pause 0x1E
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov5
				waitmovement 0xFF
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text0a MSG_NORMAL
				special 0x15A	
				pause 0x1E
				special 0x113
				applymovement 0x7F GrtVentiSuss_1_38_MapScript_mov1
				waitmovement 0x7F	
				pause 0x1E
				textcolor 0x1
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text1 MSG_NORMAL
				special 0x15A
				pause 0x1E
				applymovement 0x7F GrtVentiSuss_1_38_MapScript_mov2
				waitmovement 0x7F				
				special 0x114
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov3
				waitmovement 0xFF
				pause 0x1E
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text2 MSG_NORMAL
				special 0x15A				
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text3 MSG_NORMAL
				special 0x15A	
				pause 0x1E
				textcolor 0x1
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text4 MSG_NORMAL
				special 0x15A				
				pause 0x1E
				spriteface 0xA 0x1
				pause 0x1E
				spriteface 0xB 0x1
				pause 0x1E
				sound 0x5
				applymovement 0xA GrtVentiSuss_1_38_MapScript_mov4
				waitmovement 0xA	
				playsong 0x188 0x0

				pause 0x1E
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text5 MSG_NORMAL
				special 0x15A
				pause 0x1E
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov5
				waitmovement 0xFF
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text6 MSG_NORMAL
				special 0x15A
				pause 0x1E
				spriteface 0xA 0x3
				pause 0x1E
				spriteface 0xA 0x1
				pause 0x1E
				textcolor 0x1
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text7 MSG_NORMAL
				special 0x15A	
				pause 0x1E
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text8 MSG_NORMAL
				special 0x15A
				pause 0x1E
				sound 0x5
				applymovement 0xA GrtVentiSuss_1_38_MapScript_mov4
				waitmovement 0xA
				pause 0x1E
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text9 MSG_NORMAL
				special 0x15A				
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text10 MSG_NORMAL
				special 0x15A
				pause 0x1E
				textcolor 0x1
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text11 MSG_NORMAL
				special 0x15A
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text12 MSG_NORMAL
				special 0x15A
				pause 0x1E
				textcolor 0x1
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text13 MSG_NORMAL
				special 0x15A
				//Un vento più forte entra nella grotta, e la grande ruota si illumina leggermente, emettendo un suono sordo.
				pause 0x1E
				pause 0x1E
				applymovement 0xB GrtVentiSuss_1_38_MapScript_mov6
				waitmovement 0xB
				cry 0xB2 0x0
				textcolor 0x2
				msgbox Percorso3_3_21_tile0_text1 MSG_NORMAL
				pause 0x1E
				sound 0xC
				//ruota si attiva
				movesprite 0xc 0x09 0x0A
				movesprite 0x3 0x07 0x04
				pause 0x1E
				special 0x113
				applymovement 0x7F GrtVentiSuss_1_38_MapScript_mov7a
				waitmovement 0x7F
				pause 0x1E	
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov7
				waitmovement 0xFF				
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text14 MSG_NORMAL
				special 0x15A
				pause 0x1E

				textcolor 0x1
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text15 MSG_NORMAL
				special 0x15A
				pause 0x1E
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov8
				waitmovement 0xFF
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text16 MSG_NORMAL
				special 0x15A
				pause 0x1E
				textcolor 0x1
				showpokepic 0x3C1 0x0 0x6
				msgbox GrtVentiSuss_1_38_MapScript_text17 MSG_NORMAL
				special 0x15A
				pause 0x1E
				setvar 0x4051 0x3B
				textcolor 0x2
				msgbox GrtVentiSuss_1_38_MapScript_text18 MSG_YESNO
				compare 0x800D 0x1
				if 0x1 _goto GrtVentiSuss_1_38_MapScript_P3
				if 0x0 _goto GrtVentiSuss_1_38_MapScript_P2
				releaseall
				end

				GrtVentiSuss_1_38_MapScript_P2:
					textcolor 0x1
					showpokepic 0x3C1 0x0 0x6
					msgbox GrtVentiSuss_1_38_MapScript_text21 MSG_NORMAL
					special 0x15A
					textcolor 0x2
					msgbox GrtVentiSuss_1_38_MapScript_text18 MSG_YESNO
					compare 0x800D 0x1
					if 0x1 _goto GrtVentiSuss_1_38_MapScript_P3
					if 0x0 _goto GrtVentiSuss_1_38_MapScript_P2
					releaseall
					end
				
				GrtVentiSuss_1_38_MapScript_P2_A:
					applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov3
					waitmovement 0xFF
					compare 0x4051 0x3B
					if 0x1 _goto GrtVentiSuss_1_38_MapScript_P3
					releaseall
					end

				GrtVentiSuss_1_38_MapScript_P3:
					pause 0x1E
					textcolor 0x1
					showpokepic 0x3C1 0x0 0x6
					msgbox GrtVentiSuss_1_38_MapScript_text19 MSG_NORMAL
					special 0x15A
					//setvar 0x503A 0x2 
					//setvar 0x503B 0x0
					trainerbattle3 0x3 0x37 0x0 GrtVentiSuss_1_38_MapScript_text20
					//trainerbattle3 0x3 0x37 0x100 GrtVentiSuss_1_38_MapScript_text20
					setvar 0x4051 0x3C
					warpmuted 0x1 0x26 0xFF 0x09 0x07
					releaseall
					end
					
				GrtVentiSuss_1_38_MapScript_P3_A:					
					pause 0x1E
					sound 0x5
					applymovement 0xA GrtVentiSuss_1_38_MapScript_mov4
					waitmovement 0xA
					playsong 0x18C 0x0
					pause 0x1E
					textcolor 0x1
					showpokepic 0x3C1 0x0 0x6
					msgbox GrtVentiSuss_1_38_MapScript_text22 MSG_NORMAL
					special 0x15A
					pause 0x1E			
					compare 0x501F 0x100
					if 0x1 _call Player_Blue
					compare 0x501F 0x1A3
					if 0x1 _call Player_Orange
					compare 0x501F 0x1A4
					if 0x1 _call Player_Green
					textcolor 0x0
					msgbox GrtVentiSuss_1_38_MapScript_text23 MSG_NORMAL
					special 0x15A
					pause 0x1E
					textcolor 0x1
					showpokepic 0x3C1 0x0 0x6
					msgbox GrtVentiSuss_1_38_MapScript_text24 MSG_NORMAL
					special 0x15A
					pause 0x1E
					applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov9
					waitmovement 0xFF
					setvar 0x4051 0x3C
					//var 4054 e' il transport del puzzle
					pause 0x1E
					textcolor 0x2
					msgbox GrtVentiSuss_1_38_MapScript_text25 MSG_NORMAL
					movesprite 0xE 0x0B 0x07
					setvar 0x4054 0x0
					compare 0x4051 0x3C
					if 0x1 _goto GrtVentiSuss_1_38_MapScript_P4
					end

					//minigame 1
					GrtVentiSuss_1_38_MapScript_P4:
						compare 0x4054 0x6
						if 0x1 _goto GrtVentiSuss_1_38_MapScript_P5
						applymovement 0xE GrtVentiSuss_1_38_MapScript_mov_UP
						waitmovement 0xE
						special2 0x800D 0x2C
						compare 0x800D 0x3
						if 0x0 _goto GrtVentiSuss_1_38_MapScript_P4
						sound 0x5
						addvar 0x4054 0x1
						applymovement 0xC GrtVentiSuss_1_38_MapScript_mov_DOWN_FAST
						applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov_L_N
						waitmovement 0xC
						applymovement 0xE GrtVentiSuss_1_38_MapScript_mov_DOWN
						waitmovement 0xE
						compare 0x4051 0x3C
						if 0x1 _goto GrtVentiSuss_1_38_MapScript_P4					
						releaseall
						end


					GrtVentiSuss_1_38_MapScript_P5:
						hidesprite 0xE
						movesprite 0xF 0x09 0x0A
						movesprite 0xC 0x0 0x0
						pause 0x1E
						applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov4
						waitmovement 0xFF
						pause 0x1E
						pause 0x1E
						compare 0x501F 0x100
						if 0x1 _call Player_Blue
						compare 0x501F 0x1A3
						if 0x1 _call Player_Orange
						compare 0x501F 0x1A4
						if 0x1 _call Player_Green
						textcolor 0x0
						msgbox GrtVentiSuss_1_38_MapScript_text28 MSG_NORMAL
						special 0x15A

						//terremoto + player
						setvar 0x8004 0xF  
						setvar 0x8005 0xF  
						setvar 0x8006 0xF  
						setvar 0x8007 0xF
						special 0x136
						sound 0xC
						waitstate
						//setweather 0xB
						//doweather
						pause 0x1E
						textcolor 0x1
						showpokepic 0x3C1 0x0 0x6
						msgbox GrtVentiSuss_1_38_MapScript_text26 MSG_NORMAL
						special 0x15A
						pause 0x1E
						
						movesprite 0xD 0x09 0x08
						pause 0x1E
						applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov10
						waitmovement 0xFF
						pause 0x1E
						compare 0x501F 0x100
						if 0x1 _call Player_Blue
						compare 0x501F 0x1A3
						if 0x1 _call Player_Orange
						compare 0x501F 0x1A4
						if 0x1 _call Player_Green
						textcolor 0x0
						msgbox GrtVentiSuss_1_38_MapScript_text31 MSG_NORMAL
						special 0x15A
						pause 0x1E

						applymovement 0xA GrtVentiSuss_1_38_MapScript_mov4
						waitmovement 0xA

						pause 0x1E
						textcolor 0x1
						showpokepic 0x3C1 0x0 0x6
						msgbox GrtVentiSuss_1_38_MapScript_text27 MSG_NORMAL
						special 0x15A

						pause 0x1E
						fadescreen 0x3
						//setweather 0x2
						//doweather
						fadedefault
						pause 0x1E
						applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov11
						waitmovement 0xFF
						
						movesprite 0xD 0x0 0x0
						movesprite 0xF 0x0 0x0
						movesprite 0x3 0x09 0x0A
						sound 0x13
						pause 0x1E
						pause 0x1E
						fadescreen 0x2
						pause 0x1E
						pause 0x1E
						sound 0x5
						applymovement 0xA GrtVentiSuss_1_38_MapScript_mov4
						waitmovement 0xA							
						pause 0x1E
						textcolor 0x1
						showpokepic 0x3C1 0x0 0x6
						msgbox GrtVentiSuss_1_38_MapScript_text29 MSG_NORMAL
						special 0x15A
						pause 0x1E
						spriteface 0xA 0x2
						pause 0x1E
						pause 0x1E
						showpokepic 0x3C1 0x0 0x6
						msgbox GrtVentiSuss_1_38_MapScript_text30 MSG_NORMAL
						special 0x15A							
						fadescreen 0x1
						hidesprite 0xA
						sound 0x9
						pause 0x1E
						fadescreen 0x0
						pause 0x1E
						sound 0x5
						applymovement 0xB GrtVentiSuss_1_38_MapScript_mov12
						waitmovement 0xB
						cry 0xB2 0x0
						pause 0x1E
						fadescreen 0x1
						sound 0x9
						hidesprite 0xB
						pause 0x1E
						fadescreen 0x0
						setvar 0x501F 0x12e
						setvar 0x4051 0x3D
						pause 0x1E
						pause 0x1E
						warpmuted 0x1 0x7B 0xFF 0x07 0x06
						releaseall
						end

			GrtVentiSuss_1_38_MapScript_P6:
				pause 0x3E
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov4
				waitmovement 0xFF
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				textcolor 0x0
				msgbox GrtVentiSuss_1_38_MapScript_text32 MSG_NORMAL
				special 0x15A
				playsong 0x189 0x0
				pause 0x1E
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov13
				waitmovement 0xFF
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text33 MSG_NORMAL
				special 0x15A
				pause 0x2A
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov5
				waitmovement 0xFF
				pause 0x25
				//ruota stops
				sound 0xC
				movesprite 0x3 0x09 0x0A
				movesprite 0xC 0x07 0x04
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text34 MSG_NORMAL
				special 0x15A				
				pause 0x25
				spriteface 0xFF 0x3
				pause 0x23
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text35 MSG_NORMAL
				special 0x15A	

				pause 0x23
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text36 MSG_NORMAL
				special 0x15A	
				pause 0x20
				spriteface 0xFF 0x2
				pause 0x23
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text37 MSG_NORMAL
				special 0x15A	
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov14
				waitmovement 0xFF
				pause 0x21
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text38 MSG_NORMAL
				special 0x15A
				pause 0x21
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text39 MSG_NORMAL
				special 0x15A
				pause 0x21
				spriteface 0xFF 0x1
				pause 0x20
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text40 MSG_NORMAL
				special 0x15A
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov15
				waitmovement 0xFF
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text41 MSG_NORMAL
				special 0x15A
				pause 0x2A
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text42 MSG_NORMAL
				special 0x15A
				pause 0x2A
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text43 MSG_NORMAL
				special 0x15A
				pause 0x1E
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov5
				waitmovement 0xFF
				spriteface 0xFF 0x2
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text44 MSG_NORMAL
				special 0x15A
				pause 0x2E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text45 MSG_NORMAL
				special 0x15A
				pause 0x1E
				applymovement 0xFF GrtVentiSuss_1_38_MapScript_mov7a
				waitmovement 0xFF
				pause 0x1E
				compare 0x501F 0x100
				if 0x1 _call Player_Blue
				compare 0x501F 0x1A3
				if 0x1 _call Player_Orange
				compare 0x501F 0x1A4
				if 0x1 _call Player_Green
				msgbox GrtVentiSuss_1_38_MapScript_text46 MSG_NORMAL
				special 0x15A
				setvar 0x4051 0x3F
				setvar 0x4052 0x7
				fadedefault
				releaseall
				end


				GrtVentiSuss_1_38_MapScript_mov1:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov2:
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov3:
					.byte 0x63
					.byte 0x1C
					.byte 0x11
					.byte 0x12
					.byte 0x12
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x13
					.byte 0x13
					.byte 0x1 
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov4:
					.byte 0x62
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov5:
					.byte 0x63
					.byte 0xFE					

				GrtVentiSuss_1_38_MapScript_mov6:
					.byte 0x21
					.byte 0x21
					.byte 0x21
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov7:
					.byte 0x0 
					.byte 0x1C
					.byte 0x62
					.byte 0x1C
					.byte 0x1C
					.byte 0x1C			
					.byte 0x1 
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov7a:
					.byte 0x10
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov8:
					.byte 0x2 
					.byte 0x1C
					.byte 0x1C
					.byte 0x63
					.byte 0x1C
					.byte 0x1C
					.byte 0x1C
					.byte 0x1 
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov9:
					.byte 0x0
					.byte 0x1B
					.byte 0x65
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov10:
					.byte 0x21
					.byte 0x21					
					.byte 0x65
					.byte 0xFE			

				GrtVentiSuss_1_38_MapScript_mov11:
					.byte 0x60
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov_UP:
					.byte 0x1A
					.byte 0x1 
					.byte 0x1A
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov_DOWN:
					.byte 0x1A
					.byte 0x0
					.byte 0x1A
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov_LEFT_FAST:
					.byte 0x27
					.byte 0x27
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov_DOWN_FAST:
					.byte 0x25
					.byte 0x25
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov_L_N:
					.byte 0x21
					.byte 0x21
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov12:
					.byte 0x62
					.byte 0x1A
					.byte 0x0 
					.byte 0x19
					.byte 0x3 
					.byte 0x19
					.byte 0x1 
					.byte 0x19
					.byte 0x13
					.byte 0x0 
					.byte 0x52
					.byte 0x52
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov13:
					.byte 0x1B
					.byte 0x12
					.byte 0x1A
					.byte 0x0 
					.byte 0x13
					.byte 0x13
					.byte 0x1C
					.byte 0x1 
					.byte 0x12
					.byte 0x1A
					.byte 0x0 
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov14:
					.byte 0x1C
					.byte 0x11
					.byte 0x1B
					.byte 0x63
					.byte 0xFE

				GrtVentiSuss_1_38_MapScript_mov15:
					.byte 0x65
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

