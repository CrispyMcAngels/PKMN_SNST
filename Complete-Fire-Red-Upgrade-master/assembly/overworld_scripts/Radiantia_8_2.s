.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___SIGNs___

.global EventScript_Radiantia_8_2_Sign0
EventScript_Radiantia_8_2_Sign0:
	msgbox Radiantia_8_2_Sign0_text1 0x7
	end

//___NPCs___

.global EventScript_Radiantia_8_2_NPC0
EventScript_Radiantia_8_2_NPC0:
	lock
	faceplayer
	cry 0x1C2 0x0
	msgbox Radiantia_8_2_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_8_2_NPC1
EventScript_Radiantia_8_2_NPC1:
	lock
	faceplayer
	msgbox Radiantia_8_2_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_8_2_NPC2
EventScript_Radiantia_8_2_NPC2:
	lock
	faceplayer
	checkflag 0x973
	if 0x1 _goto EventScript_Radiantia_8_2_NPC2_P2
	msgbox Radiantia_8_2_NPC2_text1 MSG_NORMAL
	checkflag 0x821
	if 0x1 _goto EventScript_Radiantia_8_2_NPC2_P1
	release
	end

	EventScript_Radiantia_8_2_NPC2_P1:
	msgbox Radiantia_8_2_NPC2_text2 MSG_NORMAL
	giveitem 0xD2 0x1 MSG_OBTAIN
	pause 0x1E
	msgbox Radiantia_8_2_NPC2_text3 MSG_NORMAL
	setflag 0x973
	release
	end

	EventScript_Radiantia_8_2_NPC2_P2:
	msgbox Radiantia_8_2_NPC2_text3 MSG_NORMAL
	release
	end