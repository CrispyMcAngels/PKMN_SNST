.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Percorso2_3_41
gMapScripts_Percorso2_3_41:
	mapscript MAP_SCRIPT_ON_LOAD Percorso2_3_41_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Percorso2_3_41_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Percorso2_3_41_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

		Percorso2_3_41_MapScriptOnLoad:
			setvar 0x5007 0x0
			end

	Percorso2_3_41_MapScriptOnWarpIntoMapTable:
		levelscript 0x4050, 5, Percorso2_3_41_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Percorso2_3_41_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end	

	Percorso2_3_41_MapScriptOnFrame:
	levelscript 0x4050, 5, Percorso2_3_41_MapScriptOnFrameBegin
	.hword MAP_SCRIPT_TERMIN

		Percorso2_3_41_MapScriptOnFrameBegin:
			lockall
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			//aaa
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text1 MSG_NORMAL
			special 0x15A
			pause 0x1E
			giveitem 0x169 0x1 MSG_OBTAIN
			pause 0x1E
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text2 MSG_NORMAL
			playsong 0x13B
			applymovement 0x1 Percorso2_3_41_MapScriptOnFrameBegin_mov1
			waitmovement 0x0
			fadedefault
			hidesprite 0x1
			setflag 0x952
			setvar 0x4050 0x2
			setvar 0x4051 0x23
			setvar 0x4053 0x2
			releaseall
			end

			Percorso2_3_41_MapScriptOnFrameBegin_mov1:
				.byte 0x13
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0xFE

.global EventScript_Percorso_2_3_41_NPC7
EventScript_Percorso_2_3_41_NPC7:

	trainerbattle0 0x0 0x17 0x0 Percorso_2_3_41_NPC7_text1 Percorso_2_3_41_NPC7_text2
	msgbox Percorso_2_3_41_NPC7_text3 MSG_NORMAL

	release
	end

.global EventScript_Percorso_2_3_41_NPC9
EventScript_Percorso_2_3_41_NPC9:

	trainerbattle0 0x0 0x18 0x0 Percorso_2_3_41_NPC9_text1 Percorso_2_3_41_NPC9_text2
	msgbox Percorso_2_3_41_NPC9_text3 MSG_NORMAL

	release
	end

.global EventScript_Percorso_2_3_41_NPC6
EventScript_Percorso_2_3_41_NPC6:
	lock
	faceplayer
	msgbox Percorso_2_3_41_NPC6_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_2_3_41_NPC1_2
EventScript_Percorso_2_3_41_NPC1_2:
	lock
	faceplayer
	msgbox Percorso_2_3_41_NPC1_2_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_2_3_41_NPC3
EventScript_Percorso_2_3_41_NPC3:

	trainerbattle0 0x0 0x3 0x0 Percorso_2_3_41_NPC3_text1 Percorso_2_3_41_NPC3_text1
	msgbox Percorso_2_3_41_NPC3_text3 MSG_NORMAL
	end

.global EventScript_Percorso_2_3_41_NPC4
EventScript_Percorso_2_3_41_NPC4:

	trainerbattle0 0x0 0x2 0x0 Percorso_2_3_41_NPC4_text1 Percorso_2_3_41_NPC4_text1
	msgbox Percorso_2_3_41_NPC4_text3 MSG_NORMAL

	end

.global EventScript_Percorso_2_3_41_Sign0
EventScript_Percorso_2_3_41_Sign0:
	msgbox Percorso_2_3_41_Sign0_text1 MSG_SIGN
	end

.global EventScript_Percorso_2_3_41_Sign1
EventScript_Percorso_2_3_41_Sign1:
	msgbox Percorso_2_3_41_Sign1_text1 MSG_SIGN
	end

.global EventScript_Percorso_2_3_41_Sign2
EventScript_Percorso_2_3_41_Sign2:
	msgbox Percorso_2_3_41_Sign2_text1 MSG_SIGN
	end

.global EventScript_Percorso2_3_41_tile0
EventScript_Percorso2_3_41_tile0:
	lockall
	movesprite 0x6 0x1C 0x01
	sound 0x09
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov1
	waitmovement 0x6
	applymovement 0xFF 	EventScript_Percorso2_3_41_tile0_mov2
	waitmovement 0xFF
	pause 0x1E
	showpokepic 0x3B9 0x0 0x6
    msgbox EventScript_Percorso2_3_41_tile0_text1 MSG_NORMAL
	closeonkeypress
    special 0x15A
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov3
	waitmovement 0x6
	hidesprite 0x6
	pause 0x1E
	spriteface 0xFF 0x1
	showpokepic 0x3B6 0x0 0x6
    msgbox EventScript_Percorso2_3_41_tile0_text2 MSG_NORMAL
    special 0x15A
	setvar 0x4051 0x18
	releaseall
	end

	EventScript_Percorso2_3_41_tile0_mov1:
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0xFE

	EventScript_Percorso2_3_41_tile0_mov2:
		.byte 0x4E
		.byte 0x1 
		.byte 0x62
		.byte 0xFE

	EventScript_Percorso2_3_41_tile0_mov3:
		.byte 0x62
		.byte 0x20
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0xFE



.global EventScript_Percorso2_3_41_tile1
EventScript_Percorso2_3_41_tile1:
	lockall
	movesprite 0x6 0x1D 0x01
	sound 0x09
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov1
	waitmovement 0x6
	applymovement 0xFF 	EventScript_Percorso2_3_41_tile0_mov2
	waitmovement 0xFF
	pause 0x1E
	showpokepic 0x3B9 0x0 0x6
    msgbox EventScript_Percorso2_3_41_tile0_text1 MSG_NORMAL
	closeonkeypress
    special 0x15A
	applymovement 0x6 EventScript_Percorso2_3_41_tile1_mov3
	waitmovement 0x6
	hidesprite 0x6
	pause 0x1E
	spriteface 0xFF 0x1
	showpokepic 0x3B6 0x0 0x6
    msgbox EventScript_Percorso2_3_41_tile0_text2 MSG_NORMAL
    special 0x15A
	setvar 0x4051 0x18
	releaseall
	end


	EventScript_Percorso2_3_41_tile1_mov3:
		.byte 0x62
		.byte 0x1F
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0xFE

.global EventScript_Percorso2_3_41_tile2
EventScript_Percorso2_3_41_tile2:
	lockall
	pause 0x1E
	applymovement 0x9 EventScript_Percorso2_3_41_tile2_mov1
	waitmovement 0x0
	showpokepic 0x3BA 0x0 0x6
    msgbox Percorso2_3_41_tile2_text1 MSG_NORMAL
    special 0x15A	
	applymovement 0x9 EventScript_Percorso2_3_41_tile2_mov2
	waitmovement 0x0
	setflag 0x95C
	hidesprite 0x9
	setvar 0x4051 0x24
	releaseall
	end

	EventScript_Percorso2_3_41_tile2_mov1:
		.byte 0x3 
		.byte 0x1B
		.byte 0x62
		.byte 0x13
		.byte 0x11
		.byte 0x3 
		.byte 0xFE

	EventScript_Percorso2_3_41_tile2_mov2:
		.byte 0x10
		.byte 0x12
		.byte 0x10
		.byte 0x10
		.byte 0x13
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0xFE

