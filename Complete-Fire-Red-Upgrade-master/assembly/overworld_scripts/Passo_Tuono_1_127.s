.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global EventScript_Passo_Tuono_1_127_NPC0
EventScript_Passo_Tuono_1_127_NPC0:
	trainerbattle0 0x0 0x3C 0x0 Passo_Tuono_1_127_NPC0_text1 Passo_Tuono_1_127_NPC0_text2
	msgbox Passo_Tuono_1_127_NPC0_text3 MSG_NORMAL
	end


.global EventScript_Passo_Tuono_1_127_NPC1
EventScript_Passo_Tuono_1_127_NPC1:
	trainerbattle0 0x0 0x3D 0x0 Passo_Tuono_1_127_NPC1_text1 Passo_Tuono_1_127_NPC1_text2
	msgbox Passo_Tuono_1_127_NPC1_text3 MSG_NORMAL
	end


.global EventScript_Passo_Tuono_1_127_NPC2
EventScript_Passo_Tuono_1_127_NPC2:
	trainerbattle0 0x0 0x3E 0x0 Passo_Tuono_1_127_NPC2_text1 Passo_Tuono_1_127_NPC2_text2
	msgbox Passo_Tuono_1_127_NPC2_text3 MSG_NORMAL
	end


.global EventScript_Passo_Tuono_1_127_NPC3
EventScript_Passo_Tuono_1_127_NPC3:
	trainerbattle0 0x0 0x3F 0x0 Passo_Tuono_1_127_NPC3_text1 Passo_Tuono_1_127_NPC3_text2
	msgbox Passo_Tuono_1_127_NPC3_text3 MSG_NORMAL
	end


.global EventScript_Passo_Tuono_1_127_NPC4
EventScript_Passo_Tuono_1_127_NPC4:
	lock
	faceplayer
	checkflag 0x097A
	if 0x1 _goto EventScript_Passo_Tuono_1_127_NPC4_P1
	msgbox Passo_Tuono_1_127_NPC4_text1 MSG_NORMAL
	release
	end

	EventScript_Passo_Tuono_1_127_NPC4_P1:
		msgbox Passo_Tuono_1_127_NPC4_text2 MSG_NORMAL
		release
		end

.global EventScript_Passo_Tuono_1_127_Sign4
EventScript_Passo_Tuono_1_127_Sign4:
	msgbox Passo_Tuono_1_127_Sign4_text1 0x7
	end

.global EventScript_Passo_Tuono_0_14_Sign0
EventScript_Passo_Tuono_0_14_Sign0:
	msgbox Passo_Tuono_0_14_Sign0_text1 0x7
	end