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
			msgbox Miralba_3_1_MapScriptOnFrame_text1 0x7
			pause 0x1E
			giveitem 0x3 0x3 MSG_OBTAIN
			pause 0x1E
			//E anche questo...
			msgbox Miralba_3_1_MapScriptOnFrame_text2 0x7
			pause 0x1E
			giveitem 0xD 0x3 MSG_OBTAIN
			pause 0x1E
			//ti auguro buona...
			msgbox Miralba_3_1_MapScriptOnFrame_text3 0x7
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
	msgbox Miralba_3_1_NPC5_text1 0x7
	release
	end

	EventScript_Miralba_3_1_NPC5_P1:
		faceplayer
		applymovement 0x6 Miralba_3_1_NPC5_mov1
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text1 0x7
		applymovement 0x6 Miralba_3_1_NPC5_mov2
		applymovement 0xFF Miralba_3_1_NPC5_mov3
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text2 0x7
		applymovement 0x6 Miralba_3_1_NPC5_mov4
		waitmovement 0x0
		clearflag 0x952
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
		msgbox Miralba_3_1_Tile0_text3 0x7
		applymovement 0x6 Miralba_3_1_NPC5_mov2
		applymovement 0xFF Miralba_3_1_NPC5_mov3
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text4 0x7
		applymovement 0x6 Miralba_3_1_NPC5_mov4
		waitmovement 0x0
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
		msgbox Miralba_3_1_Tile0_text1 0x7
		applymovement 0x6 Miralba_3_1_Tile0_mov2
		applymovement 0xFF Miralba_3_1_Tile0_mov3
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text2 0x7
		applymovement 0x6 Miralba_3_1_Tile0_mov4
		waitmovement 0x0
		clearflag 0x952
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
		msgbox Miralba_3_1_Tile0_text3 0x7
		applymovement 0x6 Miralba_3_1_Tile0_mov2
		applymovement 0xFF Miralba_3_1_Tile0_mov3
		waitmovement 0x0
		pause 0x1E
		msgbox Miralba_3_1_Tile0_text4 0x7
		applymovement 0x6 Miralba_3_1_Tile0_mov4
		waitmovement 0x0
		releaseall
		end

.global EventScript_Miralba_Sign0
EventScript_Miralba_Sign0:
	msgbox Miralba_Sign0_text1 MSG_SIGN
	end

.global EventScript_Miralba_Sign2
EventScript_Miralba_Sign2:
	msgbox Miralba_Sign2_text1 MSG_SIGN
	end

.global EventScript_Miralba_Sign4
EventScript_Miralba_Sign4:
	msgbox Miralba_Sign4_text1 MSG_SIGN
	end

.global EventScript_Miralba_Sign5
EventScript_Miralba_Sign5:
	msgbox Miralba_Sign5_text1 MSG_SIGN
	end

.global EventScript_Miralba_Sign6
EventScript_Miralba_Sign6:
	msgbox Miralba_Sign6_text1 MSG_SIGN
	end

.global EventScript_Miralba_Sign8
EventScript_Miralba_Sign8:
	msgbox Miralba_Sign8_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _call EventScript_Miralba_Sign8_YES
	if 0x0 _call EventScript_Miralba_Sign8_NO
	end

	EventScript_Miralba_Sign8_YES:
		applymovement 0xFF Miralba_Sign8_mov0
		waitmovement 0xFF
		warp 0x1 0x1F 0xFF 0x08 0x02
		end

	Miralba_Sign8_mov0:
		.byte 0x15
		.byte 0xFE

	EventScript_Miralba_Sign8_NO:
	closeonkeypress
	end

.global EventScript_Miralba_3_1_NPC1
EventScript_Miralba_3_1_NPC1:
	showpokepic 0x3B8 0x0 0x6
	msgbox Miralba_3_1_NPC1_text1 0x7
	special 0x15A
	end

.global EventScript_Miralba_3_1_NPC0
EventScript_Miralba_3_1_NPC0:
	lock
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text1 0x7
	special 0x15A
	pause 0x1E
	showpokepic 0x3B8 0x15 0x6
	msgbox Miralba_3_1_NPC0_text2 0x7
	special 0x15A
	applymovement 0x1 Miralba_3_1_NPC0_mov1
	applymovement 0x2 Miralba_3_1_NPC0_mov1
	waitmovement 0x0
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text3 0x7
	special 0x15A
	pause 0x1E
	showpokepic 0x3B8 0x15 0x6
	msgbox Miralba_3_1_NPC0_text4 0x7
	special 0x15A
	applymovement 0x2 Miralba_3_1_NPC0_mov2
	waitmovement 0x0
	pause 0x1E
	showpokepic 0x3B8 0x15 0x6
	msgbox Miralba_3_1_NPC0_text5 0x7
	special 0x15A
	pause 0x1E
	applymovement 0x1 Miralba_3_1_NPC0_mov3
	waitmovement 0x0
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text6 0x7
	special 0x15A
	pause 0x1E
	showpokepic 0x3B8 0x15 0x6
	msgbox Miralba_3_1_NPC0_text7 0x7
	special 0x15A
	applymovement 0x2 Miralba_3_1_NPC0_mov4
	waitmovement 0x2
	spriteface 0x1 0x1
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text8 0x7
	special 0x15A
	pause 0x1E	
	playsong 0x0110 0x0
	applymovement 0x1 Miralba_3_1_NPC0_mov5
	applymovement 0xFF Miralba_3_1_NPC0_mov6
	waitmovement 0xFF	
	fadedefault
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text9 0x7
	special 0x15A
	pause 0x1E	
	playsong 0x0110 0x0
	applymovement 0x1 Miralba_3_1_NPC0_mov7
	applymovement 0xFF Miralba_3_1_NPC0_mov8
	waitmovement 0xFF	
	fadedefault
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text10 0x7
	special 0x15A
	pause 0x1E
	spriteface 0xFF 0x4
	spriteface 0x1 0x3
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text11 0x7
	special 0x15A
	pause 0x1E
	giveitem 0x4 0x5 MSG_OBTAIN
	pause 0x1E
	spriteface 0x1 0x1
	spriteface 0xFF 0x1
	pause 0x1E
	spriteface 0x3 0x2
	cry 0x1EE 0x0
	msgbox Miralba_3_1_NPC0_text12 0x7
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text13 0x7
	special 0x15A
	pause 0x1E
	spriteface 0x3 0x1
	pause 0x1E
	spriteface 0xFF 0x4
	spriteface 0x1 0x3
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	msgbox Miralba_3_1_NPC0_text14 0x7
	special 0x15A
	pause 0x1E
	showpokepic 0x3B6 0x15 0x6
	msgbox Miralba_3_1_NPC0_text15 0x7
	special 0x15A
	playsong 0x13B 0x0
	applymovement 0x1 Miralba_3_1_NPC0_mov9
	applymovement 0xFF Miralba_3_1_NPC0_mov10
	waitmovement 0x1
	setflag 0x950
	setflag 0x951
	setflag 0x952
	fadedefault
	release
	end



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
	msgbox Miralba_3_1_NPC4_text1 0x7
	release
	end

.global EventScript_Miralba_3_1_NPC3
EventScript_Miralba_3_1_NPC3:
	lock
	faceplayer
	msgbox Miralba_3_1_NPC3_text1 0x7
	release
	end

.global EventScript_Miralba_3_1_NPC7
EventScript_Miralba_3_1_NPC7:
	lock
	faceplayer
	msgbox Miralba_3_1_NPC7_text1 0x7
	release
	end