.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
	

.global EventScript_Borgo_Ponente_4_2_Sign0
EventScript_Borgo_Ponente_4_2_Sign0:
	msgbox Borgo_Ponente_4_2_Sign0_text1 0x7
	end

.global EventScript_Borgo_Ponente_4_2
EventScript_Borgo_Ponente_4_2:
	compare 0x800C 0x4
	if 0x1 _call EventScript_Borgo_Ponente_4_2_Left
	compare 0x800C 0x2
	if 0x1 _call EventScript_Borgo_Ponente_4_2_Down
	compare 0x800C 0x3
	if 0x1 _call EventScript_Borgo_Ponente_4_2_Right
	releaseall
	end



EventScript_Borgo_Ponente_4_2_Left:
	lock
	faceplayer
	setflag 0x02A
    showpokepic 0x3B5 0x15 0x6
    msgbox EventScript_Borgo_Ponente_4_2_text1 MSG_NORMAL
    special 0x15A
	pause 0x1E
	textcolor 0x00
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
    msgbox EventScript_Borgo_Ponente_4_2_text2 MSG_NORMAL
    special 0x15A
	pause 0x1E
	sound 0x5
	applymovement 0x3 Borgo_Ponente_4_2_mov1a
	waitmovement 0x0
    showpokepic 0x3B5 0x15 0x6
	textcolor 0x1
    msgbox EventScript_Borgo_Ponente_4_2_text3 MSG_NORMAL
    special 0x15A
	pause 0x1E
	playsong 0x13C 0x0
	applymovement 0x3 Borgo_Ponente_4_2_mov2a
	waitmovement 0x0
	fadedefault
	hidesprite 0x3
	sound 0x9
	setflag 0x028
	setvar 0x4051 0xF
	return

Borgo_Ponente_4_2_mov1a:
	.byte 0x65
	.byte 0x54
	.byte 0x54
	.byte 0x54
	.byte 0xFE


Borgo_Ponente_4_2_mov2a:
	.byte 0x10
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x60
	.byte 0xFE


EventScript_Borgo_Ponente_4_2_Down:
	lock
	faceplayer
	setflag 0x02A
	textcolor 0x01
    showpokepic 0x3B5 0x15 0x6
    msgbox EventScript_Borgo_Ponente_4_2_text1 MSG_NORMAL
    special 0x15A
	pause 0x1E
	textcolor 0x00
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
    msgbox EventScript_Borgo_Ponente_4_2_text2 MSG_NORMAL
    special 0x15A
	pause 0x1E
	sound 0x5
	applymovement 0x3 Borgo_Ponente_4_2_mov1b
	waitmovement 0x0
    showpokepic 0x3B5 0x15 0x6
	textcolor 0x1
    msgbox EventScript_Borgo_Ponente_4_2_text3 MSG_NORMAL
    special 0x15A
	pause 0x1E
	playsong 0x13C 0x0
	applymovement 0x3 Borgo_Ponente_4_2_mov2b
	waitmovement 0x0
	fadedefault
	hidesprite 0x3
	sound 0x9
	setflag 0x028
	setvar 0x4051 0xF
	return

Borgo_Ponente_4_2_mov1b:
	.byte 0x65
	.byte 0x52
	.byte 0x52
	.byte 0x52
	.byte 0xFE


Borgo_Ponente_4_2_mov2b:
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x11
	.byte 0x12
	.byte 0x12
	.byte 0x12
	.byte 0x60
	.byte 0xFE


EventScript_Borgo_Ponente_4_2_Right:
	lock
	faceplayer
	setflag 0x02A
    showpokepic 0x3B5 0x15 0x6
    msgbox EventScript_Borgo_Ponente_4_2_text1 MSG_NORMAL
    special 0x15A
	pause 0x1E
	textcolor 0x00
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
    msgbox EventScript_Borgo_Ponente_4_2_text2 MSG_NORMAL
    special 0x15A
	pause 0x1E
	sound 0x5
	applymovement 0x3 Borgo_Ponente_4_2_mov1c
	waitmovement 0x0
    showpokepic 0x3B5 0x15 0x6
	textcolor 0x1
    msgbox EventScript_Borgo_Ponente_4_2_text3 MSG_NORMAL
    special 0x15A
	pause 0x1E
	playsong 0x13C 0x0
	applymovement 0x3 Borgo_Ponente_4_2_mov2b
	waitmovement 0x0
	fadedefault
	hidesprite 0x3
	sound 0x9
	setflag 0x028
	setvar 0x4051 0xF
	return

Borgo_Ponente_4_2_mov1c:
	.byte 0x65
	.byte 0x55
	.byte 0x55
	.byte 0x55
	.byte 0xFE


.global EventScript_Borgo_Ponente_4_2_NPC0
EventScript_Borgo_Ponente_4_2_NPC0:
	lock
	faceplayer
	compare 0x4051 0xE
	if 0x1 _call EventScript_Borgo_Ponente_4_2_NPC0_P1
	msgbox EventScript_Borgo_Ponente_4_2_NPC0_text1 MSG_NORMAL
	release
	end

	EventScript_Borgo_Ponente_4_2_NPC0_P1:
		msgbox EventScript_Borgo_Ponente_4_2_NPC0_text2 MSG_NORMAL
		release
		end	

.global EventScript_Borgo_Ponente_4_2_NPC1
EventScript_Borgo_Ponente_4_2_NPC1:
	lock
	faceplayer
	msgbox EventScript_Borgo_Ponente_4_2_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Borgo_Ponente_4_2_NPC3
EventScript_Borgo_Ponente_4_2_NPC3:
	lock
	faceplayer
	msgbox EventScript_Borgo_Ponente_4_2_NPC3_text1 MSG_NORMAL
	release
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