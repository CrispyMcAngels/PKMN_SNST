.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Borgo_Ponente_4_0_Sign0
EventScript_Borgo_Ponente_4_0_Sign0:
	msgbox Borgo_Ponente_4_0_Sign0_text1 MSG_SIGN
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
	checkflag 0x95B
	if 0x1 _call EventScript_Borgo_Ponente_4_0_mom_P2
	showpokepic 0x3b3 0x0 0x6
	msgbox EventScript_Borgo_Ponente_4_0_mom_text2 MSG_NORMAL
	special 0x15A
	fadescreen 0x1 
	fanfare 0x0100
	waitfanfare
	special 0x0
	fadescreen 0x0
	showpokepic 0x3b3 0x0 0x6
	msgbox EventScript_Borgo_Ponente_4_0_mom_text3 MSG_NORMAL
	special 0x15A
	release
	end


	EventScript_Borgo_Ponente_4_0_mom_P1:
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text1 MSG_NORMAL
		special 0x15A
		release
		end

	EventScript_Borgo_Ponente_4_0_mom_P2:
		checkflag 0x82F
		if 0x0 _goto EventScript_Borgo_Ponente_4_0_mom_P3
		return

	EventScript_Borgo_Ponente_4_0_mom_P3:
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text4 MSG_NORMAL
		special 0x15A
		pause 0x1E
		showpokepic 0x3b6 0x15 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text5 MSG_NORMAL
		special 0x15A
		pause 0x1E		
		applymovement 0x1 Borgo_Ponente_4_0_mom_P3_mov1
		waitmovement 0x0
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text6 MSG_NORMAL
		special 0x15A		
		pause 0x1E
		fanfare 0x0101
		msgbox EventScript_Borgo_Ponente_4_0_mom_text7 MSG_NORMAL
		waitfanfare
		setflag 0x82F
		pause 0x1E
		showpokepic 0x3b3 0x0 0x6
		msgbox EventScript_Borgo_Ponente_4_0_mom_text8 MSG_NORMAL
		special 0x15A
		release
		end			

		Borgo_Ponente_4_0_mom_P3_mov1:
			.byte 0x62
			.byte 0xFE
