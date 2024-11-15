.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Percorso_1_3_19_NPC0
EventScript_Percorso_1_3_19_NPC0:
	lock
	faceplayer
	msgbox Percorso_1_3_19_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_1_3_19_NPC1
EventScript_Percorso_1_3_19_NPC1:

	trainerbattle0 0x0 0x0 0x0 Percorso_1_3_19_NPC1_text1 Percorso_1_3_19_NPC1_text2
	msgbox Percorso_1_3_19_NPC1_text3 MSG_NORMAL

	end

.global EventScript_Percorso_1_3_19_NPC8
EventScript_Percorso_1_3_19_NPC8:
	
	trainerbattle0 0x0 0x1 0x0 Percorso_1_3_19_NPC8_text1 Percorso_1_3_19_NPC8_text2
	msgbox Percorso_1_3_19_NPC8_text3 MSG_NORMAL

	end


.global EventScript_Percorso_1_3_19_Sign0
EventScript_Percorso_1_3_19_Sign0:
	msgbox Percorso_1_3_19_Sign0_text1 MSG_SIGN
	end

.global EventScript_Percorso_1_3_19_Sign2
EventScript_Percorso_1_3_19_Sign2:
	msgbox Percorso_1_3_19_Sign2_text1 MSG_SIGN
	end

.global EventScript_Percorso_1_3_19_Sign3
EventScript_Percorso_1_3_19_Sign3:
	msgbox Percorso_1_3_19_Sign3_text1 MSG_SIGN
	end

.global gMapScripts_Percorso1_3_19
gMapScripts_Percorso1_3_19:
	mapscript MAP_SCRIPT_ON_FRAME_TABLE MapScripts_Percorso1_3_19_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_LOAD Percorso1_3_19_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

	Percorso1_3_19_MapScriptOnLoad:
		setvar 0x5007 0x0
		end

	MapScripts_Percorso1_3_19_MapScriptOnFrame:
		levelscript 0x4050, 3, MapScripts_Percorso1_3_19_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		MapScripts_Percorso1_3_19_MapScriptOnFrameBegin:
			lockall
			compare 0x4051 0x10
			if 0x1 _call MapScripts_Percorso1_3_19_MapScriptOnFrame_Part1
			releaseall
			end

		MapScripts_Percorso1_3_19_MapScriptOnFrame_Part1:
			spriteface 0xFF 0x3
			setvar 0x8004 0x00B1	
			setvar 0x8005 0x5
			special 0x9C
			waitstate
			pause 0x1E
			applymovement 0x3 MapScripts_Percorso1_3_19_MapScriptOnFrame_mov7
			applymovement 0x4 MapScripts_Percorso1_3_19_MapScriptOnFrame_mov8
			waitmovement 0x0
			showpokepic 0x3B4 0x0 0x6
			//Wow, non avevo ancora...
			msgbox MapScripts_Percorso1_3_19_MapScriptOnFrame_text8 MSG_NORMAL
			special 0x15A
			applymovement 0x3 MapScripts_Percorso1_3_19_MapScriptOnFrame_mov9
			waitmovement 0x0
			showpokepic 0x3B4 0x0 0x6
			//Ah player, prendi questa...
			msgbox MapScripts_Percorso1_3_19_MapScriptOnFrame_text9 MSG_NORMAL
			special 0x15A
			giveitem 0x4 0x1 MSG_OBTAIN
			showpokepic 0x3B4 0x0 0x6
			//Ci si vede
			msgbox MapScripts_Percorso1_3_19_MapScriptOnFrame_text10 MSG_NORMAL
			special 0x15A
			playsong 0x13B
			applymovement 0x3 MapScripts_Percorso1_3_19_MapScriptOnFrame_mov10
			applymovement 0x4 MapScripts_Percorso1_3_19_MapScriptOnFrame_mov11
			waitmovement 0x0
			fadedefault
			pause 0x1E

			showpokepic 0x3B5 0x15 0x6
			//tuo fratello...
			msgbox MapScripts_Percorso1_3_19_MapScriptOnFrame_text11 MSG_NORMAL
			special 0x15A
			pause 0x1E
			showpokepic 0x3B6 0x0 0x6
			//...
			msgbox MapScripts_Percorso1_3_19_MapScriptOnFrame_text12 MSG_NORMAL
			special 0x15A	

			showpokepic 0x3B5 0x15 0x6
			//Per oggi puo' bastare
			msgbox MapScripts_Percorso1_3_19_MapScriptOnFrame_text13 MSG_NORMAL
			special 0x15A
			setflag 0x951
			setvar 0x4050 0x2
			setvar 0x4051 0x11
			return

		MapScripts_Percorso1_3_19_MapScriptOnFrame_mov7:
			.byte 0x3 
			.byte 0xFE

		MapScripts_Percorso1_3_19_MapScriptOnFrame_mov8:
			.byte 0x1C
			.byte 0x1
			.byte 0xFE

		MapScripts_Percorso1_3_19_MapScriptOnFrame_mov9:
			.byte 0x2 
			.byte 0x1C
			.byte 0x3 
			.byte 0xFE

		MapScripts_Percorso1_3_19_MapScriptOnFrame_mov10:
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x11
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x11
			.byte 0x11
			.byte 0x11
			.byte 0x11
			.byte 0x11
			.byte 0x60
			.byte 0xFE

		MapScripts_Percorso1_3_19_MapScriptOnFrame_mov11:
			.byte 0x1C
			.byte 0x1C
			.byte 0x1C
			.byte 0x2 
			.byte 0x1C
			.byte 0x1C
			.byte 0x1 
			.byte 0xFE


.global EventScript_Percorso1_3_19_tile0
EventScript_Percorso1_3_19_tile0:
	lockall
	showpokepic 0x3B6 0x0 0x6
    msgbox EventScript_Percorso1_3_19_tile0_text1 MSG_NORMAL
    special 0x15A
	applymovement 0xFF EventScript_Percorso1_3_19_tile0_mov1
	waitmovement 0xFF
	releaseall
	end

	EventScript_Percorso1_3_19_tile0_mov1:
	.byte 0x13
	.byte 0xFE

.global EventScript_Percorso1_3_19_tile1
EventScript_Percorso1_3_19_tile1:
	lockall
	cry 0x1E7 0x0
	pause 0x1E
	movesprite 0x5 0x06 0x23
	playsong 0x0109 0x0
	cry 0x1E7 0x0
	pause 0x1E
	applymovement 0xFF EventScript_Percorso1_3_19_tile1_mov1
	applymovement 0x4 EventScript_Percorso1_3_19_tile1_mov1
	waitmovement 0x0
	pause 0x1E
	lockall
	applymovement 0x5 EventScript_Percorso1_3_19_tile1_mov2
	waitmovement 0x0
	msgbox EventScript_Percorso1_3_19_tile1_text1 MSG_NORMAL
	pause 0x1E
	applymovement 0x4 EventScript_Percorso1_3_19_tile1_mov2a
	waitmovement 0x0
	showpokepic 0x3B5 0x15 0x6
	//Aiutooo
    msgbox EventScript_Percorso1_3_19_tile1_text2 MSG_NORMAL
    special 0x15A
	pause 0x1E
	showpokepic 0x3B6 0x0 0x6
	//...
    msgbox EventScript_Percorso1_3_19_tile1_text3 MSG_NORMAL
    special 0x15A
	playsong 0x0116
	special 0x113
	//camera moves to go show Axew
	applymovement 0x7F EventScript_Percorso1_3_19_tile1_mov3
	waitmovement 0x0
	cry 0x297 0x0
	applymovement 0x7F EventScript_Percorso1_3_19_tile1_mov4
	applymovement 0x6 EventScript_Percorso1_3_19_tile1_mov5
	waitmovement 0x0	
	cry 0x297 0x0
	applymovement 0x5 EventScript_Percorso1_3_19_tile1_mov6
	waitmovement 0x0
	cry 0x1E7 0x0
	msgbox EventScript_Percorso1_3_19_tile1_text1 MSG_NORMAL
	pause 0x1E
	cry 0x297 0x0
	msgbox EventScript_Percorso1_3_19_tile1_text4 MSG_NORMAL
	applymovement 0x6 EventScript_Percorso1_3_19_tile1_mov7
	waitmovement 0x0
	fadescreen 0x3
	sound 0x7
	fadescreen 0x2
	pause 0x1E
	applymovement 0x5 EventScript_Percorso1_3_19_tile1_mov8
	applymovement 0x4 EventScript_Percorso1_3_19_tile1_mov8a
	waitmovement 0x0
	cry 0x1E7 0x0
	fadedefault
	pause 0x1E
	showpokepic 0x3B5 0x15 0x6
	//Fiuuu, per un pelo!
    msgbox EventScript_Percorso1_3_19_tile1_text5 MSG_NORMAL
    special 0x15A
	pause 0x1E
	applymovement 0x6 EventScript_Percorso1_3_19_tile1_mov9
	waitmovement 0x0
	pause 0x1E
	cry 0x297 0x0	
	msgbox EventScript_Percorso1_3_19_tile1_text4 MSG_NORMAL
	showpokepic 0x3B5 0x15 0x6
	//sembra proprio che...
    msgbox EventScript_Percorso1_3_19_tile1_text6 MSG_NORMAL
    special 0x15A
	pause 0x1E
	//capire come fare yes or no
	msgbox EventScript_Percorso1_3_19_tile1_text7 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Percorso1_3_19_tile1_yes
	if 0x0 _goto EventScript_Percorso1_3_19_tile1_no
	releaseall
	end

	EventScript_Percorso1_3_19_tile1_yes:
		showpokepic 0x3B6 0x0 0x6
		//vai, pokeball....
		msgbox EventScript_Percorso1_3_19_tile1_text8 MSG_NORMAL
		special 0x15A
		movesprite 0x7 0x0A 0x23
		pause 0x1E
		hidesprite 0x6
		pause 0x1E
		givepokemon 0x297 0x5 0x0 0x0 0x0 0x0
		removeitem 0x4 0x1
		fanfare 0x013E
		msgbox EventScript_Percorso1_3_19_tile1_text9 MSG_NORMAL
		pause 0x1E
		pause 0x1E
		applymovement 0x4 EventScript_Percorso1_3_19_tile1_mov10
		waitmovement 0x0
		showpokepic 0x3B5 0x15 0x6
		//complimenti player
		msgbox EventScript_Percorso1_3_19_tile1_text10 MSG_NORMAL
		special 0x15A
		setflag 0x02A
		setflag 0x828
		setvar 0x4051 0x11
		setvar 0x4050 0x3
		clearflag 0x02B
		warpmuted 0x4 0x3 0xFF 0x04 0x04
		releaseall
		end

	EventScript_Percorso1_3_19_tile1_no:
		pause 0x1E
		showpokepic 0x3B5 0x0 0x6
		//sei sicuro?
		msgbox EventScript_Percorso1_3_19_tile1_text11 MSG_NORMAL
		special 0x15A
		msgbox EventScript_Percorso1_3_19_tile1_text7 MSG_YESNO
		compare 0x800D 0x1
		if 0x1 _call EventScript_Percorso1_3_19_tile1_yes
		if 0x0 _call EventScript_Percorso1_3_19_tile1_no
		releaseall
		end


	EventScript_Percorso1_3_19_tile1_mov1:
		.byte 0x2 
		.byte 0x65
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov2:
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x64
		.byte 0xFE
		
	EventScript_Percorso1_3_19_tile1_mov2a:
		.byte 0x01
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov3:
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
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov4:
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
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov5:
		.byte 0x14
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x13
		.byte 0x13
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov6:
		.byte 0x2 
		.byte 0x65
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov7:
		.byte 0x64
		.byte 0x17
		.byte 0x1F
		.byte 0x3 
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov8:
		.byte 0x64
		.byte 0x1D
		.byte 0x1F
		.byte 0x1F
		.byte 0x1E
		.byte 0x1F
		.byte 0x1F
		.byte 0x1F
		.byte 0x1F
		.byte 0x1F
		.byte 0x1F
		.byte 0x1F
		.byte 0x1F
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov8a:
		.byte 0x1A
		.byte 0x1D
		.byte 0x1C
		.byte 0x11
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov9:
		.byte 0x13
		.byte 0x66
		.byte 0xFE

	EventScript_Percorso1_3_19_tile1_mov10:
		.byte 0x3 
		.byte 0x1C
		.byte 0x1C
		.byte 0x1 
		.byte 0x1C
		.byte 0xFE

.global EventScript_Percorso1_3_19_tile2
EventScript_Percorso1_3_19_tile2:
	lockall
	applymovement 0x8 EventScript_Percorso1_3_19_tile2_mov1
	waitmovement 0x8
    msgbox EventScript_Percorso1_3_19_tile2_text1 MSG_NORMAL
    setvar 0x4050 0x3
	warp 0x04 0x04 0xFF 0x04 0x05
	releaseall
	end

	EventScript_Percorso1_3_19_tile2_mov1:
		.byte 0x1C
		.byte 0x2 
		.byte 0x62
		.byte 0x12
		.byte 0x12
		.byte 0xFE

.global EventScript_Percorso1_3_19_tile3
EventScript_Percorso1_3_19_tile3:
	lockall
	applymovement 0x8 EventScript_Percorso1_3_19_tile3_mov1
	waitmovement 0x8
    msgbox EventScript_Percorso1_3_19_tile2_text1 MSG_NORMAL
    setvar 0x4050 0x3
	warp 0x04 0x04 0xFF 0x04 0x05
	releaseall
	end

	EventScript_Percorso1_3_19_tile3_mov1:
		.byte 0x1C
		.byte 0x2 
		.byte 0x62
		.byte 0x12
		.byte 0x10
		.byte 0x12
		.byte 0xFE