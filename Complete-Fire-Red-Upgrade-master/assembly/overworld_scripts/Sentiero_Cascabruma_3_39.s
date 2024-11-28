.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Sentiero_Cascabruma_3_39_NPC1
EventScript_Sentiero_Cascabruma_3_39_NPC1:
	lock
	faceplayer
	msgbox Sentiero_Cascabruma_3_39_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Sentiero_Cascabruma_3_39_NPC0
EventScript_Sentiero_Cascabruma_3_39_NPC0:

	trainerbattle0 0x0 0x1F 0x0 Sentiero_Cascabruma_3_39_NPC0_text1 Sentiero_Cascabruma_3_39_NPC0_text2
	msgbox Sentiero_Cascabruma_3_39_NPC0_text3 MSG_NORMAL

	end


.global EventScript_Sentiero_Cascabruma_3_39_Sign1
EventScript_Sentiero_Cascabruma_3_39_Sign1:
	msgbox Sentiero_Cascabruma_3_39_Sign1_text1 MSG_SIGN
	end
