.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Wardrobe: one menu listing only the outfits the player owns.
@Blue is always available, orange with flag 0x964, green with flag 0x966.
@The chosen outfit is stored in var 0x4068 (0x0 blue, 0x1 orange, 0x2 green).
@The menu is CFRU's scrolling multichoice (special 0x158 with 0x8004 = 0, lists in src/scripting.c gScrollingSets):
@0x8000 = 0 Blue/Orange, 1 Blue/Green, 2 Blue/Orange/Green.
.global EventScript_Borgo_Ponente_4_0_Armadio
EventScript_Borgo_Ponente_4_0_Armadio:
	lock
	checkflag 0x964
	if 0x1 _goto EventScript_Borgo_Ponente_4_0_Armadio_HasOrange
	checkflag 0x966
	if 0x1 _goto EventScript_Borgo_Ponente_4_0_Armadio_BlueGreen
	msgbox Borgo_Ponente_4_0_Armadio_text1 MSG_NORMAL @Only the blue clothes: the wardrobe is empty
	release
	end

	EventScript_Borgo_Ponente_4_0_Armadio_HasOrange:
		setvar 0x8000 0x0 @Blue/Orange
		checkflag 0x966
		if 0x1 _call EventScript_Borgo_Ponente_4_0_Armadio_AllThree
		goto EventScript_Borgo_Ponente_4_0_Armadio_Menu

	EventScript_Borgo_Ponente_4_0_Armadio_AllThree:
		setvar 0x8000 0x2 @Blue/Orange/Green
		return

	EventScript_Borgo_Ponente_4_0_Armadio_BlueGreen:
		setvar 0x8000 0x1 @Blue/Green
		goto EventScript_Borgo_Ponente_4_0_Armadio_Menu

	EventScript_Borgo_Ponente_4_0_Armadio_Menu:
		msgbox Borgo_Ponente_4_0_Armadio_Arancione_text1 MSG_NORMAL
		preparemsg armadio_msg
		waitmsg
		setvar 0x8001 0x3 @Up to 3 options shown at once
		setvar 0x8004 0x0 @Special 0x158 is only CFRU's scrolling multichoice when 0x8004 is 0; other values freeze the script
		special 0x158
		waitstate
		compare 0x800D 0x7F
		if 0x1 _goto Set_OW_canceled
		compare 0x800D 0x0
		if 0x1 _goto Set_blue_OW
		compare 0x8000 0x1
		if 0x1 _goto Set_green_OW @In the Blue/Green list the second option is green
		compare 0x800D 0x1
		if 0x1 _goto Set_orange_OW
		goto Set_green_OW

			Set_blue_OW:
				compare 0x4068 0x0
				if 0x1 _goto Already_Blue_OW
				setvar 0x4068 0x0
				goto Set_OW_Reload

				Already_Blue_OW:
					msgbox Borgo_Ponente_4_0_Armadio_already_blue_text1 MSG_NORMAL
					release
					end

			Set_orange_OW:
				compare 0x4068 0x1
				if 0x1 _goto Already_Orange_OW
				setvar 0x4068 0x1
				goto Set_OW_Reload

				Already_Orange_OW:
					msgbox Borgo_Ponente_4_0_Armadio_already_orange_text1 MSG_NORMAL
					release
					end

			Set_green_OW:
				compare 0x4068 0x2
				if 0x1 _goto Already_Green_OW
				setvar 0x4068 0x2
				goto Set_OW_Reload

				Already_Green_OW:
					msgbox Borgo_Ponente_4_0_Armadio_already_green_text1 MSG_NORMAL
					release
					end

			@The outfit colours are palette swaps read from 0x4068 (dynamic_ow_pals.c, character_customization.c),
			@so the player keeps their own sprites; warping to the same spot reloads the palettes
			Set_OW_Reload:
				warp 0x4 0x0 0xFF 0x8 0x3
				end

			Set_OW_canceled:
				closeonkeypress
				release
				end


.global EventScript_Borgo_Ponente_4_0_tileA
EventScript_Borgo_Ponente_4_0_tileA:
	lockall
	compare 0x4051 0xC
	if 0x1 _call EventScript_Borgo_Ponente_4_0_tileA_P1
	releaseall
	end

EventScript_Borgo_Ponente_4_0_tileA_P1:
	applymovement 0x1 Borgo_Ponente_4_0_tileA_mov1
	waitmovement 0x0
	sound 0x15
	applymovement 0x1 Borgo_Ponente_4_0_tileA_mov1_a
	waitmovement 0x0
    show_mugshot MAMMA
    msgbox EventScript_Borgo_Ponente_4_0_tileA_text1 MSG_NORMAL
    special 0x15A
	pause 0x1E
	applymovement 0x1 Borgo_Ponente_4_0_tileA_mov2
	waitmovement 0x0
	setvar 0x4051 0xD
	releaseall
	end

Borgo_Ponente_4_0_tileA_mov1:
	.byte 0x1A
	.byte 0x3 
	.byte 0xFE

Borgo_Ponente_4_0_tileA_mov1_a:
	.byte 0x62
	.byte 0x1A
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x11
	.byte 0x11
	.byte 0xFE

Borgo_Ponente_4_0_tileA_mov2:
	.byte 0x10
	.byte 0x10
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0xFE

.global EventScript_Borgo_Ponente_4_0_tileB
EventScript_Borgo_Ponente_4_0_tileB:
	lockall
	compare 0x4051 0xC
	if 0x1 _call EventScript_Borgo_Ponente_4_0_tileB_P1
	releaseall
	end

EventScript_Borgo_Ponente_4_0_tileB_P1:
	pause 0x1E
	applymovement 0x1 Borgo_Ponente_4_0_tileB_mov1
	waitmovement 0x0
	sound 0x15
	applymovement 0x1 Borgo_Ponente_4_0_tileB_mov1_a
	waitmovement 0x0
    show_mugshot MAMMA
    msgbox EventScript_Borgo_Ponente_4_0_tileA_text1 MSG_NORMAL
    special 0x15A
	pause 0x1E
	applymovement 0x1 Borgo_Ponente_4_0_tileB_mov2
	waitmovement 0x0
	setvar 0x4051 0xD
	return

Borgo_Ponente_4_0_tileB_mov1:
	.byte 0x1A
	.byte 0x3 
	.byte 0xFE

Borgo_Ponente_4_0_tileB_mov1_a:
	.byte 0x62
	.byte 0x1A
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x11
	.byte 0x11
	.byte 0xFE

Borgo_Ponente_4_0_tileB_mov2:
	.byte 0x10
	.byte 0x10
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0xFE

.global EventScript_Borgo_Ponente_4_0_mom
EventScript_Borgo_Ponente_4_0_mom:
	lock
	faceplayer
	compare 0x4051 0xD
	if 0x1 _call EventScript_Borgo_Ponente_4_0_mom_P1
	compare 0x4051 0xE
	if 0x1 _call EventScript_Borgo_Ponente_4_0_mom_P1
	compare 0x4051 0xF
	if 0x1 _call EventScript_Borgo_Ponente_4_0_mom_P1
	checkflag 0x963
	if 0x1 _call EventScript_Borgo_Ponente_4_0_mom_P1a
	checkflag 0x95B
	if 0x1 _call EventScript_Borgo_Ponente_4_0_mom_P2
	
	show_mugshot MAMMA
	msgbox EventScript_Borgo_Ponente_4_0_mom_text2 MSG_NORMAL
	special 0x15A
	fadescreen 0x1 
	fanfare 0x0100
	waitfanfare
	special 0x0
	fadescreen 0x0
	
	show_mugshot MAMMA
	msgbox EventScript_Borgo_Ponente_4_0_mom_text3 MSG_NORMAL
	special 0x15A
	release
	end


	EventScript_Borgo_Ponente_4_0_mom_P1:
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_text1 MSG_NORMAL
		special 0x15A
		release
		end

	EventScript_Borgo_Ponente_4_0_mom_P1a:
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text1 MSG_NORMAL
		special 0x15A
		applymovement 0x1 mov_exclamation
		waitmovement 0x1
		pause 0x1E
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text3 MSG_NORMAL
		pause 0x1E
		showpokepic 0x297 0xA 0x5
		cry 0x297 0x0
		pause 0x1E
		special 0x15A
		pause 0x1E
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text4 MSG_NORMAL
		special 0x15A
		getplayerpos 0x4001 0x4002
		compare 0x4002 0x5
		if 0x1 _call Borgo_Ponente_4_0_mom_P1a_up
		compare 0x4002 0x6
		if 0x1 _call Borgo_Ponente_4_0_mom_P1a_right
		compare 0x4002 0x7
		if 0x1 _call Borgo_Ponente_4_0_mom_P1a_down
		pause 0x1e
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text5 MSG_NORMAL
		special 0x15A
		pause 0x1e
		sound 0x15
		applymovement 0x1 mov_exclamation
		waitmovement 0x1
		pause 0x1e
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text6 MSG_NORMAL
		special 0x15A
		//vestiti arancioni
		fanfare 0x0101
		
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text7 MSG_NORMAL
		pause 0x1E
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text8 MSG_NORMAL
		special 0x15A
		setflag 0x964
		clearflag 0x963
		checkflag 0x95B
		if 0x1 _call EventScript_Borgo_Ponente_4_0_mom_P2
		release
		end

		Borgo_Ponente_4_0_mom_P1a_up:
			applymovement 0xFF Borgo_Ponente_4_0_mom_P1_mov2
			waitmovement 0xFF
			return

			Borgo_Ponente_4_0_mom_P1_mov2:
				.byte 0x21
				.byte 0x21
				.byte 0x21
				.byte 0x21
				.byte 0xFE

		Borgo_Ponente_4_0_mom_P1a_right:
			applymovement 0xFF Borgo_Ponente_4_0_mom_P3_mov3
			waitmovement 0xFF
			return

			Borgo_Ponente_4_0_mom_P3_mov3:
				.byte 0x23
				.byte 0x23
				.byte 0x23
				.byte 0x23
				.byte 0xFE

		Borgo_Ponente_4_0_mom_P1a_down:
			applymovement 0xFF Borgo_Ponente_4_0_mom_P3_mov4
			waitmovement 0xFF
			return

			Borgo_Ponente_4_0_mom_P3_mov4:
				.byte 0x22
				.byte 0x22
				.byte 0x22
				.byte 0x22
				.byte 0xFE


	EventScript_Borgo_Ponente_4_0_mom_P2:
		checkflag 0x82F
		if 0x0 _goto EventScript_Borgo_Ponente_4_0_mom_P3
		return

	EventScript_Borgo_Ponente_4_0_mom_P3:
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_text4 MSG_NORMAL
		special 0x15A
		pause 0x1E
		show_mugshot PLAYER
		msgbox EventScript_Borgo_Ponente_4_0_mom_text5 MSG_NORMAL
		special 0x15A
		pause 0x1E	
		sound 0x15	
		applymovement 0x1 mov_exclamation
		waitmovement 0x0
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_text6 MSG_NORMAL
		special 0x15A		
		pause 0x1E
		fanfare 0x0101
		
		msgbox EventScript_Borgo_Ponente_4_0_mom_text7 MSG_NORMAL
		waitfanfare
		setflag 0x82F
		pause 0x1E
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_text8 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x1 Borgo_Ponente_4_0_mom_P3_mov2
		waitmovement 0x0
		faceplayer
		
		show_mugshot MAMMA
		msgbox EventScript_Borgo_Ponente_4_0_mom_text9 MSG_NORMAL
		special 0x15A
		pause 0x1E
		fadescreen 0x1
		setvar 0x501F 0x12E
		setvar 0x4051 0x29
		setvar 0x4050 0x6
		playsong 0x0 0x0
		
		writebytetooffset 0x30 0x4000012
		msgbox EventScript_Borgo_Ponente_4_0_mom_text10 0x7
		writebytetooffset 0x0 0x4000012
		warpmuted 0x04 0x01 0xFF 0x02 0x05
		release
		end			

		Borgo_Ponente_4_0_mom_P3_mov2:
			.byte 0x2 
			.byte 0x1B
			.byte 0x1B
			.byte 0xFE
