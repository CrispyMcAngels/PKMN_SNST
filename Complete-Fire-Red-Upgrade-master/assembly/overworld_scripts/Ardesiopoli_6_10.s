.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//NPCS____________________

.global EventScript_Ardesiopoli_6_10_NPC0
EventScript_Ardesiopoli_6_10_NPC0:
	lock
	faceplayer
	msgbox Ardesiopoli_6_10_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_10_NPC1
EventScript_Ardesiopoli_6_10_NPC1:
	lock
	faceplayer
	msgbox Ardesiopoli_6_10_NPC1_text1 MSG_NORMAL
	release
	end
