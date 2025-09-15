.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//LEVELS__________________

.global gMapScripts_Ardesiopoli_6_1
gMapScripts_Ardesiopoli_6_1:
	mapscript MAP_SCRIPT_ON_LOAD Ardesiopoli_6_1_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Ardesiopoli_6_1_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Ardesiopoli_6_1_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Ardesiopoli_6_1_MapScriptOnLoad:
		compare 0x4051 0x2F
		if 0x1 _call Ardesiopoli_6_1_MapScriptOnLoad_move_Filiberto0
		compare 0x4051 0x30
		if 0x1 _call Ardesiopoli_6_1_MapScriptOnLoad_move_Filiberto0
		compare 0x4051 0x31
		if 0x1 _call Ardesiopoli_6_1_MapScriptOnLoad_move_Filiberto1
		compare 0x4051 0x32
		if 0x1 _call Ardesiopoli_6_1_MapScriptOnLoad_behave_Filiberto2
		end

		Ardesiopoli_6_1_MapScriptOnLoad_move_Filiberto0:
			movesprite2 0x1 0x0A 0x09
			spritebehave 0x1 0x10
			return

		Ardesiopoli_6_1_MapScriptOnLoad_move_Filiberto1:
			movesprite2 0x1 0x0 0x0
			return

		Ardesiopoli_6_1_MapScriptOnLoad_behave_Filiberto2:
			spritebehave 0x1 0x8
			movesprite2 0x5 0x08 0x06
			spritebehave 0x5 0x8
			return

	Ardesiopoli_6_1_MapScriptOnWarpIntoMapTable:
	levelscript 0x4050, 9, Ardesiopoli_6_1_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN

	Ardesiopoli_6_1_MapScriptOnWarpIntoMapTableBegin:
		spriteface 0xFF 0x2
		end


	Ardesiopoli_6_1_MapScriptOnFrame:
		levelscript 0x4050, 9, Ardesiopoli_6_1_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Ardesiopoli_6_1_MapScriptOnFrameBegin:
			lockall
			showpokepic 0x3B8 0x0 0x6
			textcolor 0x0
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text1 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			spriteface 0x1 0x4
			showpokepic 0x3B8 0x0 0x6
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text2 MSG_NORMAL
			special 0x15A				
			spriteface 0x5 0x3
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text3 MSG_NORMAL
			pause 0x1E
			applymovement 0x5 Ardesiopoli_6_1_MapScriptOnFrame_mov1
			waitmovement 0x0
			spriteface 0x1 0x1 
			showpokepic 0x3B8 0x0 0x6
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text4 MSG_NORMAL
			special 0x15A	
			applymovement 0x1 Ardesiopoli_6_1_MapScriptOnFrame_mov2
			waitmovement 0x1 
			showpokepic 0x3B8 0x0 0x6
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text5 MSG_NORMAL
			special 0x15A
			pause 0x1E	
			applymovement 0x1 Ardesiopoli_6_1_MapScriptOnFrame_mov3
			waitmovement 0x1
			playsong 0x188 0x0
			showpokepic 0x3B8 0x0 0x6
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text6 MSG_NORMAL
			special 0x15A
			pause 0x1E			
			applymovement 0x1 Ardesiopoli_6_1_MapScriptOnFrame_mov4
			waitmovement 0x1 
			showpokepic 0x3B8 0x0 0x6
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text7 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0x1 Ardesiopoli_6_1_MapScriptOnFrame_mov5
			waitmovement 0x1 
			showpokepic 0x3B8 0x0 0x6
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text8 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			showpokepic 0x3B8 0x0 0x6
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text9 MSG_NORMAL
			special 0x15A				
			fadedefault
			pause 0x1E
			showpokepic 0x3B8 0x0 0x6
			msgbox Ardesiopoli_6_1_MapScriptOnFrame_text10 MSG_NORMAL
			special 0x15A
			setvar 0x4050 0xA
			setvar 0x4051 0x33
			setvar 0x4060 0x1
			setvar 0x4053 0x7
			releaseall
			end

			Ardesiopoli_6_1_MapScriptOnFrame_mov1:
				.byte 0x11
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x1 
				.byte 0xFE

			Ardesiopoli_6_1_MapScriptOnFrame_mov2:
				.byte 0x2
				.byte 0x1C
				.byte 0x63
				.byte 0x23
				.byte 0x23
				.byte 0x1C
				.byte 0x1C
				.byte 0x62
				.byte 0x1A
				.byte 0x11
				.byte 0x12
				.byte 0x0 
				.byte 0x1A
				.byte 0x65
				.byte 0xFE

			Ardesiopoli_6_1_MapScriptOnFrame_mov3:
				.byte 0x13
				.byte 0x10
				.byte 0xFE

			Ardesiopoli_6_1_MapScriptOnFrame_mov4:
				.byte 0x2 
				.byte 0x1C
				.byte 0x63
				.byte 0x1C
				.byte 0x0 
				.byte 0xFE

			Ardesiopoli_6_1_MapScriptOnFrame_mov5:
				.byte 0x65
				.byte 0xFE

//NPCS____________________

.global EventScript_Ardesiopoli_6_1_NPC0
EventScript_Ardesiopoli_6_1_NPC0:
	lock
	faceplayer
	checkflag 0x820
	if 0x1 _goto EventScript_Ardesiopoli_6_1_NPC0_P1
	applymovement 0x1 Ardesiopoli_6_1_NPC0_mov1
	waitmovement 0x1	
	showpokepic 0x3B8 0x0 0x6
	msgbox Ardesiopoli_6_1_NPC0_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	//getplayer pos
	getplayerpos 0x4001 0x4002
	compare 0x4001 0x09
	if 0x1 _call EventScript_Ardesiopoli_6_1_NPC0_R
	compare 0x4001 0x0A
	if 0x1 _call EventScript_Ardesiopoli_6_1_NPC0_D
	pause 0x1E
	showpokepic 0x3B8 0x0 0x6
	msgbox Ardesiopoli_6_1_NPC0_text2 MSG_NORMAL
	special 0x15A
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green	
	msgbox Ardesiopoli_6_1_NPC0_text3 MSG_NORMAL
	special 0x15A
	pause 0x1E	
	applymovement 0x1 Ardesiopoli_6_1_NPC0_mov1
	waitmovement 0x1
	spriteface 0x1 0x1
	pause 0x1E
	showpokepic 0x3B8 0x0 0x6
	msgbox Ardesiopoli_6_1_NPC0_text4 MSG_NORMAL
	special 0x15A
	setvar 0x4051 0x31
	setvar 0x4061 0x1
	setvar 0x4053 0x6
	warp 0x6 0x1 0xFF 0x07 0x07
	release
	end

	EventScript_Ardesiopoli_6_1_NPC0_R:
		applymovement 0x1 Ardesiopoli_6_1_NPC0_mov2
		applymovement 0xFF Ardesiopoli_6_1_NPC0_mov3
		waitmovement 0x0
		return

	EventScript_Ardesiopoli_6_1_NPC0_D:
		applymovement 0x1 Ardesiopoli_6_1_NPC0_mov2
		applymovement 0xFF Ardesiopoli_6_1_NPC0_mov4
		waitmovement 0x0
		return

	Ardesiopoli_6_1_NPC0_mov1:
		.byte 0x62
		.byte 0xFE

	Ardesiopoli_6_1_NPC0_mov2:
		.byte 0x12
		.byte 0x12
		.byte 0x11
		.byte 0x11
		.byte 0x12
		.byte 0x11
		.byte 0x0 
		.byte 0xFE

	Ardesiopoli_6_1_NPC0_mov3:
		.byte 0x10
		.byte 0x11
		.byte 0x12
		.byte 0x11
		.byte 0x11
		.byte 0x12
		.byte 0x1
		.byte 0xFE

	Ardesiopoli_6_1_NPC0_mov4:
		.byte 0x11
		.byte 0x12
		.byte 0x12
		.byte 0x11
		.byte 0x11
		.byte 0x12
		.byte 0x1
		.byte 0xFE

	EventScript_Ardesiopoli_6_1_NPC0_P1:
		showpokepic 0x3B8 0x0 0x6
		msgbox Ardesiopoli_6_1_NPC0_text5 MSG_NORMAL
		special 0x15A
		release 
		end


.global EventScript_Ardesiopoli_6_1_NPC1
EventScript_Ardesiopoli_6_1_NPC1:
	lock
	faceplayer
	msgbox Ardesiopoli_6_1_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_1_NPC2
EventScript_Ardesiopoli_6_1_NPC2:
	lock
	faceplayer
	msgbox Ardesiopoli_6_1_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_1_NPC3
EventScript_Ardesiopoli_6_1_NPC3:
	lock
	faceplayer
	msgbox Ardesiopoli_6_1_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_1_NPC4
EventScript_Ardesiopoli_6_1_NPC4:
	lock
	faceplayer
	msgbox Ardesiopoli_6_1_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_1_Sign0
EventScript_Ardesiopoli_6_1_Sign0:
	msgbox Ardesiopoli_6_1_Sign0_text1 0x7
	end

.global EventScript_Ardesiopoli_6_1_Sign1
EventScript_Ardesiopoli_6_1_Sign1:
	msgbox Ardesiopoli_6_1_Sign1_text1 0x7
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