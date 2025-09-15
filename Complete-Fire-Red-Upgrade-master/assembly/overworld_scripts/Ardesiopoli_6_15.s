.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//NPCS____________________

.global EventScript_Ardesiopoli_6_15_NPC0
EventScript_Ardesiopoli_6_15_NPC0:
	lock
	faceplayer
	msgbox Ardesiopoli_6_15_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_15_NPC1
EventScript_Ardesiopoli_6_15_NPC1:
	lock
	faceplayer
	msgbox Ardesiopoli_6_15_NPC1_text1 MSG_NORMAL
	release
	end

//SIGNS___________________

	.global EventScript_Ardesiopoli_6_15_Sign0
	EventScript_Ardesiopoli_6_15_Sign0:
		msgbox Ardesiopoli_6_15_Sign0_text1 0x7
		end