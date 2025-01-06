.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
	

.global EventScript_Miralba_5_2_Sign1
EventScript_Miralba_5_2_Sign1:
	msgbox EventScript_Miralba_5_2_Sign1_text1 MSG_SIGN
	end

.global EventScript_Miralba_5_2_NPC0
EventScript_Miralba_5_2_NPC0:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_2_NPC0_text1 0x7
	release
	end

.global EventScript_Miralba_5_2_NPC1
EventScript_Miralba_5_2_NPC1:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_2_NPC1_text1 0x7
	release
	end
