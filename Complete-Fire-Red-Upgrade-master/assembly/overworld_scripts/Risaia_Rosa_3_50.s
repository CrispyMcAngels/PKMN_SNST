.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Risaia_Rosa_3_50
gMapScripts_Risaia_Rosa_3_50:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Risaia_Rosa_3_50_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_LOAD Risaia_Rosa_3_50_MapScriptOnLoad
	//mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Risaia_Rosa_3_50_MapScriptOnWarpIntoMapTable
    .byte MAP_SCRIPT_TERMIN

	//Risaia_Rosa_3_50_MapScriptOnWarpIntoMapTable:
	//	levelscript 0x4051, 0x4D, Risaia_Rosa_3_50_MapScriptOnWarpIntoMapTableBegin
	//	.hword MAP_SCRIPT_TERMIN

	//	Risaia_Rosa_3_50_MapScriptOnWarpIntoMapTableBegin:
	//		spriteface 0xFF 0x4
	//		end	

	Risaia_Rosa_3_50_MapScriptOnLoad:
		setvar 0x5007 0x14
		end

		
	Risaia_Rosa_3_50_MapScriptOnFrame:
		levelscript 0x4067, 0x2, Risaia_Rosa_3_50_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Risaia_Rosa_3_50_MapScriptOnFrameBegin:
			compare 0x4067 0x2
			if 0x1 _goto Risaia_Rosa_3_50_MapScriptOnFrameBegin_P1
			releaseall
			end

		Risaia_Rosa_3_50_MapScriptOnFrameBegin_P1:
			spriteface 0xFF 0x2	
			pause 0x25
			showpokepic 0x3B6 0x0 0x6
			msgbox Risaia_Rosa_3_50_MapScript_text1 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			movesprite 0x3 0x0F 0x14
			pause 0x25
			setvar 0x500E 0x6
			pause 0x1E		
			showpokepic 0x3BA 0x0 0x6
			msgbox Risaia_Rosa_3_50_MapScript_text2 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			setvar 0x8004 0xF  
			setvar 0x8005 0xF  
			setvar 0x8006 0xF  
			setvar 0x8007 0xF
			special 0x136
			sound 0xC
			pause 0x15
			setvar 0x4052 0x6
			setvar 0x501F 0x12E
			warpteleport 0x0 0x11 0xFF 0x7 0x6
			releaseall 
			end



//___TILEs___

.global EventScript_Risaia_Rosa_3_50_tile0
EventScript_Risaia_Rosa_3_50_tile0:
	lockall
	applymovement 0xFF Risaia_Rosa_3_50_tile0_mov1
	waitmovement 0xFF
	sound 0x15
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text1 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text2 MSG_NORMAL
	special 0x15A	
	playsong 0x188
	pause 0x2E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text3 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	special 0x113
	applymovement 0x7F Risaia_Rosa_3_50_tile0_mov2
	waitmovement 0x7F
	pause 0x2E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text4 MSG_NORMAL
	special 0x15A	
	pause 0x2E	
	applymovement 0x7F Risaia_Rosa_3_50_tile0_mov3
	waitmovement 0x7F	

	pause 0x25
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text5 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	spriteface 0x1 0x1
	pause 0x1E
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text6 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	spriteface 0x1 0x2
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text7 MSG_NORMAL
	special 0x15A	
	spriteface 0x1 0x1
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text8 MSG_NORMAL
	special 0x15A	
	pause 0x25
	movesprite 0x2 0x10 0x14
	pause 0x25
	sound 0x15
	spriteface 0xFF 0x4
	applymovement 0xFF mov_question
	waitmovement 0xFF
	pause 0x1E
	showpokepic 0x3B6 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text16 MSG_NORMAL
	special 0x15A	
	pause 0x25
	applymovement 0x1 Risaia_Rosa_3_50_tile0_mov4a
	waitmovement 0x1
	pause 0x1E
	sound 0x15
	applymovement 0x1 mov_exclamation
	waitmovement 0x1
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text9 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	showpokepic 0x3B6 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text10 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text11 MSG_NORMAL
	special 0x15A	

	pause 0x1E
	applymovement 0x1 Risaia_Rosa_3_50_tile0_mov4b
	waitmovement 0x1
	spriteface 0xFF 0x2
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text12 MSG_NORMAL
	special 0x15A	
	pause 0x1E	
	applymovement 0x1 Risaia_Rosa_3_50_tile0_mov4c
	waitmovement 0x1
	applymovement 0x1 mov_exclamation
	waitmovement 0x1
	pause 0x1E
	movesprite 0x2 0x0F 0x14
	playsong 0x18C
	applymovement 0x2 Risaia_Rosa_3_50_tile0_mov5
	waitmovement 0x2
	pause 0x25
	spritebehave 0x2 0x49
	pause 0x25
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text12b MSG_NORMAL
	special 0x15A	
	pause 0x1E		


	applymovement 0x1 Risaia_Rosa_3_50_tile0_mov4
	waitmovement 0x1
	//applymovement 0x7F Risaia_Rosa_3_50_tile0_mov3a
	//waitmovement 0x7F	
	//special 0x114

	sound 0xC
	//setmaptile
	setmaptile 0xF 0xF 0x3A8 0x1
	setmaptile 0xF 0x10 0x3B0 0x1
	setmaptile 0xE 0x11 0x3AA 0x1
	setmaptile 0xF 0x11 0x3B8 0x1
	setmaptile 0x10 0x11 0x3B9 0x1
	setmaptile 0xE 0x12 0x3B2 0x1
	setmaptile 0xF 0x12 0x3C0 0x1
	setmaptile 0x10 0x12 0x3C1 0x1
	special 0x8e
	pause 0x25
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text12a MSG_NORMAL
	special 0x15A	
	spriteface 0x1 0x4
	pause 0x10
	spriteface 0xFF 0x3
	pause 0x1E
	showpokepic 0x3BA 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile0_text13 MSG_NORMAL
	special 0x15A		
	setflag 0x990
	setflag 0x991
	setflag 0x992
	setflag 0x11
	pause 0x1E
	fanfare 0x0102
	msgbox Risaia_Rosa_3_50_tile0_text14 MSG_NORMAL
	pause 0x1E
	msgbox Risaia_Rosa_3_50_tile0_text15 MSG_NORMAL
	spriteface 0xFF 0x2
	movesprite 0x2 0x0 0x0
	applymovement 0xFF Risaia_Rosa_3_50_tile0_mov7
	waitmovement 0xFF
	special 0x114
	releaseall
	end

Risaia_Rosa_3_50_tile0_mov1:
	.byte 0x11
	.byte 0x12
	.byte 0x1 
	.byte 0x1C
	.byte 0x63
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov2:
	.byte 0xD 
	.byte 0xD 
	.byte 0xD 
	.byte 0xD 
	.byte 0xD 
	.byte 0xD 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov3:
	.byte 0xC 
	.byte 0xC 
	.byte 0xC 
	.byte 0xC
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov4a:
	.byte 0x13
	.byte 0x0 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov4:
	.byte 0x10
	.byte 0x1 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov4b:
	.byte 0x12
	.byte 0x0 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov4c:
	.byte 0x12
	.byte 0x3
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov5:
	.byte 0x11
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov6:
	.byte 0x10
	.byte 0x3 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov3a:
	.byte 0xC 
	.byte 0xC 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov7:
	.byte 0x11
	.byte 0xFE

.global EventScript_Risaia_Rosa_3_50_tile1
EventScript_Risaia_Rosa_3_50_tile1:
	lockall
	showpokepic 0x3B6 0x0 0x6
	msgbox Risaia_Rosa_3_50_tile1_text1 MSG_NORMAL
	special 0x15A
	getplayerpos 0x4001 0x4002
	compare 0x4001 0xE
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_tile1_L
	compare 0x4001 0xF
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_tile1_D
	compare 0x4001 0x10
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_tile1_R
	releaseall
	end

	EventScript_Risaia_Rosa_3_50_tile1_L:
		applymovement 0xFF Risaia_Rosa_3_50_tile1_mov1
		waitmovement 0xFF		
		releaseall
		end

	EventScript_Risaia_Rosa_3_50_tile1_D:
		applymovement 0xFF Risaia_Rosa_3_50_tile1_mov2
		waitmovement 0xFF		
		releaseall
		end

	EventScript_Risaia_Rosa_3_50_tile1_R:
		applymovement 0xFF Risaia_Rosa_3_50_tile1_mov3
		waitmovement 0xFF		
		releaseall
		end

	Risaia_Rosa_3_50_tile1_mov1:
		.byte 0x13
		.byte 0xFE

	Risaia_Rosa_3_50_tile1_mov2:
		.byte 0x11
		.byte 0xFE

	Risaia_Rosa_3_50_tile1_mov3:
		.byte 0x12
		.byte 0xFE


//___SIGNs___

.global EventScript_Roccavento_3_50_Sign0
EventScript_Roccavento_3_50_Sign0:
	setvar 0x4067 0x2
	end