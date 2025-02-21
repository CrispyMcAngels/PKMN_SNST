.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
	
.global EventScript_Miralba_5_3_NPC1
EventScript_Miralba_5_3_NPC1:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_3_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_5_3_NPC2
EventScript_Miralba_5_3_NPC2:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_3_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_5_3_Sign0
EventScript_Miralba_5_3_Sign0:
	msgbox Miralba_5_3_Sign0_text1 0x7
	end