.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
	

//.global EventScript_Borgo_Ponente_4_2_Sign0
//EventScript_Borgo_Ponente_4_2_Sign0:
//	msgbox Borgo_Ponente_4_2_Sign0_text1 MSG_SIGN
//	end

.global EventScript_Miralba_5_0_NPC0
EventScript_Miralba_5_0_NPC0:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_0_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_5_0_NPC1
EventScript_Miralba_5_0_NPC1:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_0_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_5_0_NPC2
EventScript_Miralba_5_0_NPC2:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_0_NPC2_text1 MSG_NORMAL
	release
	end