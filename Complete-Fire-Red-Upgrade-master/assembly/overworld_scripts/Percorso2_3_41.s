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
			show_mugshot CRISPY
			//aaa
			
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text1 MSG_NORMAL
			special 0x15A
			pause 0x1E
			giveitem 0x169 0x1 MSG_OBTAIN
			pause 0x1E
			setvar 0x4051 0x23
			pause 0x1E
			show_mugshot CRISPY
			special 0x15A
			show_mugshot CRISPY
			
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text2 MSG_NORMAL
			special 0x15A
			pause 0x1E
			show_mugshot PLAYER
			special 0x15A
			show_mugshot PLAYER
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text3 MSG_NORMAL			
			special 0x15A
			pause 0x1E
			show_mugshot PLAYER
			special 0x15A
			compare 0x501F 0x100
			show_mugshot PLAYER
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
			sound 0x15
			applymovement 0xFF mov_exclamation
			waitmovement 0xFF
			pause 0x1E
			show_mugshot UNKNOWN_MAN_2
			special 0x15A
			show_mugshot UNKNOWN_MAN_2
			
    		msgbox EventScript_Percorso2_3_41_tile0_text1 MSG_NORMAL
			closeonkeypress
			special 0x15A
			pause 0x1E
			applymovement 0x6 Percorso2_3_41_MapScriptOnFrameBegin_P2_mov4
			waitmovement 0x0
			applymovement 0xFF Percorso2_3_41_MapScriptOnFrameBegin_P2_mov5
			waitmovement 0x0
			sound 0x15
			applymovement 0xFF Percorso2_3_41_MapScriptOnFrameBegin_P2_mov5_a
			waitmovement 0x0
			show_mugshot PLAYER
			
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
				.byte 0xFE

			Percorso2_3_41_MapScriptOnFrameBegin_P2_mov5_a:
				.byte 0x63
				.byte 0x18
				.byte 0xFE

		Percorso2_3_41_MapScriptOnFrame_P3:
			lockall
			pause 0x1E
			pause 0x1E
			show_mugshot CRISPY
			special 0x15A
			show_mugshot CRISPY
			
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text5 MSG_NORMAL
			special 0x15A
			pause 0x1E
			show_mugshot PLAYER
			special 0x15A
			show_mugshot PLAYER
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text6 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0x1 mov_exclamation
			waitmovement 0x0
			show_mugshot CRISPY
			special 0x15A
			show_mugshot CRISPY
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
			warpmuted 0x01 0x22 0xFF 0x05 0x06
			release
			end
			
		Percorso2_3_41_MapScriptOnFrame_P4:	
			lockall
			pause 0x1E
			show_mugshot CRISPY
			special 0x15A	
			show_mugshot CRISPY
			
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text8 MSG_NORMAL
			special 0x15A			
			pause 0x1E
			show_mugshot PLAYER
			special 0x15A
			show_mugshot PLAYER
			msgbox Percorso2_3_41_MapScriptOnFrameBegin_text3 MSG_NORMAL
			special 0x15A
			pause 0x1E
			show_mugshot CRISPY
			special 0x15A
			show_mugshot CRISPY
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
	show_mugshot DUSK_GRUNT_M
	msgbox Percorso_2_3_41_NPC1_2_text1 MSG_NORMAL
    special 0x15A
	release
	end

.global EventScript_Percorso_2_3_41_NPC2
EventScript_Percorso_2_3_41_NPC2:
	lock
	faceplayer
	pause 0x1E
	show_mugshot DUSK_GRUNT_F
	msgbox Percorso_2_3_41_NPC1_2_text1 MSG_NORMAL
    special 0x15A
	release
	end

.global EventScript_Percorso_2_3_41_NPC3
EventScript_Percorso_2_3_41_NPC3:

	trainerbattle0 0x0 0x3 0x0 Percorso_2_3_41_NPC3_text1 Percorso_2_3_41_NPC3_text2
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
	call EventScript_FollowerMon_CutsceneHideInstant
	playsong 0x0 0x0
	pause 0x1E
	sound 0x15
	applymovement 0xFF mov_question
	waitmovement 0x0
	pause 0x1E
	movesprite 0x6 0x1C 0x01
	sound 0x09
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov1
	waitmovement 0x6
	applymovement 0xFF 	EventScript_Percorso2_3_41_tile0_mov2
	waitmovement 0xFF
	sound 0x15
	applymovement 0xFF 	mov_exclamation
	waitmovement 0xFF
	pause 0x1E
	show_mugshot UNKNOWN_MAN_2
	
    msgbox EventScript_Percorso2_3_41_tile0_text1 MSG_NORMAL
	closeonkeypress
    special 0x15A
	pause 0x1E
	sound 0x15
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov3
	waitmovement 0x6
	hidesprite 0x6
	pause 0x1E
	spriteface 0xFF 0x1
	show_mugshot PLAYER
    msgbox EventScript_Percorso2_3_41_tile0_text2 MSG_NORMAL
    special 0x15A
	setvar 0x4051 0x18
	fadedefault
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
	call EventScript_FollowerMon_CutsceneHideInstant
	playsong 0x0 0x0
	movesprite 0x6 0x1D 0x01
	sound 0x09
	applymovement 0x6 EventScript_Percorso2_3_41_tile0_mov1
	waitmovement 0x6
	applymovement 0xFF 	EventScript_Percorso2_3_41_tile0_mov2
	waitmovement 0xFF
	pause 0x1E
	show_mugshot UNKNOWN_MAN_2
	
    msgbox EventScript_Percorso2_3_41_tile0_text1 MSG_NORMAL
	closeonkeypress
    special 0x15A
	sound 015
	applymovement 0x6 EventScript_Percorso2_3_41_tile1_mov3
	waitmovement 0x6
	hidesprite 0x6
	pause 0x1E
	spriteface 0xFF 0x1
	compare 0x501F 0x100
	show_mugshot PLAYER
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
	sound 0x15
	applymovement 0x9 EventScript_Percorso2_3_41_tile2_mov1_a
	waitmovement 0x0
	show_mugshot RAITO
	
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
		.byte 0xFE

	EventScript_Percorso2_3_41_tile2_mov1_a:		
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
	show_mugshot PLAYER
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

@Behind the Cut tree: tells the player about the special grass (encounter type 5: 50% chance of a wild
@double battle, only with at least 2 Pokemon able to fight)
.global EventScript_Percorso_2_3_41_DoubleGrass
EventScript_Percorso_2_3_41_DoubleGrass:
	lock
	faceplayer
	msgbox Percorso_2_3_41_DoubleGrass_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_2_3_41_NPC10
EventScript_Percorso_2_3_41_NPC10:
	giveitem 0xD 0x1 MSG_FIND
	end
	
.global EventScript_Percorso_2_3_41_NPC11
EventScript_Percorso_2_3_41_NPC11:
	giveitem 0x40 0x1 MSG_FIND
	end

@"Consegna lampo" side quest (src/courier_quest.c): the officer lends the player his Rapidash to bring a parcel
@to the scientist on Percorso 4 (map 3.22, NPC 8) within COURIER_QUEST_MAX_STEPS steps.
@Var 0x5042: 0 = not delivering, 1 = delivering, 2 = delivered. Flag 0x34C = quest started (side quest list),
@flag 0x34D = completed (the red clothes in the wardrobe).
.global EventScript_Percorso_2_3_41_Courier
EventScript_Percorso_2_3_41_Courier:
	lock
	faceplayer
	checkflag 0x34D
	if 0x1 _goto EventScript_Percorso_2_3_41_Courier_Done
	compare 0x5042 0x2
	if 0x1 _goto EventScript_Percorso_2_3_41_Courier_Reward
	compare 0x5042 0x1
	if 0x1 _goto EventScript_Percorso_2_3_41_Courier_Hurry
	checkflag 0x34C
	if 0x1 _goto EventScript_Percorso_2_3_41_Courier_Retry
	msgbox Percorso_2_3_41_Courier_text_intro MSG_YESNO
	goto EventScript_Percorso_2_3_41_Courier_Answer

	EventScript_Percorso_2_3_41_Courier_Retry:
		msgbox Percorso_2_3_41_Courier_text_retry MSG_YESNO

	EventScript_Percorso_2_3_41_Courier_Answer:
		compare 0x800D 0x0
		if 0x1 _goto EventScript_Percorso_2_3_41_Courier_Refuse
		setflag 0x34C
		callasm CourierQuest_BufferMaxSteps
		msgbox Percorso_2_3_41_Courier_text_rules MSG_NORMAL
		cry 0x4E 0x0
		waitcry
		callasm CourierQuest_Start @On Rapidash, bike speed and music, the steps start counting
		msgbox Percorso_2_3_41_Courier_text_mount MSG_NORMAL
		release
		end

	EventScript_Percorso_2_3_41_Courier_Refuse:
		msgbox Percorso_2_3_41_Courier_text_refuse MSG_NORMAL
		release
		end

	EventScript_Percorso_2_3_41_Courier_Hurry:
		msgbox Percorso_2_3_41_Courier_text_hurry MSG_NORMAL
		release
		end

	EventScript_Percorso_2_3_41_Courier_Reward:
		msgbox Percorso_2_3_41_Courier_text_thanks MSG_NORMAL
		fanfare 0x0101
		msgbox Percorso_2_3_41_Courier_text_obtain MSG_NORMAL
		setflag 0x34D @Quest completed: red clothes in the wardrobe
		setvar 0x5042 0x0
		pause 0x1E
		msgbox Percorso_2_3_41_Courier_text_wardrobe MSG_NORMAL
		release
		end

	EventScript_Percorso_2_3_41_Courier_Done:
		msgbox Percorso_2_3_41_Courier_text_done MSG_NORMAL
		release
		end

@Started by src/courier_quest.c while delivering: B or Select pressed
.global EventScript_CourierQuest_AskQuit
EventScript_CourierQuest_AskQuit:
	lockall
	msgbox CourierQuest_text_ask_quit MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_CourierQuest_Quit
	releaseall
	end

@Started by src/courier_quest.c while delivering: a door or warp into a building
.global EventScript_CourierQuest_AskQuitIndoor
EventScript_CourierQuest_AskQuitIndoor:
	lockall
	msgbox CourierQuest_text_indoor MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_CourierQuest_Quit
	releaseall
	end

EventScript_CourierQuest_Quit:
	callasm CourierQuest_Cancel @Off Rapidash, the quest can be started again from the officer
	cry 0x4E 0x0
	waitcry
	msgbox CourierQuest_text_quit MSG_NORMAL
	releaseall
	end

@Started by src/courier_quest.c while delivering: COURIER_QUEST_WARNING_1/2 steps left ([BUFFER1])
.global EventScript_CourierQuest_Warning
EventScript_CourierQuest_Warning:
	lockall
	msgbox CourierQuest_text_warning MSG_NORMAL
	releaseall
	end

@Started by src/courier_quest.c while delivering: no steps left. Back to the officer, on foot
.global EventScript_CourierQuest_TooLate
EventScript_CourierQuest_TooLate:
	lockall
	msgbox CourierQuest_text_too_late MSG_NORMAL
	fadescreen 0x1
	callasm CourierQuest_Cancel
	warp 0x3 0x29 0xFF 0x19 0x19 @Percorso 2, in front of the officer
	end
