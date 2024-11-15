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
	showpokepic 0x3B6 0x0 0x6
	//Hei piccolino, stai bene?
	msgbox Pozzo_Eco_1_31_NPC0_text2 MSG_NORMAL
	special 0x15A
	pause 0x1E
	//Ero sceso...
	msgbox Pozzo_Eco_1_31_NPC0_text3 MSG_NORMAL
	pause 0x1E
	showpokepic 0x3B6 0x0 0x6
	//Non preoccuparti...
	msgbox Pozzo_Eco_1_31_NPC0_text4 MSG_NORMAL
	special 0x15A
	setflag 0x952
	clearflag 0x951
	setvar 0x4051 0x16
	setvar 0x4050 0x3
	warpmuted 0x3 0x1 0xFF 0x13 0x09
	release
	end
