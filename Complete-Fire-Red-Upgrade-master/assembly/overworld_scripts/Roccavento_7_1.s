.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Roccavento 7.1: house of a mountaineer and his daughter

.global EventScript_Roccavento_7_1_NPC0
EventScript_Roccavento_7_1_NPC0:
	lock
	faceplayer
	msgbox Roccavento_7_1_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_7_1_NPC1
EventScript_Roccavento_7_1_NPC1:
	lock
	faceplayer
	msgbox Roccavento_7_1_NPC1_text1 MSG_NORMAL
	release
	end

