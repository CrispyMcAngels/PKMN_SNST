.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Borgo_Ponente_4_0_Sign0
EventScript_Borgo_Ponente_4_0_Sign0:
	msgbox Borgo_Ponente_4_0_Sign0_text1 0x7
	end

.global EventScript_Borgo_Ponente_4_0_Armadio
EventScript_Borgo_Ponente_4_0_Armadio:
	checkflag 0x964
	if 0x1 _goto EventScript_Borgo_Ponente_4_0_Armadio_Arancione
	msgbox Borgo_Ponente_4_0_Armadio_text1 MSG_NORMAL
	end

	EventScript_Borgo_Ponente_4_0_Armadio_Arancione:
		msgbox Borgo_Ponente_4_0_Armadio_Arancione_text1 MSG_NORMAL

		//setvar 0x8006 0x0
		//loadpointer 0x0 blu_ow_text
		//special 0x25
		//setvar 0x8006 0x1
		//loadpointer 0x0 orange_ow_text
		//special 0x25

		preparemsg armadio_msg
		waitmsg
		//multichoice 0x0 0x0 0x20 0x0
		
		setvar 0x8000 0x0 
		setvar 0x8001 0x3
		special 0x158
		waitstate
		compare 0x800D 0x7F 
		if 0x1 _goto Set_OW_canceled
		compare 0x800D 0x0
		if 0x1 _goto Set_blue_OW
		compare 0x800D 0x1
		if 0x1 _goto Set_orange_OW
		end

			Set_blue_OW:
				compare 0x501F 0x100 
				if 0x1 _goto Already_Blue_OW
				setvar 0x501F 0x100
				warp 0x4 0x0 0xFF 0x8 0x3 
				end

				Already_Blue_OW:
					msgbox Borgo_Ponente_4_0_Armadio_already_blue_text1 MSG_NORMAL
					end

			Set_orange_OW:
				compare 0x501F 0x107 
				if 0x1 _goto Already_Orange_OW
				setvar 0x501F 0x107
				warp 0x4 0x0 0xFF 0x8 0x3 
				end

				Already_Orange_OW:
					msgbox Borgo_Ponente_4_0_Armadio_already_orange_text1 MSG_NORMAL
					end

			Set_OW_canceled:
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
	
	textcolor 0x01
    showpokepic 0x3B3 0x0 0x6
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
	textcolor 0x01
    showpokepic 0x3b3 0x0 0x6
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
	textcolor 0x01
	showpokepic 0x3b3 0x0 0x6
	msgbox EventScript_Borgo_Ponente_4_0_mom_text2 MSG_NORMAL
	special 0x15A
	fadescreen 0x1 
	fanfare 0x0100
	waitfanfare
	special 0x0
	fadescreen 0x0
	textcolor 0x01
	showpokepic 0x3b3 0x0 0x6
	msgbox EventScript_Borgo_Ponente_4_0_mom_text3 MSG_NORMAL
	special 0x15A
	release
	end


	EventScript_Borgo_Ponente_4_0_mom_P1:
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text1 MSG_NORMAL
		special 0x15A
		release
		end

	EventScript_Borgo_Ponente_4_0_mom_P1a:
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text1 MSG_NORMAL
		special 0x15A
		applymovement 0x1 Borgo_Ponente_4_0_mom_mov1
		waitmovement 0x1
		pause 0x1E
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		textcolor 0x02
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text3 MSG_NORMAL
		pause 0x1E
		showpokepic 0x297 0xA 0x5
		cry 0x297 0x0
		pause 0x1E
		special 0x15A
		pause 0x1E
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
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
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text5 MSG_NORMAL
		special 0x15A
		pause 0x1e
		applymovement 0x1 Borgo_Ponente_4_0_mom_mov1
		waitmovement 0x1
		pause 0x1e
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text6 MSG_NORMAL
		special 0x15A
		//vestiti arancioni
		fanfare 0x0101
		textcolor 0x02
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text7 MSG_NORMAL
		pause 0x1E
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_P1a_text8 MSG_NORMAL
		special 0x15A
		setflag 0x964
		clearflag 0x963
		checkflag 0x95B
		if 0x1 _call EventScript_Borgo_Ponente_4_0_mom_P2
		release
		end

		Borgo_Ponente_4_0_mom_mov1:
			.byte 0x62
			.byte 0xFE


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
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text4 MSG_NORMAL
		special 0x15A
		pause 0x1E
		textcolor 0x00
		showpokepic 0x3b6 0x15 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text5 MSG_NORMAL
		special 0x15A
		pause 0x1E		
		applymovement 0x1 Borgo_Ponente_4_0_mom_P3_mov1
		waitmovement 0x0
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text6 MSG_NORMAL
		special 0x15A		
		pause 0x1E
		fanfare 0x0101
		textcolor 0x02
		msgbox EventScript_Borgo_Ponente_4_0_mom_text7 MSG_NORMAL
		waitfanfare
		setflag 0x82F
		pause 0x1E
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text8 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x1 Borgo_Ponente_4_0_mom_P3_mov2
		waitmovement 0x0
		faceplayer
		textcolor 0x01
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text9 MSG_NORMAL
		special 0x15A
		pause 0x1E
		fadescreen 0x1
		setvar 0x501F 0x12E
		setvar 0x4051 0x29
		setvar 0x4050 0x6
		playsong 0x0 0x0
		textcolor 0x02
		writebytetooffset 0x30 0x4000012
		msgbox EventScript_Borgo_Ponente_4_0_mom_text10 0x7
		writebytetooffset 0x0 0x4000012
		warpmuted 0x04 0x01 0xFF 0x02 0x05
		release
		end			

		Borgo_Ponente_4_0_mom_P3_mov1:
			.byte 0x62
			.byte 0xFE

		Borgo_Ponente_4_0_mom_P3_mov2:
			.byte 0x2 
			.byte 0x1B
			.byte 0x1B
			.byte 0xFE
