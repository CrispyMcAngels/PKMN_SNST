.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Roccavento 7.0: house

.global EventScript_Roccavento_7_0_NPC0
EventScript_Roccavento_7_0_NPC0:
	lock
	faceplayer
	msgbox Roccavento_7_0_NPC0_text1 MSG_NORMAL
	release
	end

