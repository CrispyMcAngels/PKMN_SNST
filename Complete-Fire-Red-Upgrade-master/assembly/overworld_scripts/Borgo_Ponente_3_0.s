.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Borgo_Ponente_Sign0
EventScript_Borgo_Ponente_Sign0:
	msgbox Borgo_Ponente_Sign0 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_Sign1
EventScript_Borgo_Ponente_Sign1:
	msgbox Borgo_Ponente_Sign1 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_Sign2
EventScript_Borgo_Ponente_Sign2:
	msgbox Borgo_Ponente_Sign2 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_Sign3
EventScript_Borgo_Ponente_Sign3:
	msgbox Borgo_Ponente_Sign3 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_Sign4
EventScript_Borgo_Ponente_Sign4:
	msgbox Borgo_Ponente_Sign4 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_Sign5
EventScript_Borgo_Ponente_Sign5:
	msgbox Borgo_Ponente_Sign5 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_Sign6
EventScript_Borgo_Ponente_Sign6:
	msgbox Borgo_Ponente_Sign6 MSG_SIGN
	end

.global EventScript_Borgo_Ponente_OakDoor
EventScript_Borgo_Ponente_OakDoor:
	compare 0x4051 0xD
	if 0x1 _call EventScript_Borgo_Ponente_OakDoor_P1
	compare 0x4051 0xE
	if 0x1 _call EventScript_Borgo_Ponente_OakDoor_P1
	compare 0x4051 0xF
	if 0x1 _call EventScript_Borgo_Ponente_OakDoor_P1
	compare 0x4051 0x10
	if 0x1 _call EventScript_Borgo_Ponente_OakDoor_P1
	end

	EventScript_Borgo_Ponente_OakDoor_P1:
		msgbox Borgo_Ponente_OakDoot_text1 MSG_SIGN
		end

.global EventScript_Borgo_Ponente_3_0_tile0
EventScript_Borgo_Ponente_3_0_tile0:
	lockall
	compare 0x4051 0xE
	if 0x1 _call EventScript_Borgo_Ponente_3_0_tile0_P1
	compare 0x4051 0x12
	if 0x1 _call EventScript_Borgo_Ponente_3_0_tile0_P2
	releaseall
	end

	EventScript_Borgo_Ponente_3_0_tile0_P1:
		showpokepic 0x3B6 0x0 0x6
		msgbox EventScript_Borgo_Ponente_3_0_tile0_P1_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0xFF EventScript_Borgo_Ponente_3_0_tile0_P1_mov0
		waitmovement 0x0
		releaseall
		end

		EventScript_Borgo_Ponente_3_0_tile0_P1_mov0:
			.byte 0x10
			.byte 0xFE

	EventScript_Borgo_Ponente_3_0_tile0_P2:
		showpokepic 0x3B6 0x0 0x6
		msgbox EventScript_Borgo_Ponente_3_0_tile0_P1_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0xFF EventScript_Borgo_Ponente_3_0_tile0_P1_mov0
		waitmovement 0x0
		releaseall
		end

.global EventScript_Borgo_Ponente_3_0_tile1
EventScript_Borgo_Ponente_3_0_tile1:
	lockall
	compare 0x4051 0xE
	if 0x1 _call EventScript_Borgo_Ponente_3_0_tile1_P1
	compare 0x4051 0xF
	if 0x1 _call EventScript_Borgo_Ponente_3_0_tile1_P1
	releaseall
	end

	EventScript_Borgo_Ponente_3_0_tile1_P1:
		showpokepic 0x3B6 0x0 0x6
		msgbox EventScript_Borgo_Ponente_3_0_tile0_P1_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0xFF EventScript_Borgo_Ponente_3_0_tile1_P1_mov0
		waitmovement 0x0
		releaseall
		end

		EventScript_Borgo_Ponente_3_0_tile1_P1_mov0:
			.byte 0x12
			.byte 0xFE

.global EventScript_Borgo_Ponente_3_0_tile2
EventScript_Borgo_Ponente_3_0_tile2:
	lockall
	compare 0x4051 0xE
	if 0x1 _call EventScript_Borgo_Ponente_3_0_tile2_P1
	compare 0x4051 0x12
	if 0x1 _call EventScript_Borgo_Ponente_3_0_tile2_P2
	releaseall
	end

	EventScript_Borgo_Ponente_3_0_tile2_P1:
		showpokepic 0x3B6 0x0 0x6
		msgbox EventScript_Borgo_Ponente_3_0_tile0_P1_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0xFF EventScript_Borgo_Ponente_3_0_tile1_P1_mov0
		waitmovement 0x0
		releaseall
		end


	EventScript_Borgo_Ponente_3_0_tile2_P2:
		showpokepic 0x3B6 0x0 0x6
		msgbox EventScript_Borgo_Ponente_3_0_tile0_P1_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0xFF EventScript_Borgo_Ponente_3_0_tile1_P1_mov0
		waitmovement 0x0
		releaseall
		end

.global EventScript_Borgo_Ponente_NPC1
EventScript_Borgo_Ponente_NPC1:
	lock
	faceplayer
	msgbox Borgo_Ponente_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Borgo_Ponente_NPC0
EventScript_Borgo_Ponente_NPC0:
	lock
	faceplayer
	msgbox Borgo_Ponente_NPC0_text1 MSG_NORMAL
	release
	end


.global EventScript_Borgo_Ponente_Brandon
EventScript_Borgo_Ponente_Brandon:
	lock
	faceplayer
	showpokepic 0x3B5 0x0 0x6
	msgbox Borgo_Ponente_Brandon_text1 MSG_NORMAL
	special 0x15A
	release
	end

.global EventScript_Borgo_Ponente_Crispy
EventScript_Borgo_Ponente_Crispy:
	lock
	faceplayer
	compare 0x4051 0xF
	if 0x1 _goto EventScript_Borgo_Ponente_Crispy_Part1
	showpokepic 0x3B4 0x0 0x6
	msgbox Borgo_Ponente_Crispy_text1 MSG_NORMAL
	special 0x15A
	release
	end

EventScript_Borgo_Ponente_Crispy_Part1:
	showpokepic 0x3B4 0x0 0x6
	//Eccoti player...
	msgbox Borgo_Ponente_Crispy_text2 MSG_NORMAL
	special 0x15A
	applymovement 0x4 EventScript_Borgo_Ponente_Crispy_mov1
	waitmovement 0x0
	showpokepic 0x3B5 0x15 0x6
	//Non ci credo, davvero stai per...
	msgbox Borgo_Ponente_Crispy_text3 MSG_NORMAL
	special 0x15A
	applymovement 0x3 EventScript_Borgo_Ponente_Crispy_mov2
	waitmovement 0x0
	showpokepic 0x3B4 0x0 0x6
	//Eehm, purtroppo no,...
	msgbox Borgo_Ponente_Crispy_text4 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B5 0x15 0x6
	//Evviva...
	msgbox Borgo_Ponente_Crispy_text5 MSG_NORMAL
	special 0x15A
	applymovement 0x3 EventScript_Borgo_Ponente_Crispy_mov3
	waitmovement 0x0
	showpokepic 0x3B4 0x0 0x6
	//Bene, allora andiamo...
	msgbox Borgo_Ponente_Crispy_text6 MSG_NORMAL
	special 0x15A

	//follow me music + applymovement
	playsong 0x0110 0x0
	applymovement 0x3 EventScript_Borgo_Ponente_Crispy_mov4
	applymovement 0x4 EventScript_Borgo_Ponente_Crispy_mov5
	applymovement 0xFF EventScript_Borgo_Ponente_Crispy_mov6
	waitmovement 0x0	
	pause 0x1E
	fadedefault

	showpokepic 0x3B4 0x0 0x6
	//eccoci, di solito i pokemon...
	msgbox Borgo_Ponente_Crispy_text7 MSG_NORMAL
	special 0x15A
	clearflag 0x02A
	setflag 0x029
	//interruzione
	setvar 0x4050 0x3
	setvar 0x4051 0x10
	fadescreen 0x3

	warpmuted 0x3 0x13 0xFF 0x0A 0x23
	release
	end


EventScript_Borgo_Ponente_Crispy_mov1:
	.byte 0x1A
	.byte 0x55
	.byte 0x55
	.byte 0x66
	.byte 0x1A
	.byte 0xFE

EventScript_Borgo_Ponente_Crispy_mov2:
	.byte 0x2 
	.byte 0x1A
	.byte 0xFE

EventScript_Borgo_Ponente_Crispy_mov3:
	.byte 0x1A
	.byte 0x0 
	.byte 0xFE

EventScript_Borgo_Ponente_Crispy_mov4:
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0x12
	.byte 0x12
	.byte 0xFE

EventScript_Borgo_Ponente_Crispy_mov5:
	.byte 0x13
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x12
	.byte 0xFE

EventScript_Borgo_Ponente_Crispy_mov6:
	.byte 0x1C
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0xFE


.global gMapScripts_Borgo_Ponente_3_0
gMapScripts_Borgo_Ponente_3_0:
    mapscript MAP_SCRIPT_ON_LOAD Borgo_Ponente_3_0_MapScriptOnLoad
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Borgo_Ponente_3_0_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Borgo_Ponente_3_0_MapScriptOnLoad:
		compare 0x4051 0xE
		if 0x1 _call Borgo_Ponente_3_0_MapScriptOnLoad_move_Crispy
		compare 0x4051 0xF
		if 0x1 _call Borgo_Ponente_3_0_MapScriptOnLoad_move_Brandon
		compare 0x4051 0xF
		if 0x1 _call Borgo_Ponente_3_0_MapScriptOnLoad_move_Crispy
		compare 0x4051 0xE 
		if 0x1 _call Borgo_Ponente_3_0_MapScriptOnLoad_door
		compare 0x4051 0xF
		if 0x1 _call Borgo_Ponente_3_0_MapScriptOnLoad_door
		compare 0x4051 0x10
		if 0x1 _call Borgo_Ponente_3_0_MapScriptOnLoad_door
		end

	Borgo_Ponente_3_0_MapScriptOnLoad_door:
		setmaptile 0x1F 0x11 0x28F 0x1

	Borgo_Ponente_3_0_MapScriptOnLoad_move_Crispy:
		movesprite2 0x3 0x0E 0x06
		spritebehave 0x3 0x8
		return

	Borgo_Ponente_3_0_MapScriptOnLoad_move_Brandon:
		movesprite2 0x4 0x0D 0x06
		return

	Borgo_Ponente_3_0_MapScriptOnFrame:
		levelscript 0x4050, 1, Borgo_Ponente_3_0_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Borgo_Ponente_3_0_MapScriptOnFrameBegin:
			lockall
			compare 0x4051 0xD
			if 0x1 _call Borgo_Ponente_3_0_MapScriptOnFrame_Part1
			releaseall
			end

			Borgo_Ponente_3_0_MapScriptOnFrame_Part1:
				pause 0x1E
				applymovement 0x3 Borgo_Ponente_3_0_MapScriptOnFrame_mov1
				waitmovement 0x0
				playsong 0x13B
				pause 0x1E
				applymovement 0x3 Borgo_Ponente_3_0_MapScriptOnFrame_mov2
				waitmovement 0x0	
				showpokepic 0x3B4 0x0 0x6
				msgbox Borgo_Ponente_3_0_crispy1_text1 MSG_NORMAL
				special 0x15A
				pause 0x1E
				applymovement 0x3 Borgo_Ponente_3_0_MapScriptOnFrame_mov3
				waitmovement 0x0
				fadedefault
				setvar 0x4051 0xE
				setvar 0x4050 0x2
				setvar 0x4052 0x0
				return

			Borgo_Ponente_3_0_MapScriptOnFrame_mov1:
				.byte 0x1 
				.byte 0x62
				.byte 0x1A
				.byte 0xFE

			Borgo_Ponente_3_0_MapScriptOnFrame_mov2:
				.byte 0x11
				.byte 0xFE

			Borgo_Ponente_3_0_MapScriptOnFrame_mov3:
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x60
				.byte 0xFE
