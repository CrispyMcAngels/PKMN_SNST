.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global EventScript_Pozzo_eco_1_31_NPC0
EventScript_Pozzo_eco_1_31_NPC0:
	lock
	faceplayer
	//Bambino: Sigh.. Sigh...
	msgbox Pozzo_Eco_1_31_NPC0_text1 MSG_NORMAL
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	//Hei piccolino, stai bene?
	msgbox Pozzo_Eco_1_31_NPC0_text2 MSG_NORMAL
	special 0x15A
	pause 0x1E
	//Ero sceso...
	msgbox Pozzo_Eco_1_31_NPC0_text3 MSG_NORMAL
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	//Non preoccuparti...
	msgbox Pozzo_Eco_1_31_NPC0_text4 MSG_NORMAL
	special 0x15A
	setflag 0x952
	setflag 0x962
	clearflag 0x951
	setvar 0x4051 0x16
	setvar 0x4050 0x3
	warpmuted 0x3 0x1 0xFF 0x13 0x09
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