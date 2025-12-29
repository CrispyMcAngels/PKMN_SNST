.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___LEVEL___

.global gMapScripts_Radiantia_8_9
gMapScripts_Radiantia_8_9:
	mapscript MAP_SCRIPT_ON_LOAD Radiantia_8_9_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

		Radiantia_8_9_MapScriptOnLoad:
			checkflag 0x971
			if 0x1 _call Radiantia_8_9_MapScriptOnLoad_1
			end

		Radiantia_8_9_MapScriptOnLoad_1:
			movesprite2 0x2 0x05 0x7
			spritebehave 0x2 0x1
			return


//___SIGNs___

.global EventScript_Radiantia_8_9_Sign0
EventScript_Radiantia_8_9_Sign0:
	msgbox Radiantia_8_9_Sign0_text1 0x7
	end

.global EventScript_Radiantia_8_9_Sign1
EventScript_Radiantia_8_9_Sign1:
	msgbox Radiantia_8_9_Sign1_text1 0x7
	end

//___NPCs___


.global EventScript_Radiantia_8_9_NPC0
EventScript_Radiantia_8_9_NPC0:
	lock
	faceplayer
	cry 0xC6 0x0
	msgbox Radiantia_8_5_NPC0_text1 MSG_NORMAL	
	getplayerpos 0x4001 0x4002
	compare 0x4002 0x05
	if 0x1 _call EventScript_Radiantia_8_9_NPC0_U
	compare 0x4002 0x07
	if 0x1 _call EventScript_Radiantia_8_9_NPC0_R
	applymovement 0x1 Radiantia_8_9_NPC0_mov1a
	waitmovement 0x0
	movesprite 0x1 0x0 0x0
	movesprite2 0x1 0x0 0x0
	sound 0x9
	pause 0x1E
	spriteface 0xFF 0x4
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	msgbox Radiantia_8_9_NPC0_text1 MSG_NORMAL
	special 0x15A
	pause 0x22
	sound 0x1E
	movesprite 0x2 0x07 0x06
	applymovement 0x2 Radiantia_8_9_NPC0_mov2a
	waitmovement 0x2
	pause 0x1E
	msgbox Radiantia_8_9_NPC0_text2 MSG_NORMAL
	pause 0x1E
	msgbox Radiantia_8_9_NPC0_text3 MSG_NORMAL
	pause 0x1E
	fanfare 0x0103
	textcolor 0x2
	msgbox Mission_Completed_text1 MSG_NORMAL
	setflag 0x971
	textcolor 0x0
	msgbox Radiantia_8_9_NPC0_text4 MSG_NORMAL	
	giveitem 0x44 0x1 MSG_OBTAIN
	release
	end

	Radiantia_8_9_NPC0_mov1a:
		.byte 0x65
		.byte 0x55
		.byte 0x55
		.byte 0x55
		.byte 0x1D
		.byte 0x20
		.byte 0x20
		.byte 0x1E
		.byte 0x60
		.byte 0xFE

	Radiantia_8_9_NPC0_mov2a:
		.byte 0x10
		.byte 0x12
		.byte 0x1 
		.byte 0xFE

	EventScript_Radiantia_8_9_NPC0_U:
		applymovement 0x1 Radiantia_8_9_NPC0_mov1b
		waitmovement 0x0
		movesprite 0x1 0x0 0x0
		movesprite2 0x1 0x0 0x0
		sound 0x9
		pause 0x1E
		pause 0x1E
		compare 0x501F 0x100
		if 0x1 _call Player_Blue
		compare 0x501F 0x1A3
		if 0x1 _call Player_Orange
		compare 0x501F 0x1A4
		if 0x1 _call Player_Green
		msgbox Radiantia_8_9_NPC0_text1 MSG_NORMAL
		special 0x15A
		pause 0x22
		sound 0x1E
		movesprite 0x2 0x07 0x06
		applymovement 0x2 Radiantia_8_9_NPC0_mov3b
		waitmovement 0x2
		spriteface 0xFF 0x1
		pause 0x1E
		msgbox Radiantia_8_9_NPC0_text2 MSG_NORMAL
		pause 0x1E
		msgbox Radiantia_8_9_NPC0_text3 MSG_NORMAL
		pause 0x1E
		fanfare 0x0103
		textcolor 0x2
		msgbox Mission_Completed_text1 MSG_NORMAL
		setflag 0x971
		textcolor 0x0
		msgbox Radiantia_8_9_NPC0_text4 MSG_NORMAL	
		giveitem 0x44 0x1 MSG_OBTAIN
		release
		end		

		Radiantia_8_9_NPC0_mov3b:
			.byte 0x12
			.byte 0x12
			.byte 0x1 
			.byte 0xFE


	EventScript_Radiantia_8_9_NPC0_R:
		applymovement 0x1 Radiantia_8_9_NPC0_mov1b
		waitmovement 0x0
		movesprite 0x1 0x0 0x0
		movesprite2 0x1 0x0 0x0
		sound 0x9
		pause 0x1E
		spriteface 0xFF 0x4
		pause 0x1E
		compare 0x501F 0x100
		if 0x1 _call Player_Blue
		compare 0x501F 0x1A3
		if 0x1 _call Player_Orange
		compare 0x501F 0x1A4
		if 0x1 _call Player_Green
		msgbox Radiantia_8_9_NPC0_text1 MSG_NORMAL
		special 0x15A
		pause 0x22
		sound 0x1E
		movesprite 0x2 0x07 0x06
		applymovement 0x2 Radiantia_8_9_NPC0_mov2b
		waitmovement 0x2
		spriteface 0xFF 0x1
		pause 0x1E
		msgbox Radiantia_8_9_NPC0_text2 MSG_NORMAL
		pause 0x1E
		msgbox Radiantia_8_9_NPC0_text3 MSG_NORMAL
		pause 0x1E
		fanfare 0x0103
		textcolor 0x2
		msgbox Mission_Completed_text1 MSG_NORMAL
		setflag 0x971
		textcolor 0x0
		msgbox Radiantia_8_9_NPC0_text4 MSG_NORMAL	
		giveitem 0x44 0x1 MSG_OBTAIN
		release
		end

		Radiantia_8_9_NPC0_mov1b:
			.byte 0x65
			.byte 0x55
			.byte 0x55
			.byte 0x55
			.byte 0x20
			.byte 0x20
			.byte 0x60
			.byte 0xFE

		Radiantia_8_9_NPC0_mov2b:
			.byte 0x10
			.byte 0x12
			.byte 0xFE

.global EventScript_Radiantia_8_9_NPC1
EventScript_Radiantia_8_9_NPC1:
	lock
	faceplayer
	msgbox Radiantia_8_9_NPC1_text1 MSG_NORMAL
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