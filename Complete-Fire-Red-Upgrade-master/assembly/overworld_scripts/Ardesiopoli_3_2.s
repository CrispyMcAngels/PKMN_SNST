.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//SIGNS___________________

	.global EventScript_Ardesiopoli_3_2_Sign0_4
	EventScript_Ardesiopoli_3_2_Sign0_4:
		msgbox Ardesiopoli_3_2_Sign0_4 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign1
	EventScript_Ardesiopoli_3_2_Sign1:
		msgbox Ardesiopoli_3_2_Sign1 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign2_3
	EventScript_Ardesiopoli_3_2_Sign2_3:
		msgbox Ardesiopoli_3_2_Sign2_3 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign6_7
	EventScript_Ardesiopoli_3_2_Sign6_7:
		msgbox Ardesiopoli_3_2_Sign6_7 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign8
	EventScript_Ardesiopoli_3_2_Sign8:
		msgbox Ardesiopoli_3_2_Sign8 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign9
	EventScript_Ardesiopoli_3_2_Sign9:
		msgbox Ardesiopoli_3_2_Sign9 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign10
	EventScript_Ardesiopoli_3_2_Sign10:
		msgbox Ardesiopoli_3_2_Sign10 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign11_14
	EventScript_Ardesiopoli_3_2_Sign11_14:
		msgbox Ardesiopoli_3_2_Sign11_14 0x7
		end


	.global EventScript_Ardesiopoli_3_2_Sign12
	EventScript_Ardesiopoli_3_2_Sign12:
		msgbox Ardesiopoli_3_2_Sign12 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign13
	EventScript_Ardesiopoli_3_2_Sign13:
		msgbox Ardesiopoli_3_2_Sign13 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign15
	EventScript_Ardesiopoli_3_2_Sign15:
		msgbox Ardesiopoli_3_2_Sign15 0x7
		end

	.global EventScript_Ardesiopoli_3_2_Sign16
	EventScript_Ardesiopoli_3_2_Sign16:
		msgbox Ardesiopoli_3_2_Sign16 0x7
		end

//LEVELS__________________

.global gMapScripts_Ardesiopoli_3_2
gMapScripts_Ardesiopoli_3_2:
	mapscript MAP_SCRIPT_ON_LOAD Ardesiopoli_3_2_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

	Ardesiopoli_3_2_MapScriptOnLoad:
		setworldmapflag 0x892
		sethealingplace 0x3
		setvar 0x5007 0x3
		compare 0x405F 0x1
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_girl
		compare 0x405F 0x2
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_trigger
		compare 0x405F 0x3
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_girl			
		compare 0x405F 0x4
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_fight_club
		compare 0x405F 0x5
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_fight_club
		compare 0x405F 0x6
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_shinx1
		compare 0x405F 0x7
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_shinx2		
		compare 0x405F 0x8
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_shinx2	
		compare 0x405F 0x9
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_girl
		compare 0x4060 0x2
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_oldman
		end		

		Ardesiopoli_3_2_MapScriptOnLoad_move_oldman:
			movesprite2 0x1D 0x18 0x41
			spritebehave 0x1D 0x2
			movesprite2 0x1E 0x18 0x40
			return

		Ardesiopoli_3_2_MapScriptOnLoad_move_girl:
			movesprite2 0x10 0x0A 0x41
			spritebehave 0x10 0x5
			return
			
		Ardesiopoli_3_2_MapScriptOnLoad_trigger:
			setvar 0x405F 0x9
			movesprite2 0x10 0x0A 0x41
			spritebehave 0x10 0x5
			return

		Ardesiopoli_3_2_MapScriptOnLoad_move_fight_club:
			movesprite2 0x10 0x0A 0x45
			spritebehave 0x10 0x8		
			movesprite2 0x11 0x0A 0x46
			spritebehave 0x11 0x7
			movesprite2 0x12 0x07 0x46
			spritebehave 0x12 0xA
			return

		Ardesiopoli_3_2_MapScriptOnLoad_move_shinx1:
			movesprite2 0x10 0x0A 0x45
			spritebehave 0x10 0x8		
			movesprite2 0x11 0x0A 0x46
			spritebehave 0x11 0x7
			movesprite2 0x12 0x07 0x46
			spritebehave 0x12 0xA
			movesprite2 0x14 0x08 0x25
			return

		Ardesiopoli_3_2_MapScriptOnLoad_move_shinx2:
			movesprite2 0x10 0x0A 0x45
			spritebehave 0x10 0x8		
			movesprite2 0x11 0x0A 0x46
			spritebehave 0x11 0x7
			movesprite2 0x12 0x07 0x46
			spritebehave 0x12 0xA
			return

			
//TILES___________________

.global EventScript_Ardesiopoli_3_2_tile6
EventScript_Ardesiopoli_3_2_tile6:
	lockall
	playsong 0x112 0x0
	textcolor 0x1
	msgbox Ardesiopoli_3_2_tile6_text1 MSG_NORMAL
	getplayerpos 0x4001 0x4002

	compare 0x4001 0x15
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_16a
	
	compare 0x4001 0x16
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_17a
	
	compare 0x4001 0x17
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_18a
	
	getplayerpos 0x4001 0x4002 
	compare 0x4001 0x15
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_mid15
	compare 0x4001 0x16
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_mid16
	compare 0x4001 0x17
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_mid16
	hidesprite 0x1C
	pause 0x1E
	applymovement 0xFF Ardesiopoli_3_2_tile6_mov4
	waitmovement 0xFF
	pause 0x1E
	compare 0x4001 0x15
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_16b
	compare 0x4001 0x16
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_17b
	compare 0x4001 0x17
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile6_18b
	spriteface 0xFF 0x1
	fadedefault
	pause 0x1E
	textcolor 0x1
	msgbox Ardesiopoli_3_2_tile6_text2 MSG_NORMAL
	fanfare 0x0102
	textcolor 0x2
	msgbox Mission_Received_text1 MSG_NORMAL
	setvar 0x4060 0x2
	setflag 0x96B
	releaseall
	end

	EventScript_Ardesiopoli_3_2_tile6_mid15:
		applymovement 0xFF Ardesiopoli_3_2_tile6_mov2
		applymovement 0x1C Ardesiopoli_3_2_tile6_mov3a
		waitmovement 0x0	
		return

	EventScript_Ardesiopoli_3_2_tile6_mid16:
		applymovement 0xFF Ardesiopoli_3_2_tile6_mov2
		applymovement 0x1C Ardesiopoli_3_2_tile6_mov3
		waitmovement 0x0	
		return

	EventScript_Ardesiopoli_3_2_tile6_16a:
		movesprite 0x1C 0x15 0x4C
		applymovement 0x1C Ardesiopoli_3_2_tile6_mov1
		waitmovement 0x1C
		return

	EventScript_Ardesiopoli_3_2_tile6_17a:
		movesprite 0x1C 0x16 0x4C
		applymovement 0x1C Ardesiopoli_3_2_tile6_mov1
		waitmovement 0x1C
		return

	EventScript_Ardesiopoli_3_2_tile6_18a:
		movesprite 0x1C 0x16 0x4C
		applymovement 0x1C Ardesiopoli_3_2_tile6_mov1a
		waitmovement 0x0
		return

	EventScript_Ardesiopoli_3_2_tile6_16b:
		movesprite 0x1D 0x15 0x4C
		applymovement 0x1D Ardesiopoli_3_2_tile6_mov5
		waitmovement 0x0
		return

	EventScript_Ardesiopoli_3_2_tile6_17b:
		movesprite 0x1D 0x16 0x4C
		applymovement 0x1D Ardesiopoli_3_2_tile6_mov5
		waitmovement 0x0
		return

	EventScript_Ardesiopoli_3_2_tile6_18b:
		movesprite 0x1D 0x16 0x4C
		applymovement 0x1D Ardesiopoli_3_2_tile6_mov5a
		waitmovement 0x0
		return


	Ardesiopoli_3_2_tile6_mov1:
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0xFE

	Ardesiopoli_3_2_tile6_mov1a:
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x20
		.byte 0x1E
		.byte 0x1E
		.byte 0xFE

	Ardesiopoli_3_2_tile6_mov2:
		.byte 0x62
		.byte 0x1F
		.byte 0x3 
		.byte 0xFE

	Ardesiopoli_3_2_tile6_mov3a:		
		.byte 0x1E
		.byte 0x20	
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0xFE

	Ardesiopoli_3_2_tile6_mov3:		
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0xFE

	Ardesiopoli_3_2_tile6_mov4:	
		.byte 0x13
		.byte 0x1 
		.byte 0x1C
		.byte 0x63
		.byte 0xFE

	Ardesiopoli_3_2_tile6_mov5:
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x62
		.byte 0xFE

	Ardesiopoli_3_2_tile6_mov5a:
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x13
		.byte 0x1E
		.byte 0x62
		.byte 0xFE



.global EventScript_Ardesiopoli_3_2_tile5
EventScript_Ardesiopoli_3_2_tile5:
	lockall
	//prima interazione
	playsong 0x11D
	compare 0x405F 0x2 
	if 0x1 _goto EventScript_Ardesiopoli_3_2_tile5_P2a
	compare 0x405F 0x9 
	if 0x1 _goto EventScript_Ardesiopoli_3_2_tile5_P2
	compare 0x405F 0x3
	if 0x1 _goto EventScript_Ardesiopoli_3_2_tile5_P3
	applymovement 0x11 Ardesiopoli_3_2_tile5_mov1
	applymovement 0x12 Ardesiopoli_3_2_tile5_mov2
	waitmovement 0x0
	textcolor 0x0
	msgbox Ardesiopoli_3_2_tile5_text1 MSG_NORMAL
	pause 0x1E
	setvar 0x405F 0x2
	msgbox Ardesiopoli_3_2_tile5_text2 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Ardesiopoli_3_2_tile5_P1
	if 0x0 _goto EventScript_Ardesiopoli_3_2_tile5_P0
	closeonkeypress
	releaseall
	end

	Ardesiopoli_3_2_tile5_mov1:
		.byte 0x1 
		.byte 0x1B
		.byte 0x62
		.byte 0x1E
		.byte 0x20
		.byte 0x1E
		.byte 0x2 
		.byte 0xFE

	Ardesiopoli_3_2_tile5_mov2:
		.byte 0x1 
		.byte 0x1B
		.byte 0x62
		.byte 0x1E
		.byte 0x20
		.byte 0x1
		.byte 0xFE

	EventScript_Ardesiopoli_3_2_tile5_P0:
		closeonkeypress
		fadedefault
		textcolor 0x0
		msgbox Ardesiopoli_3_2_tile5_text0 MSG_NORMAL
		releaseall
		end

	EventScript_Ardesiopoli_3_2_tile5_P1:
		applymovement 0x11 Ardesiopoli_3_2_tile5_mov3
		applymovement 0x12 Ardesiopoli_3_2_tile5_mov4
		applymovement 0xFF Ardesiopoli_3_2_tile5_mov5
		waitmovement 0x0
		textcolor 0x0		
		trainerbattle1 0x1 0x20 0x0 Ardesiopoli_3_2_tile5_text3 Ardesiopoli_3_2_tile5_text4 EventScript_Ardesiopoli_3_2_tile5_P1_2
		releaseall
		end

	EventScript_Ardesiopoli_3_2_tile5_P1_2:
		closeonkeypress
		pause 0x1E
		setvar 0x405F 0x3
		pause 0x1E
		applymovement 0x11 Ardesiopoli_3_2_tile5_mov6
		applymovement 0x12 Ardesiopoli_3_2_tile5_mov7		
		waitmovement 0x0 
		textcolor 0x0
		trainerbattle1 0x1 0x21 0x0 Ardesiopoli_3_2_tile5_text5 Ardesiopoli_3_2_tile5_text6 EventScript_Ardesiopoli_3_2_tile5_P4
		releaseall
		end

		Ardesiopoli_3_2_tile5_mov3:
			.byte 0x10
			.byte 0x13
			.byte 0x2 
			.byte 0xFE

		Ardesiopoli_3_2_tile5_mov4:
			.byte 0x10
			.byte 0x10
			.byte 0x1 
			.byte 0xFE

		Ardesiopoli_3_2_tile5_mov5:
			.byte 0x10
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x3 
			.byte 0xFE

		Ardesiopoli_3_2_tile5_mov6:
			.byte 0x11
			.byte 0x12
			.byte 0x0 
			.byte 0xFE

		Ardesiopoli_3_2_tile5_mov7:
			.byte 0x13
			.byte 0x13
			.byte 0x11
			.byte 0x11
			.byte 0x2 
			.byte 0xFE

	EventScript_Ardesiopoli_3_2_tile5_P2a:
		applymovement 0x11 Ardesiopoli_3_2_tile5_mov1a
		applymovement 0x12 Ardesiopoli_3_2_tile5_mov1a
		waitmovement 0x0
		textcolor 0x0
		msgbox Ardesiopoli_3_2_tile5_text8 MSG_NORMAL
		pause 0x1E
		setvar 0x405F 0x2
		msgbox Ardesiopoli_3_2_tile5_text2 MSG_YESNO
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Ardesiopoli_3_2_tile5_P1
		if 0x0 _goto EventScript_Ardesiopoli_3_2_tile5_P0
		releaseall
		end

		Ardesiopoli_3_2_tile5_mov1a:
			.byte 0x62
			.byte 0xFE


	EventScript_Ardesiopoli_3_2_tile5_P2:
		applymovement 0x11 Ardesiopoli_3_2_tile5_mov1
		applymovement 0x12 Ardesiopoli_3_2_tile5_mov2
		waitmovement 0x0
		textcolor 0x0
		msgbox Ardesiopoli_3_2_tile5_text8 MSG_NORMAL
		pause 0x1E
		msgbox Ardesiopoli_3_2_tile5_text2 MSG_YESNO
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Ardesiopoli_3_2_tile5_P1
		if 0x0 _goto EventScript_Ardesiopoli_3_2_tile5_P0
		setvar 0x405F 0x2
		releaseall
		end

	EventScript_Ardesiopoli_3_2_tile5_P3:	
		applymovement 0x11 Ardesiopoli_3_2_tile5_mov8
		applymovement 0x12 Ardesiopoli_3_2_tile5_mov9
		applymovement 0xFF Ardesiopoli_3_2_tile5_mov5
		waitmovement 0x0	
		textcolor 0x0	
		trainerbattle1 0x1 0x21 0x0 Ardesiopoli_3_2_tile5_text5 Ardesiopoli_3_2_tile5_text6 EventScript_Ardesiopoli_3_2_tile5_P4
		releaseall
		end

		Ardesiopoli_3_2_tile5_mov8:
			.byte 0x10
			.byte 0x1 
			.byte 0xFE

		Ardesiopoli_3_2_tile5_mov9:
			.byte 0x11
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x11
			.byte 0x2 
			.byte 0xFE

	EventScript_Ardesiopoli_3_2_tile5_P4:
		pause 0x1E
		applymovement 0xFF Ardesiopoli_3_2_tile5_movCAM1
		waitmovement 0x0
		textcolor 0x0
		compare 0x501F 0x100
		if 0x1 _call Player_Blue
		compare 0x501F 0x1A3
		if 0x1 _call Player_Orange
		compare 0x501F 0x1A4
		if 0x1 _call Player_Green		
		msgbox Ardesiopoli_3_2_tile5_text7 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x12 Ardesiopoli_3_2_tile5_mov1a
		waitmovement 0x0
		msgbox Ardesiopoli_3_2_tile5_text9 MSG_NORMAL
		setvar 0x405F 0x4
		setvar 0x4052 0x5
		releaseall
		end

	Ardesiopoli_3_2_tile5_movCAM1:
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0xFE

.global EventScript_Ardesiopoli_3_2_tile0
EventScript_Ardesiopoli_3_2_tile0:
	lockall
	playsong 0x13C 0x0
	getplayerpos 0x4001 0x4002
	compare 0x4002 0x2D
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile0_UP
	compare 0x4002 0x2E
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile0_DOWN
	pause 0x1E
	textcolor 0x01
	showpokepic 0x3B5 0x0 0x6
	msgbox Ardesiopoli_3_2_tile0_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	//trainerbattle
	setvar 0x503A 0x2 
	setvar 0x503B 0x0
	//trainer id to be fixed
	trainerbattle3 0x3 0x19 0x100 Ardesiopoli_3_2_tile0_text2
	fadedefault
	pause 0x1E
	applymovement 0x2 Ardesiopoli_3_2_tile0_mov2
	waitmovement 0x2
	pause 0x1E
	textcolor 0x01
	showpokepic 0x3B5 0x0 0x6
	msgbox Ardesiopoli_3_2_tile0_text3 MSG_NORMAL
	special 0x15A
	pause 0x1E
	pause 0x1E
	showpokepic 0x3B5 0x0 0x6
	compare 0x4051 0x31
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile0_P1_1
	if 0x0 _call EventScript_Ardesiopoli_3_2_tile0_P1_2
	special 0x15A
	pause 0x1E
	applymovement 0x2 Ardesiopoli_3_2_tile0_mov3
	waitmovement 0x2	
	pause 0x1E
	showpokepic 0x3B5 0x0 0x6
	compare 0x4051 0x31
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile0_P2_1
	if 0x0 _call EventScript_Ardesiopoli_3_2_tile0_P2_2
	special 0x15A
	pause 0x1E
	playsong 0x13C 0x0
	compare 0x4002 0x2D
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile0_UP2
	compare 0x4002 0x2E
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile0_DOWN2
	movesprite2 0x2 0x0 0x0
	movesprite 0x2 0x0 0x0
	setflag 0x50
	setvar 0x4051 0x30
	setvar 0x4062 0x1
	fadedefault
	releaseall
	end

		EventScript_Ardesiopoli_3_2_tile0_P1_1:
			msgbox Ardesiopoli_3_2_tile0_text4b MSG_NORMAL
			return

		EventScript_Ardesiopoli_3_2_tile0_P1_2:
			msgbox Ardesiopoli_3_2_tile0_text4a MSG_NORMAL
			return

		EventScript_Ardesiopoli_3_2_tile0_P2_1:
			msgbox Ardesiopoli_3_2_tile0_text5b MSG_NORMAL
			return

		EventScript_Ardesiopoli_3_2_tile0_P2_2:
			msgbox Ardesiopoli_3_2_tile0_text5a MSG_NORMAL
			return

		EventScript_Ardesiopoli_3_2_tile0_UP:
			applymovement 0x2 Ardesiopoli_3_2_tile0_mov1
			waitmovement 0x2
			return

		EventScript_Ardesiopoli_3_2_tile0_DOWN:
			applymovement 0x2 Ardesiopoli_3_2_tile0_mov1a
			waitmovement 0x2
			return		

			Ardesiopoli_3_2_tile0_mov1:
				.byte 0x2 
				.byte 0x1B
				.byte 0x62
				.byte 0x12
				.byte 0x12
				.byte 0xFE

			Ardesiopoli_3_2_tile0_mov1a:
				.byte 0x2 
				.byte 0x1B
				.byte 0x62
				.byte 0x12
				.byte 0x10
				.byte 0x12
				.byte 0xFE

			Ardesiopoli_3_2_tile0_mov2:
				.byte 0x62 
				.byte 0xFE

			Ardesiopoli_3_2_tile0_mov3:
				.byte 0x63
				.byte 0xFE

		EventScript_Ardesiopoli_3_2_tile0_UP2:
			applymovement 0x2 Ardesiopoli_3_2_tile0_mov4
			waitmovement 0x2
			return

		EventScript_Ardesiopoli_3_2_tile0_DOWN2:
			applymovement 0x2 Ardesiopoli_3_2_tile0_mov4a
			waitmovement 0x2
			return	

			Ardesiopoli_3_2_tile0_mov4:
				.byte 0x10
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x10
				.byte 0x12
				.byte 0x10
				.byte 0x12
				.byte 0x12
				.byte 0x11
				.byte 0x11
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x60
				.byte 0xFE

			Ardesiopoli_3_2_tile0_mov4a:
				.byte 0x11
				.byte 0x12
				.byte 0x12
				.byte 0x10
				.byte 0x12
				.byte 0x12
				.byte 0x10
				.byte 0x12
				.byte 0x10
				.byte 0x12
				.byte 0x12
				.byte 0x11
				.byte 0x11
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x60
				.byte 0xFE

.global EventScript_Ardesiopoli_3_2_tile2
EventScript_Ardesiopoli_3_2_tile2:
	lockall
	getplayerpos 0x4001 0x4002
	compare 0x4001 0x15
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile2_P0_15
	compare 0x4001 0x16
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile2_P0_16
	compare 0x4001 0x17
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile2_P0_17
	pause 0x1E
	textcolor 0x0
	msgbox Ardesiopoli_3_2_NPC6_text1 MSG_NORMAL
	pause 0x1E
	getplayerpos 0x4001 0x4002
	compare 0x4001 0x15
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile2_P1_15
	compare 0x4001 0x16
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile2_P1_16
	compare 0x4001 0x17
	if 0x1 _call EventScript_Ardesiopoli_3_2_tile2_P1_17	
	releaseall
	end


	EventScript_Ardesiopoli_3_2_tile2_P0_15:
		applymovement 0x7 Ardesiopoli_3_2_tile2_mov1_15
		applymovement 0xFF Ardesiopoli_3_2_tile2_mov2_15
		waitmovement 0x0
		return

		Ardesiopoli_3_2_tile2_mov1_15:
			.byte 0x1 
			.byte 0x62
			.byte 0x13
			.byte 0x11
			.byte 0xFE

		Ardesiopoli_3_2_tile2_mov2_15:
			.byte 0x1C
			.byte 0x1B
			.byte 0x1E
			.byte 0x0 
			.byte 0xFE

	EventScript_Ardesiopoli_3_2_tile2_P0_16:
		applymovement 0x7 Ardesiopoli_3_2_tile2_mov1_16
		applymovement 0xFF Ardesiopoli_3_2_tile2_mov2_16
		waitmovement 0x0
		return		

		Ardesiopoli_3_2_tile2_mov1_16:
			.byte 0x1 
			.byte 0x62
			.byte 0x13
			.byte 0x13
			.byte 0x11
			.byte 0xFE

		Ardesiopoli_3_2_tile2_mov2_16:
			.byte 0x1C
			.byte 0x1C
			.byte 0x1B
			.byte 0x1E
			.byte 0x0 
			.byte 0xFE

	EventScript_Ardesiopoli_3_2_tile2_P0_17:
		applymovement 0x7 Ardesiopoli_3_2_tile2_mov1_17
		applymovement 0xFF Ardesiopoli_3_2_tile2_mov2_17
		waitmovement 0x0
		return	

		Ardesiopoli_3_2_tile2_mov1_17:
			.byte 0x1 
			.byte 0x62
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x11
			.byte 0xFE

		Ardesiopoli_3_2_tile2_mov2_17:
			.byte 0x1C
			.byte 0x1C
			.byte 0x1C
			.byte 0x1B
			.byte 0x1E
			.byte 0x0 
			.byte 0xFE

EventScript_Ardesiopoli_3_2_tile2_P1_15:
		applymovement 0x7 Ardesiopoli_3_2_tile2_mov3_15
		waitmovement 0x7
		return

		Ardesiopoli_3_2_tile2_mov3_15:
			.byte 0x10
			.byte 0x12
			.byte 0x3 
			.byte 0xFE

EventScript_Ardesiopoli_3_2_tile2_P1_16:
		applymovement 0x7 Ardesiopoli_3_2_tile2_mov3_16
		waitmovement 0x7
		return

		Ardesiopoli_3_2_tile2_mov3_16:
			.byte 0x10
			.byte 0x12
			.byte 0x12
			.byte 0x3 
			.byte 0xFE

EventScript_Ardesiopoli_3_2_tile2_P1_17:
		applymovement 0x7 Ardesiopoli_3_2_tile2_mov3_17
		waitmovement 0x7
		return

		Ardesiopoli_3_2_tile2_mov3_17:
			.byte 0x10
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x3 
			.byte 0xFE



//NPCS____________________

.global EventScript_Ardesiopoli_3_2_NPC0
EventScript_Ardesiopoli_3_2_NPC0:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC0_text1 MSG_NORMAL
	release
	end


.global EventScript_Ardesiopoli_3_2_NPC2
EventScript_Ardesiopoli_3_2_NPC2:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC3
EventScript_Ardesiopoli_3_2_NPC3:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC4
EventScript_Ardesiopoli_3_2_NPC4:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC6
EventScript_Ardesiopoli_3_2_NPC6:
	lock
	faceplayer
	checkflag 0x820
	if 0x1 _goto EventScript_Ardesiopoli_3_2_NPC6_P1
	msgbox Ardesiopoli_3_2_NPC6_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_3_2_NPC6_P1:
		msgbox Ardesiopoli_3_2_NPC6_text2 MSG_NORMAL
		release
		end

.global EventScript_Ardesiopoli_3_2_NPC7
EventScript_Ardesiopoli_3_2_NPC7:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC7_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC8
EventScript_Ardesiopoli_3_2_NPC8:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC8_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC9
EventScript_Ardesiopoli_3_2_NPC9:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC9_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC10
EventScript_Ardesiopoli_3_2_NPC10:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC10_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC11
EventScript_Ardesiopoli_3_2_NPC11:
	lock
	faceplayer
	cry 0xAF 0x0
	msgbox Ardesiopoli_3_2_NPC11_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC14
EventScript_Ardesiopoli_3_2_NPC14:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC14_text1 MSG_NORMAL
	release
	end



.global EventScript_Ardesiopoli_3_2_NPC15
EventScript_Ardesiopoli_3_2_NPC15:
	lock
	faceplayer
	compare 0x405F 0x0
	if 0x1 _goto EventScript_Ardesiopoli_3_2_NPC15_P0
	compare 0x405F 0x4
	if 0x4 _goto EventScript_Ardesiopoli_3_2_NPC15_P1
	msgbox Ardesiopoli_3_2_NPC15_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_3_2_NPC15_P0:
		msgbox Ardesiopoli_3_2_NPC15_text0 MSG_NORMAL
		release
		end

	EventScript_Ardesiopoli_3_2_NPC15_P1:
		msgbox Ardesiopoli_3_2_NPC15_text2 MSG_NORMAL
		release
		end

.global EventScript_Ardesiopoli_3_2_NPC16
EventScript_Ardesiopoli_3_2_NPC16:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC16_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC17
EventScript_Ardesiopoli_3_2_NPC17:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC17_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC18
EventScript_Ardesiopoli_3_2_NPC18:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC18_text1 MSG_NORMAL
	release
	end

//______________________________________________

.global EventScript_Ardesiopoli_3_2_NPC19
EventScript_Ardesiopoli_3_2_NPC19:
	lock
	faceplayer
	compare 0x405F 0x7
	if 0x1 _goto EventScript_Ardesiopoli_3_2_NPC19_P1
	compare 0x405F 0x8
	if 0x1 _goto EventScript_Ardesiopoli_3_2_NPC19_P1
	cry 0x1c8 0x0
	applymovement 0x14 Ardesiopoli_3_2_NPC19_mov1
	waitmovement 0x14
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	textcolor 0x0	
	msgbox Ardesiopoli_3_2_NPC19_text1 MSG_NORMAL	
	special 0x15A
	setvar 0x405F 0x7
	setvar 0x4050 0x8
	warpmuted 0x6 0xB 0xFF 0x08 0x07
	release
	end

	Ardesiopoli_3_2_NPC19_mov1:
		.byte 0x62
		.byte 0xFE

	EventScript_Ardesiopoli_3_2_NPC19_P1:
		cry 0x1c8 0x0
		msgbox Ardesiopoli_3_2_NPC19_text2 MSG_NORMAL
		release
		end

.global EventScript_Ardesiopoli_3_2_NPC20
EventScript_Ardesiopoli_3_2_NPC20:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC20_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC21
EventScript_Ardesiopoli_3_2_NPC21:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC21_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC22
EventScript_Ardesiopoli_3_2_NPC22:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC22_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_3_2_NPC23
EventScript_Ardesiopoli_3_2_NPC23:
	giveitem 0x17 0x1 MSG_FIND
	end

.global EventScript_Ardesiopoli_3_2_NPC24
EventScript_Ardesiopoli_3_2_NPC24:
	giveitem 0x1A 0x1 MSG_FIND
	end

.global EventScript_Ardesiopoli_3_2_NPC25
EventScript_Ardesiopoli_3_2_NPC25:
	giveitem 0x14B 0x1 MSG_FIND
	end

.global EventScript_Ardesiopoli_3_2_NPC26
EventScript_Ardesiopoli_3_2_NPC26:
	giveitem 0x22 0x1 MSG_FIND
	end

.global EventScript_Ardesiopoli_3_2_NPC28
EventScript_Ardesiopoli_3_2_NPC28:
	lock
	faceplayer
	msgbox Ardesiopoli_3_2_NPC28_text1 MSG_NORMAL
	release
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