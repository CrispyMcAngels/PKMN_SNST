.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
	

//.global EventScript_Borgo_Ponente_4_2_Sign0
//EventScript_Borgo_Ponente_4_2_Sign0:
//	msgbox Borgo_Ponente_4_2_Sign0_text1 0x7
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
	checkflag 0x960
	if 0x1 _goto EventScript_Miralba_5_0_NPC2_P3
	checkflag 0x95F
	if 0x1 _goto EventScript_Miralba_5_0_NPC2_P2
	checkflag 0x95E
	if 0x1 _goto EventScript_Miralba_5_0_NPC2_P1
	msgbox EventScript_Miralba_5_0_NPC2_text1 MSG_NORMAL
	applymovement 0x3 Miralba_5_0_NPC2_mov1
	waitmovement 0x0
	pause 0x1E
	msgbox EventScript_Miralba_5_0_NPC2_text2 MSG_NORMAL
	setflag 0x95E
	fanfare 0x0102
	textcolor 0x2
	msgbox Mission_Received_text1 MSG_NORMAL
	release
	end

	EventScript_Miralba_5_0_NPC2_P1:
		msgbox EventScript_Miralba_5_0_NPC2_text3 MSG_NORMAL
		release
		end

		Miralba_5_0_NPC2_mov1:
			.byte 0x62
			.byte 0xFE

	EventScript_Miralba_5_0_NPC2_P2:
		msgbox EventScript_Miralba_5_0_NPC2_text4 MSG_NORMAL
		applymovement 0x3 Miralba_5_0_NPC2_mov1
		waitmovement 0x0
		giveitem 0x18E 0x1 MSG_OBTAIN
		setflag 0x960
		pause 0x1E
		fanfare 0x0103
		textcolor 0x2
		msgbox Mission_Completed_text1 MSG_NORMAL
		release
		end
		
	EventScript_Miralba_5_0_NPC2_P3:
		msgbox EventScript_Miralba_5_0_NPC2_text5 MSG_NORMAL
		release
		end