.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Borgo_Ponente_4_3_Sign0
EventScript_Borgo_Ponente_4_3_Sign0:
	msgbox Borgo_Ponente_4_3_Sign0_text1 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_4_3_Sign1
EventScript_Borgo_Ponente_4_3_Sign1:
	msgbox Borgo_Ponente_4_3_Sign1_text1 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_4_3_Sign2
EventScript_Borgo_Ponente_4_3_Sign2:
	msgbox Borgo_Ponente_4_3_Sign2_text1 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_4_3_Sign3
EventScript_Borgo_Ponente_4_3_Sign3:
	msgbox Borgo_Ponente_4_3_Sign3_text1 MSG_SIGN
	end


.global EventScript_Borgo_Ponente_4_3_NPC1
EventScript_Borgo_Ponente_4_3_NPC1:
	lock
	faceplayer
	compare 0x4051 0x12
	if 0x1 _call EventScript_Borgo_Ponente_4_3_NPC1_P1
	showpokepic 0x3B7 0x0 0x6
	msgbox EventScript_Borgo_Ponente_4_3_NPC1_text1 MSG_NORMAL
	special 0x15A
	release
	end

	EventScript_Borgo_Ponente_4_3_NPC1_P1:
		showpokepic 0x3B7 0x0 0x6
		msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text15 MSG_NORMAL
		special 0x15A
		release
		end	

.global EventScript_Borgo_Ponente_4_3_NPC0
EventScript_Borgo_Ponente_4_3_NPC0:
	lock
	faceplayer
	msgbox EventScript_Borgo_Ponente_4_3_NPC0_text1 MSG_NORMAL
	release
	end



.global gMapScripts_Borgo_Ponente_4_3
gMapScripts_Borgo_Ponente_4_3:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Borgo_Ponente_4_3_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Borgo_Ponente_4_3_MapScriptOnWarpIntoTable
    .byte MAP_SCRIPT_TERMIN

	Borgo_Ponente_4_3_MapScriptOnWarpIntoTable:
		levelscript 0x4050, 3, Borgo_Ponente_4_3_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Borgo_Ponente_4_3_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end		

	Borgo_Ponente_4_3_MapScriptOnFrame:
		levelscript 0x4050, 3, Borgo_Ponente_4_3_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Borgo_Ponente_4_3_MapScriptOnFrameBegin:
			lockall
			compare 0x4051 0x11
			if 0x1 _call Borgo_Ponente_4_3_MapScriptOnFrame_Part1
			releaseall
			end

			Borgo_Ponente_4_3_MapScriptOnFrame_Part1:
					spriteface 0xFF 0x2
				    showpokepic 0x3b7 0x0 0x6
    				//Ciao ragazzi...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text1 MSG_NORMAL
					special 0x15A
					pause 0x1E
					showpokepic 0x3b5 0x15 0x6
    				//salve prof oak..
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text2 MSG_NORMAL
					special 0x15A
					pause 0x1E
					showpokepic 0x3b7 0x0 0x6
    				//Ma certo...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text3 MSG_NORMAL
					special 0x15A
					pause 0x1E
					applymovement 0x2 Borgo_Ponente_4_3_MapScriptOnFrame_mov1
					waitmovement 0x0
					showpokepic 0x3b7 0x0 0x6
    				//wow incredibile...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text4 MSG_NORMAL
					special 0x15A
					pause 0x1E
					applymovement 0x2 Borgo_Ponente_4_3_MapScriptOnFrame_mov2
					waitmovement 0x0
					showpokepic 0x3b7 0x0 0x6
    				//ora che player ha...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text5 MSG_NORMAL
					special 0x15A
					pause 0x1E
					applymovement 0x4 Borgo_Ponente_4_3_MapScriptOnFrame_mov3
					waitmovement 0x0
					showpokepic 0x3b5 0x15 0x6
    				//si esatto..
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text6 MSG_NORMAL
					special 0x15A
					pause 0x1E
					showpokepic 0x3b7 0x0 0x6
    				//Non preoccuparti
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text7 MSG_NORMAL
					special 0x15A
					pause 0x1E
					applymovement 0x2 Borgo_Ponente_4_3_MapScriptOnFrame_mov4
					waitmovement 0x0
					pause 0x1e
					hidesprite 0x3
					applymovement 0x2 Borgo_Ponente_4_3_MapScriptOnFrame_mov5
					waitmovement 0x0
					showpokepic 0x3b7 0x0 0x6
    				//Ecco Brandon, tieni!
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text8 MSG_NORMAL
					special 0x15A
					fanfare 0x013E
					//brandon riceve Deino
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text9 MSG_NORMAL

					pause 0x1E
					showpokepic 0x3b5 0x15 0x6
    				//wow questo pokemon sembra fortissimo
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text10 MSG_NORMAL
					special 0x15A
					pause 0x1E
					showpokepic 0x3b7 0x0 0x6
    				//e' proprio cosi...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text11 MSG_NORMAL
					special 0x15A
					pause 0x1E
					showpokepic 0x3b6 0x0 0x6
    				//player: ...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text12 MSG_NORMAL
					special 0x15A
					applymovement 0x4 Borgo_Ponente_4_3_MapScriptOnFrame_mov6
					waitmovement 0x0
					pause 0x1E
					showpokepic 0x3b7 0x0 0x6
    				//perche non vi sfidate...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text13 MSG_NORMAL
					special 0x15A
					applymovement 0x4 Borgo_Ponente_4_3_MapScriptOnFrame_mov7
					waitmovement 0x0
					showpokepic 0x3b5 0x15 0x6
    				//Ma certo...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text14 MSG_NORMAL
					special 0x15A
					playsong 0x13C 0x0
					applymovement 0x4 Borgo_Ponente_4_3_MapScriptOnFrame_mov8
					waitmovement 0x4
					hidesprite 0x4
					setflag 0x02B
					fadedefault
					applymovement 0x2 Borgo_Ponente_4_3_MapScriptOnFrame_mov9
					waitmovement 0x0
					pause 0x1E
					showpokepic 0x3b7 0x0 0x6
    				//quel brandon...
					msgbox Borgo_Ponente_4_3_MapScriptOnFrame_text15 MSG_NORMAL
					special 0x15A
					setvar 0x4050 0x2
					setvar 0x4051 0x12
					return


					Borgo_Ponente_4_3_MapScriptOnFrame_mov1:
						.byte 0x13
						.byte 0x0 
						.byte 0x1C
						.byte 0x63
						.byte 0xFE

					Borgo_Ponente_4_3_MapScriptOnFrame_mov2:
						.byte 0x12
						.byte 0x0 
						.byte 0xFE

					Borgo_Ponente_4_3_MapScriptOnFrame_mov3:
						.byte 0x1A
						.byte 0x65
						.byte 0x53
						.byte 0x53
						.byte 0x53
						.byte 0x18
						.byte 0xFE

					Borgo_Ponente_4_3_MapScriptOnFrame_mov4:
						.byte 0x13
						.byte 0x1 
						.byte 0xFE

					Borgo_Ponente_4_3_MapScriptOnFrame_mov5:
						.byte 0x1C
						.byte 0x12
						.byte 0x0 
						.byte 0xFE

					Borgo_Ponente_4_3_MapScriptOnFrame_mov6:
						.byte 0x1A
						.byte 0x66
						.byte 0x66
						.byte 0xFE

					Borgo_Ponente_4_3_MapScriptOnFrame_mov7:
						.byte 0x53
						.byte 0x53
						.byte 0x3 
						.byte 0x1A
						.byte 0x1 
						.byte 0xFE

					Borgo_Ponente_4_3_MapScriptOnFrame_mov8:
						.byte 0x10
						.byte 0x10
						.byte 0x10
						.byte 0x10
						.byte 0x10
						.byte 0x10
						.byte 0x60
						.byte 0xFE

					Borgo_Ponente_4_3_MapScriptOnFrame_mov9:
						.byte 0x13
						.byte 0x0 
						.byte 0xFE
