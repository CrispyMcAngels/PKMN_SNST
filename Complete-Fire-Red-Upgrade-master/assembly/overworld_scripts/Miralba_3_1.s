.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global gMapScripts_Miralba_3_1
gMapScripts_Miralba_3_1:
	mapscript MAP_SCRIPT_ON_LOAD Miralba_3_1_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Miralba_3_1_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Miralba_3_1_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

		Miralba_3_1_MapScriptOnLoad:
			compare 0x4050 0x3
			if 0x1 _call Miralba_3_1_MapScriptOnLoad_move_Fratelli
			end

		Miralba_3_1_MapScriptOnLoad_move_Fratelli:
			movesprite2 0x6 0x13 0x8
			movesprite2 0x5 0x12 0x8
			spritebehave 0x6 0x8
			spritebehave 0x5 0x8
			return

		Miralba_3_1_MapScriptOnWarpIntoMapTable:
		levelscript 0x4050, 3, Miralba_3_1_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Miralba_3_1_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end

		Miralba_3_1_MapScriptOnFrame:
		levelscript 0x4050, 3, Miralba_3_1_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Miralba_3_1_MapScriptOnFrameBegin:
			lockall
			compare 0x4051 0x16
			if 0x1 _call Miralba_3_1_MapScriptOnFrame_Part1
			releaseall
			end

		Miralba_3_1_MapScriptOnFrame_Part1:
			//spriteface 0xFF 0x2
			//Grazie mille...
			textcolor 0x1
			msgbox Miralba_3_1_MapScriptOnFrame_text1 MSG_NORMAL
			pause 0x1E
			giveitem 0x3 0x3 MSG_OBTAIN
			pause 0x1E
			//E anche questo...
			msgbox Miralba_3_1_MapScriptOnFrame_text2 MSG_NORMAL
			pause 0x1E
			giveitem 0xD 0x3 MSG_OBTAIN
			pause 0x1E
			//ti auguro buona...
			textcolor 0x1
			msgbox Miralba_3_1_MapScriptOnFrame_text3 MSG_NORMAL
			pause 0x1E
			fanfare 0x0103
			textcolor 0x2
			msgbox Mission_Completed_text1 MSG_NORMAL
			setvar 0x4051 0x17
			setvar 0x4050 0x2
			setvar 0x4052 0x1
			setvar 0x4053 0x0
			releaseall
			end


.global EventScript_Miralba_3_1_NPC5
EventScript_Miralba_3_1_NPC5:
	lock
	compare 0x4051 0x14
	if 0x1 _call EventScript_Miralba_3_1_NPC5_P1
	compare 0x4051 0x15
	if 0x1 _call EventScript_Miralba_3_1_NPC5_P2
	msgbox Miralba_3_1_NPC5_text1 MSG_NORMAL
	release
	end

	EventScript_Miralba_3_1_NPC5_P1:
		faceplayer
		applymovement 0x6 Miralba_3_1_NPC5_mov1
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text1 MSG_NORMAL
		hidesprite 0xB
		applymovement 0x6 Miralba_3_1_NPC5_mov2
		applymovement 0xFF Miralba_3_1_NPC5_mov3
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text2 MSG_NORMAL
		applymovement 0x6 Miralba_3_1_NPC5_mov4
		waitmovement 0x0
		showsprite 0xB
		clearflag 0x952
		setflag 0x961
		fanfare 0x0102
		textcolor 0x2
		msgbox Mission_Received_text1 MSG_NORMAL
		setvar 0x4051 0x15
		setvar 0x4053 0x1
		release
		end

		Miralba_3_1_NPC5_mov1:
			.byte 0x62
			.byte 0xFE

		Miralba_3_1_NPC5_mov2:
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x10
			.byte 0x2 
			.byte 0xFE

		Miralba_3_1_NPC5_mov3:
			.byte 0x10
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0xFE

		Miralba_3_1_NPC5_mov4:
			.byte 0x11
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x0 
			.byte 0xFE

	EventScript_Miralba_3_1_NPC5_P2:
		lock
		faceplayer
		applymovement 0x6 Miralba_3_1_NPC5_mov1
		waitmovement 0x0
		pause 0x1E
		textcolor 0x1
		msgbox Miralba_3_1_Tile0_text3 MSG_NORMAL
		hidesprite 0xB
		applymovement 0x6 Miralba_3_1_NPC5_mov2
		applymovement 0xFF Miralba_3_1_NPC5_mov3
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text4 MSG_NORMAL
		applymovement 0x6 Miralba_3_1_NPC5_mov4
		waitmovement 0x0
		showsprite 0xB
		release
		end

.global EventScript_Miralba_3_1_Tile0
EventScript_Miralba_3_1_Tile0:
	compare 0x4051 0x14
	if 0x1 _call EventScript_Miralba_3_1_Tile0_P1
	compare 0x4051 0x15
	if 0x1 _call EventScript_Miralba_3_1_Tile0_P2
	end

	EventScript_Miralba_3_1_Tile0_P1:
		lockall
		applymovement 0x6 Miralba_3_1_Tile0_mov1
		waitmovement 0x0
		pause 0x1E
		spriteface 0xFF 0x2
		textcolor 0x1
		msgbox Miralba_3_1_Tile0_text1 MSG_NORMAL
		hidesprite 0xB
		applymovement 0x6 Miralba_3_1_Tile0_mov2
		applymovement 0xFF Miralba_3_1_Tile0_mov3
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text2 MSG_NORMAL
		applymovement 0x6 Miralba_3_1_Tile0_mov4
		waitmovement 0x0
		showsprite 0xB
		clearflag 0x952
		setflag 0x961
		fanfare 0x0102
		textcolor 0x2
		msgbox Mission_Received_text1 MSG_NORMAL
		setvar 0x4051 0x15
		setvar 0x4053 0x1
		releaseall
		end

		Miralba_3_1_Tile0_mov1:
			.byte 0x0 
			.byte 0x62
			.byte 0xFE

		Miralba_3_1_Tile0_mov2:
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x10
			.byte 0x2 
			.byte 0xFE

		Miralba_3_1_Tile0_mov3:
			.byte 0x1C
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0x13
			.byte 0xFE

		Miralba_3_1_Tile0_mov4:
			.byte 0x11
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x0 
			.byte 0xFE

	EventScript_Miralba_3_1_Tile0_P2:
		lockall
		applymovement 0x6 Miralba_3_1_Tile0_mov1
		waitmovement 0x0
		pause 0x1E
		spriteface 0xFF 0x2
		textcolor 0x1
		msgbox Miralba_3_1_Tile0_text3 MSG_NORMAL
		hidesprite 0xB
		applymovement 0x6 Miralba_3_1_Tile0_mov2
		applymovement 0xFF Miralba_3_1_Tile0_mov3
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text4 MSG_NORMAL
		applymovement 0x6 Miralba_3_1_Tile0_mov4
		waitmovement 0x0
		showsprite 0xB
		releaseall
		end

.global EventScript_Miralba_Sign0
EventScript_Miralba_Sign0:
	msgbox Miralba_Sign0_text1 0x7
	end

.global EventScript_Miralba_Sign2
EventScript_Miralba_Sign2:
	msgbox Miralba_Sign2_text1 0x7
	end

.global EventScript_Miralba_Sign4
EventScript_Miralba_Sign4:
	msgbox Miralba_Sign4_text1 0x7
	end

.global EventScript_Miralba_Sign5
EventScript_Miralba_Sign5:
	msgbox Miralba_Sign5_text1 0x7
	end

.global EventScript_Miralba_Sign6
EventScript_Miralba_Sign6:
	msgbox Miralba_Sign6_text1 0x7
	end

.global EventScript_Miralba_Sign8
EventScript_Miralba_Sign8:

	msgbox Miralba_Sign8_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _call EventScript_Miralba_Sign8_YES
	if 0x0 _call EventScript_Miralba_Sign8_NO
	end

	EventScript_Miralba_Sign8_YES:

		getplayerpos 0x4001 0x4002
		compare 0x4002 0xA
		if 0x1 _goto Miralba_Sign8_jumpU
		compare 0x4002 0x7
		if 0x1 _goto Miralba_Sign8_jumpD
		compare 0x4002 0x8
		if 0x1 _goto Miralba_Sign8_jumpSide1
		compare 0x4002 0x9
		if 0x1 _goto Miralba_Sign8_jumpSide2
		end

		Miralba_Sign8_jumpSide1:
			compare 0x4001 0xF
			if 0x1 _goto Miralba_Sign8_jumpR
			compare 0x4001 0x12
			if 0x1 _goto Miralba_Sign8_jumpL
			end

		Miralba_Sign8_jumpSide2:
			compare 0x4001 0xF
			if 0x1 _goto Miralba_Sign8_jumpSR
			compare 0x4001 0x12
			if 0x1 _goto Miralba_Sign8_jumpSL
			end

		Miralba_Sign8_jumpU:
			applymovement 0xFF Miralba_Sign8_movU
			waitmovement 0xFF
			warp 0x1 0x1F 0xFF 0x08 0x02
			end

			Miralba_Sign8_movU:
				.byte 0x15
				.byte 0xFE

		Miralba_Sign8_jumpD:
			applymovement 0xFF Miralba_Sign8_movD
			waitmovement 0xFF
			warp 0x1 0x1F 0xFF 0x08 0x02
			end

			Miralba_Sign8_movD:
				.byte 0x4E
				.byte 0xFE
		
		Miralba_Sign8_jumpR:
			applymovement 0xFF Miralba_Sign8_movR
			waitmovement 0xFF
			warp 0x1 0x1F 0xFF 0x08 0x02
			end

			Miralba_Sign8_movR:
				.byte 0x51
				.byte 0xFE

		Miralba_Sign8_jumpL:
			applymovement 0xFF Miralba_Sign8_movL
			waitmovement 0xFF
			warp 0x1 0x1F 0xFF 0x08 0x02
			end

			Miralba_Sign8_movL:
				.byte 0x50
				.byte 0xFE

		Miralba_Sign8_jumpSR:
			applymovement 0xFF Miralba_Sign8_movSR
			waitmovement 0xFF
			warp 0x1 0x1F 0xFF 0x08 0x02
			end

			Miralba_Sign8_movSR:
				.byte 0x11
				.byte 0x51
				.byte 0xFE

		Miralba_Sign8_jumpSL:
			applymovement 0xFF Miralba_Sign8_movSL
			waitmovement 0xFF
			warp 0x1 0x1F 0xFF 0x08 0x02
			end

			Miralba_Sign8_movSL:
				.byte 0x11
				.byte 0x50
				.byte 0xFE


	EventScript_Miralba_Sign8_NO:
	closeonkeypress
	end

.global EventScript_Miralba_3_1_NPC1
EventScript_Miralba_3_1_NPC1:
	showpokepic 0x3B8 0x0 0x6
	msgbox Miralba_3_1_NPC1_text1 MSG_NORMAL
	special 0x15A
	end

.global EventScript_Miralba_3_1_tile1
EventScript_Miralba_3_1_tile1:
	lockall
	spriteface 0xFF 0x2
	showpokepic 0x3B4 0x0 0x6
	textcolor 0x0
	msgbox Miralba_3_1_NPC0_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B8 0x15 0x6
	msgbox Miralba_3_1_NPC0_text2 MSG_NORMAL
	special 0x15A
	applymovement 0x1 Miralba_3_1_NPC0_mov1
	applymovement 0x2 Miralba_3_1_NPC0_mov1
	waitmovement 0x0
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text3 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B8 0x15 0x6
	msgbox Miralba_3_1_NPC0_text4 MSG_NORMAL
	special 0x15A
	applymovement 0x2 Miralba_3_1_NPC0_mov2
	waitmovement 0x0
	pause 0x1E
	showpokepic 0x3B8 0x15 0x6
	msgbox Miralba_3_1_NPC0_text5 MSG_NORMAL
	special 0x15A
	pause 0x1E
	applymovement 0x1 Miralba_3_1_NPC0_mov3
	waitmovement 0x0
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text6 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B8 0x15 0x6
	textcolor 0x0
	msgbox Miralba_3_1_NPC0_text7 MSG_NORMAL
	special 0x15A
	applymovement 0x2 Miralba_3_1_NPC0_mov4
	waitmovement 0x2
	getplayerpos 0x4001 0x4002
	compare 0x4001 0x06
	if 0x1 _call EventScript_Miralba_3_1_tile1_P1
	spriteface 0x1 0x1
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	textcolor 0x0
	msgbox Miralba_3_1_NPC0_text8 MSG_NORMAL
	special 0x15A
	pause 0x1E	
	playsong 0x0110 0x0
	applymovement 0x1 Miralba_3_1_NPC0_mov5
	applymovement 0xFF Miralba_3_1_NPC0_mov6
	waitmovement 0xFF	
	fadedefault
	showpokepic 0x3B4 0x0 0x6
	textcolor 0x0
	msgbox Miralba_3_1_NPC0_text9 MSG_NORMAL
	special 0x15A
	pause 0x1E	
	playsong 0x0110 0x0
	applymovement 0x1 Miralba_3_1_NPC0_mov7
	applymovement 0xFF Miralba_3_1_NPC0_mov8
	waitmovement 0xFF	
	fadedefault
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text10 MSG_NORMAL
	special 0x15A
	pause 0x1E
	spriteface 0xFF 0x4
	spriteface 0x1 0x3
	showpokepic 0x3B4 0x0 0x6
	textcolor 0x0
	msgbox Miralba_3_1_NPC0_text11 MSG_NORMAL
	special 0x15A
	pause 0x1E
	giveitem 0x4 0x5 MSG_OBTAIN
	pause 0x1E
	spriteface 0x1 0x1
	spriteface 0xFF 0x1
	pause 0x1E
	spriteface 0x3 0x2
	cry 0x1EE 0x0
	msgbox Miralba_3_1_NPC0_text12 MSG_NORMAL
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text13 MSG_NORMAL
	special 0x15A
	pause 0x1E
	spriteface 0x3 0x1
	pause 0x1E
	spriteface 0xFF 0x4
	spriteface 0x1 0x3
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text14 MSG_NORMAL
	special 0x15A
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	msgbox Miralba_3_1_NPC0_text15 MSG_NORMAL
	special 0x15A
	playsong 0x18A 0x0
	applymovement 0x1 Miralba_3_1_NPC0_mov9
	applymovement 0xFF Miralba_3_1_NPC0_mov10
	waitmovement 0x1
	setflag 0x950
	setflag 0x951
	setflag 0x952
	setvar 0x4052 0x0
	fadedefault
	releaseall
	end

	EventScript_Miralba_3_1_tile1_P1:
		pause 0x1E
		applymovement 0xFF EventScript_Miralba_3_1_tile1_P1_mov1
		waitmovement 0xFF
		return

		EventScript_Miralba_3_1_tile1_P1_mov1:
			.byte 0x13
			.byte 0x1 
			.byte 0xFE


	Miralba_3_1_NPC0_mov1:
		.byte 0x0 
		.byte 0x62
		.byte 0xFE

	Miralba_3_1_NPC0_mov2:
		.byte 0x3 
		.byte 0xFE

	Miralba_3_1_NPC0_mov3:
		.byte 0x2 
		.byte 0xFE

	Miralba_3_1_NPC0_mov4:
		.byte 0x11
		.byte 0x11
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x10
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x60
		.byte 0x01
		.byte 0x1C
		.byte 0x2
		.byte 0xFE

	Miralba_3_1_NPC0_mov5:
		.byte 0x1A
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x01		
		.byte 0xFE

	Miralba_3_1_NPC0_mov6:
		.byte 0x12
		.byte 0x13
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x01
		.byte 0xFE

	Miralba_3_1_NPC0_mov7:
		.byte 0x10
		.byte 0x12
		.byte 0x12
		.byte 0x11
		.byte 0x12
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
		.byte 0x11
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x11
		.byte 0x13
		.byte 0x11
		.byte 0x13
		.byte 0x1 
		.byte 0xFE

	Miralba_3_1_NPC0_mov8:
		.byte 0x1C
		.byte 0x1C
		.byte 0x1C
		.byte 0x1C
		.byte 0x12
		.byte 0x12
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
		.byte 0x11
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x11
		.byte 0x13
		.byte 0x11
		.byte 0xFE

	Miralba_3_1_NPC0_mov9:
		.byte 0x12
		.byte 0x10
		.byte 0x12
		.byte 0x12
		.byte 0x10
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x60
		.byte 0xFE

	Miralba_3_1_NPC0_mov10:
		.byte 0x12
		.byte 0x0 
		.byte 0xFE

.global EventScript_Miralba_3_1_NPC4
EventScript_Miralba_3_1_NPC4:
	lock
	faceplayer
	msgbox Miralba_3_1_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_3_1_NPC3
EventScript_Miralba_3_1_NPC3:
	lock
	faceplayer
	msgbox Miralba_3_1_NPC3_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _call Miralba_3_1_YES
	if 0x0 _call Miralba_3_1_NO
	release
	end

	Miralba_3_1_YES:
		playsong 0x18B 0x0
		msgbox Miralba_3_1_NPC3_text2 MSG_NORMAL
		fadedefault
		pause 0x1E
		msgbox Miralba_3_1_NPC3_text3 MSG_NORMAL
		checkflag 0x95D
		if 0x0 _goto Miralba_3_1_NPC1_P1		
		release
		end

		Miralba_3_1_NPC1_P1:
			msgbox Miralba_3_1_NPC3_text4 MSG_NORMAL
			giveitem 0xB7 0x1 MSG_OBTAIN
			setflag 0x95D
			release
			end	

	Miralba_3_1_NO:
		msgbox Miralba_3_1_NPC3_text5 MSG_NORMAL
		release
		end	

.global EventScript_Miralba_3_1_NPC7
EventScript_Miralba_3_1_NPC7:
	lock
	faceplayer
	msgbox Miralba_3_1_NPC7_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_3_1_NPC8
EventScript_Miralba_3_1_NPC8:
	giveitem 0x22 0x1 MSG_FIND
	end

.global EventScript_Miralba_3_1_NPC9
EventScript_Miralba_3_1_NPC9:
	giveitem 0x56 0x1 MSG_FIND
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