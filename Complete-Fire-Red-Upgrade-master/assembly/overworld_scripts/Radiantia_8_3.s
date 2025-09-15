.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___SIGNs___

.global EventScript_Radiantia_8_3_Sign0
EventScript_Radiantia_8_3_Sign0:
	msgbox Radiantia_8_3_Sign0_text1 0x7
	end

//___NPCs___

.global EventScript_Radiantia_8_3_NPC0
EventScript_Radiantia_8_3_NPC0:
	lock
	faceplayer
	checkflag 0x970
	if 0x1 _goto EventScript_Radiantia_8_3_NPC0_P1
	msgbox Radiantia_8_3_NPC0_text1 MSG_NORMAL
	pause 0x1E
	msgbox Radiantia_8_3_NPC0_text2 MSG_NORMAL
	pause 0x1E
	applymovement 0x1 Radiantia_8_3_NPC0_mov1
	waitmovement 0x0
	pause 0x1E
	msgbox Radiantia_8_3_NPC0_text3 MSG_NORMAL
	setflag 0x970
	fanfare 0x0102
	textcolor 0x2
	msgbox Mission_Received_text1 MSG_NORMAL
	release
	end

	Radiantia_8_3_NPC0_mov1:
		.byte 0x62
		.byte 0xFE

	EventScript_Radiantia_8_3_NPC0_P1:
		msgbox Radiantia_8_3_NPC0_text4 MSG_NORMAL
		release
		end

.global EventScript_Radiantia_8_3_NPC1
EventScript_Radiantia_8_3_NPC1:
	lock
	faceplayer
	checkflag 0x971
	if 0x1 _goto EventScript_Radiantia_8_3_NPC1_P1
	msgbox Radiantia_8_3_NPC1_text1 MSG_NORMAL
	release
	end

	EventScript_Radiantia_8_3_NPC1_P1:
		msgbox Radiantia_8_3_NPC1_text2 MSG_NORMAL
		release
		end