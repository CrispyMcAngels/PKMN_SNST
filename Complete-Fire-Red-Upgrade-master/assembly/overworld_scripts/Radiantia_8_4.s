.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___NPCs___

.global EventScript_Radiantia_8_4_NPC0
EventScript_Radiantia_8_4_NPC0:
	lock
	faceplayer
	msgbox Radiantia_8_4_NPC0_text1 MSG_NORMAL
	release
	end

