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
			compare 0x4051 0x22
			if 0x1 _goto Percorso2_3_41_MapScriptOnFrame_P1
			compare 0x4051 0x24
			if 0x1 _goto Percorso2_3_41_MapScriptOnFrame_P2
			compare 0x4051 0x25
			if 0x1 _goto Percorso2_3_41_MapScriptOnFrame_P3
			compare 0x4051 0x27
			if 0x1 _goto Percorso2_3_41_MapScriptOnFrame_P4				
			end

		Percorso2_3_41_MapScriptOnFrame_P1:
			lockall
			pause 0x1E
			showpokepic 0x3B4 0x15 0x6
			//aaa
			textcolor 0x0
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text1 MSG_NORMAL
			special 0x15A
			pause 0x1E
			giveitem 0x169 0x1 MSG_OBTAIN
			pause 0x1E
			setvar 0x4051 0x23
			pause 0x1E
			showpokepic 0x3B4 0x15 0x6
			special 0x15A
			showpokepic 0x3B4 0x15 0x6
			textcolor 0x0
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text2 MSG_NORMAL
			special 0x15A
			pause 0x1E
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			special 0x15A
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text3 MSG_NORMAL			
			special 0x15A
			pause 0x1E
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			special 0x15A
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text4 MSG_NORMAL
			special 0x15A
			pause 0x1E
			//P2 PREPARATION
			setflag 0x952
			setvar 0x4051 0x24
			writebytetooffset 0x2 0x2036E28
			writebytetooffset 0x89 0x350A34
			warpmuted 0x3 0x29 0xFF 0x1C 0x06
			releaseall
			end


		//cutscene tipo mascherato P_2 
		Percorso2_3_41_MapScriptOnFrame_P2:
			lockall
			pause 0x1E
			playsong 0x189 0x0
			pause 0x1E
			applymovement 0xFF Percorso2_3_41_MapScriptOnFrameBegin_P2_mov1
			waitmovement 0x0
			movesprite 0x6 0x1C 0x02
			sound 0x09
			applymovement 0x6 Percorso2_3_41_MapScriptOnFrameBegin_P2_mov2
			applymovement 0xFF Percorso2_3_41_MapScriptOnFrameBegin_P2_mov3
			waitmovement 0x0
			pause 0x1E
			showpokepic 0x3B9 0x0 0x6
			special 0x15A
			showpokepic 0x3B9 0x0 0x6
			textcolor 0x0
    		msgbox EventScript_Percorso2_3_41_tile0_text1 MSG_NORMAL
			closeonkeypress
			special 0x15A
			pause 0x1E
			applymovement 0x6 Percorso2_3_41_MapScriptOnFrameBegin_P2_mov4
			waitmovement 0x0
			applymovement 0xFF Percorso2_3_41_MapScriptOnFrameBegin_P2_mov5
			waitmovement 0x0
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			textcolor 0x0
    		msgbox EventScript_Percorso2_3_41_tile0_text2 MSG_NORMAL
			special 0x15A
			pause 0x1E
			clearflag 0x952
			setvar 0x4051 0x25
			writebytetooffset 0x0 0x2036E28
			writebytetooffset 0x25 0x350A34
			warpmuted 0x3 0x29 0xFF 0x1C 0x04
			releaseall
			end				

			Percorso2_3_41_MapScriptOnFrameBegin_P2_mov1:
				.byte 0x11
				.byte 0x11
				.byte 0xFE

			Percorso2_3_41_MapScriptOnFrameBegin_P2_mov2:
				.byte 0x1D
				.byte 0x1D
				.byte 0xFE

			Percorso2_3_41_MapScriptOnFrameBegin_P2_mov3:
				.byte 0x1A
				.byte 0x4E
				.byte 0x1 
				.byte 0x62	
				.byte 0xFE

			Percorso2_3_41_MapScriptOnFrameBegin_P2_mov4:
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
				.byte 0xFE

			Percorso2_3_41_MapScriptOnFrameBegin_P2_mov5:
				.byte 0x0 
				.byte 0x18
				.byte 0x63
				.byte 0x18
				.byte 0xFE

		Percorso2_3_41_MapScriptOnFrame_P3:
			lockall
			pause 0x1E
			pause 0x1E
			showpokepic 0x3B4 0x15 0x6
			special 0x15A
			showpokepic 0x3B4 0x15 0x6
			textcolor 0x0
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text5 MSG_NORMAL
			special 0x15A
			pause 0x1E
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			special 0x15A
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text6 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0x1 Percorso2_3_41_MapScriptOnFrameBegin_mov0
			waitmovement 0x0
			showpokepic 0x3B4 0x15 0x6
			special 0x15A
			showpokepic 0x3B4 0x15 0x6
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text7 MSG_NORMAL
			special 0x15A
			//CUTSCENE PREPARATION
			clearflag 0x95B
			clearflag 0x95A
			//player invisible
			setvar 0x501F 0x12E
			//var to activate level
			setvar 0x4050 0x4
			//var to trigger level
			setvar 0x4051 0x26
			//set screen to sepia
			writebytetooffset 0x2 0x2036E28
			writebytetooffset 0x89 0x34F5DC
			warpmuted 0x01 0x22 0xFF 0x0B 0x08
			release
			end
			
		Percorso2_3_41_MapScriptOnFrame_P4:	
			lockall
			pause 0x1E
			showpokepic 0x3B4 0x15 0x6
			special 0x15A	
			showpokepic 0x3B4 0x15 0x6
			textcolor 0x0
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text8 MSG_NORMAL
			special 0x15A			
			pause 0x1E
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			special 0x15A
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text3 MSG_NORMAL
			special 0x15A
			pause 0x1E
			showpokepic 0x3B4 0x15 0x6
			special 0x15A
			showpokepic 0x3B4 0x15 0x6
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text9 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			playsong 0x18A 0x0
			applymovement 0x1 Percorso2_3_41_MapScriptOnFrameBegin_mov1
			waitmovement 0x0
			fadedefault
			hidesprite 0x1
			setflag 0x952
			setvar 0x4050 0x2
			setvar 0x4051 0x28
			setvar 0x4053 0x2
			releaseall
			end

			Percorso2_3_41_MapScriptOnFrameBegin_mov0:
				.byte 0x62
				.byte 0xFE

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
	pause 0x1E
	showpokepic 0x3BB 0x0 0x6
	msgbox Percorso_2_3_41_NPC1_2_text1 MSG_NORMAL
    special 0x15A
	release
	end

.global EventScript_Percorso_2_3_41_NPC2
EventScript_Percorso_2_3_41_NPC2:
	lock
	faceplayer
	pause 0x1E
	showpokepic 0x3BC 0x0 0x6
	msgbox Percorso_2_3_41_NPC1_2_text1 MSG_NORMAL
    special 0x15A
	release
	end

.global EventScript_Percorso_2_3_41_NPC3
EventScript_Percorso_2_3_41_NPC3:

	trainerbattle0 0x0 0x3 0x0 Percorso_2_3_41_NPC3_text1 Percorso_2_3_41_NPC3_text1
	msgbox Percorso_2_3_41_NPC3_text3 MSG_NORMAL
	end

.global EventScript_Percorso_2_3_41_NPC4
EventScript_Percorso_2_3_41_NPC4:

	trainerbattle0 0x0 0x2 0x0 Percorso_2_3_41_NPC4_text1 Percorso_2_3_41_NPC4_text2
	msgbox Percorso_2_3_41_NPC4_text3 MSG_NORMAL

	end

.global EventScript_Percorso_2_3_41_Sign0
EventScript_Percorso_2_3_41_Sign0:
	msgbox Percorso_2_3_41_Sign0_text1 0x7
	end

.global EventScript_Percorso_2_3_41_Sign1
EventScript_Percorso_2_3_41_Sign1:
	msgbox Percorso_2_3_41_Sign1_text1 0x7
	end

.global EventScript_Percorso_2_3_41_Sign2
EventScript_Percorso_2_3_41_Sign2:
	msgbox Percorso_2_3_41_Sign2_text1 0x7
	end

.global EventScript_Percorso2_3_41_tile0
EventScript_Percorso2_3_41_tile0:
	lockall
	playsong 0x0 0x0
	pause 0x1E
	applymovement 0xFF EventScript_Percorso2_3_41_tile0_mov0
	waitmovement 0x0
	pause 0x1E
	movesprite 0x6 0x1C 0x01
	sound 0x09
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov1
	waitmovement 0x6
	applymovement 0xFF 	EventScript_Percorso2_3_41_tile0_mov2
	waitmovement 0xFF
	pause 0x1E
	showpokepic 0x3B9 0x0 0x6
	textcolor 0x0
    msgbox EventScript_Percorso2_3_41_tile0_text1 MSG_NORMAL
	closeonkeypress
    special 0x15A
	pause 0x1E
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov3
	waitmovement 0x6
	hidesprite 0x6
	pause 0x1E
	spriteface 0xFF 0x1
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
    msgbox EventScript_Percorso2_3_41_tile0_text2 MSG_NORMAL
    special 0x15A
	setvar 0x4051 0x18
	fadedefault
	releaseall
	end

	EventScript_Percorso2_3_41_tile0_mov0:
		.byte 0x63
		.byte 0xFE

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
	playsong 0x0 0x0
	movesprite 0x6 0x1D 0x01
	sound 0x09
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov1
	waitmovement 0x6
	applymovement 0xFF 	EventScript_Percorso2_3_41_tile0_mov2
	waitmovement 0xFF
	pause 0x1E
	showpokepic 0x3B9 0x0 0x6
	textcolor 0x0
    msgbox EventScript_Percorso2_3_41_tile0_text1 MSG_NORMAL
	closeonkeypress
    special 0x15A
	applymovement 0x6 EventScript_Percorso2_3_41_tile1_mov3
	waitmovement 0x6
	hidesprite 0x6
	pause 0x1E
	spriteface 0xFF 0x1
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
    msgbox EventScript_Percorso2_3_41_tile0_text2 MSG_NORMAL
    special 0x15A
	setvar 0x4051 0x18
	fadedefault
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
	playsong 0x169 0x0
	applymovement 0x9 EventScript_Percorso2_3_41_tile2_mov1
	waitmovement 0x0
	showpokepic 0x3BA 0x0 0x6
	textcolor 0x0
    msgbox Percorso2_3_41_tile2_text1 MSG_NORMAL
    special 0x15A	
	applymovement 0x9 EventScript_Percorso2_3_41_tile2_mov2
	waitmovement 0x0
	setflag 0x95C
	hidesprite 0x9
	setvar 0x4051 0x2F
	setvar 0x4053 0x3
	fadedefault
	releaseall
	end

	EventScript_Percorso2_3_41_tile2_mov1:
		.byte 0x3 
		.byte 0x1B
		.byte 0x62
		.byte 0x13
		.byte 0x11
		.byte 0x13 
		.byte 0xFE

	EventScript_Percorso2_3_41_tile2_mov2:
		.byte 0x12
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


.global EventScript_Percorso2_3_41_tile3
EventScript_Percorso2_3_41_tile3:
	lockall
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	msgbox Percorso2_3_41_tile3_text1 MSG_NORMAL
    special 0x15A
	pause 0x1E
	applymovement 0xFF EventScript_Percorso2_3_41_tile3_mov1
	waitmovement 0x0
	releaseall
	end

	EventScript_Percorso2_3_41_tile3_mov1:
		.byte 0x13
		.byte 0xFE

.global EventScript_Percorso_2_3_41_NPC10
EventScript_Percorso_2_3_41_NPC10:
	giveitem 0xD 0x1 MSG_FIND
	end
	
.global EventScript_Percorso_2_3_41_NPC11
EventScript_Percorso_2_3_41_NPC11:
	giveitem 0x40 0x1 MSG_FIND
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