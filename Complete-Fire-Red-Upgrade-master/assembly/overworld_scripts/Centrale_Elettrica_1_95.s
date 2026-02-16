.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Centrale_Elettrica_1_95_Sign0
EventScript_Centrale_Elettrica_1_95_Sign0:
	msgbox Centrale_Elettrica_1_95_Sign0_Text1 0x7
	end

.global EventScript_Centrale_Elettrica_0_13_Sign0
EventScript_Centrale_Elettrica_0_13_Sign0:
	msgbox Centrale_Elettrica_0_13_Sign0_Text1 0x7
	end

.global EventScript_Centrale_Elettrica_1_95_NPC2
EventScript_Centrale_Elettrica_1_95_NPC2:
	lock
	faceplayer
	msgbox Centrale_Elettrica_1_95_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Centrale_Elettrica_1_95_NPC3
EventScript_Centrale_Elettrica_1_95_NPC3:
	trainerbattle0 0x0 0x52 0x0 Centrale_Elettrica_1_95_NPC3_text1 Centrale_Elettrica_1_95_NPC3_text2
	msgbox Centrale_Elettrica_1_95_NPC3_text3 MSG_NORMAL
	release
	end

.global EventScript_Centrale_Elettrica_1_95_NPC4
EventScript_Centrale_Elettrica_1_95_NPC4:
	lock
	faceplayer
	msgbox Centrale_Elettrica_1_95_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Centrale_Elettrica_1_95_NPC5
EventScript_Centrale_Elettrica_1_95_NPC5:
	lock
	faceplayer
	msgbox Centrale_Elettrica_1_95_NPC5_text1 MSG_NORMAL
	pause 0x1E
	msgbox Centrale_Elettrica_1_95_NPC5_text2 MSG_NORMAL
	release
	end