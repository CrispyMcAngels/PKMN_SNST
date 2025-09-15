.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___NPCs___

.global EventScript_Radiantia_8_5_NPC1
EventScript_Radiantia_8_5_NPC1:
	lock
	faceplayer
	msgbox Radiantia_8_5_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_8_5_NPC2
EventScript_Radiantia_8_5_NPC2:
	lock
	faceplayer
	msgbox Radiantia_8_5_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_8_5_NPC3
EventScript_Radiantia_8_5_NPC3:
	lock
	faceplayer
	msgbox Radiantia_8_5_NPC3_text1 MSG_NORMAL
	release
	end