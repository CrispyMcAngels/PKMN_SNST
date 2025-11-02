.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global EventScript_Passo_Tuono_1_128_NPC0
EventScript_Passo_Tuono_1_128_NPC0:
	trainerbattle0 0x0 0x40 0x0 Passo_Tuono_1_128_NPC0_text1 Passo_Tuono_1_128_NPC0_text2
	msgbox Passo_Tuono_1_128_NPC0_text3 MSG_NORMAL
	end

.global EventScript_Passo_Tuono_1_128_NPC1
EventScript_Passo_Tuono_1_128_NPC1:
	trainerbattle0 0x0 0x41 0x0 Passo_Tuono_1_128_NPC1_text1 Passo_Tuono_1_128_NPC1_text2
	msgbox Passo_Tuono_1_128_NPC1_text3 MSG_NORMAL
	end