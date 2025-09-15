.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//SIGNS___________________

	.global EventScript_Ardesiopoli_6_12_Sign0
	EventScript_Ardesiopoli_6_12_Sign0:
		msgbox Ardesiopoli_6_12_Sign0_text1 0x7
		end

	.global EventScript_Ardesiopoli_6_12_Sign1
	EventScript_Ardesiopoli_6_12_Sign1:
		msgbox Ardesiopoli_6_12_Sign1_text1 0x7
		end

	.global EventScript_Ardesiopoli_6_12_Sign3
	EventScript_Ardesiopoli_6_12_Sign3:
		msgbox Ardesiopoli_6_12_Sign3_text1 0x7
		end

//NPCS____________________

.global EventScript_Ardesiopoli_6_12_NPC0
EventScript_Ardesiopoli_6_12_NPC0:
	lock
	faceplayer
	msgbox Ardesiopoli_6_12_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_12_NPC1
EventScript_Ardesiopoli_6_12_NPC1:
	lock
	faceplayer
	msgbox Ardesiopoli_6_12_NPC1_text1 MSG_NORMAL
	release
	end
