.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
	

.global EventScript_Miralba_5_2_Sign1
EventScript_Miralba_5_2_Sign1:
	msgbox EventScript_Miralba_5_2_Sign1_text1 0x7
	end

.global EventScript_Miralba_5_2_NPC0
EventScript_Miralba_5_2_NPC0:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_2_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_5_2_NPC1
EventScript_Miralba_5_2_NPC1:
	lock
	faceplayer
	checkflag 0x966
	if 0x1 _goto EventScript_Miralba_5_2_NPC1_P5
	checkflag 0x965
	if 0x1 _goto EventScript_Miralba_5_2_NPC1_P2
	msgbox EventScript_Miralba_5_2_NPC1_text1 MSG_NORMAL
	pause 0x1E
	lock
	fanfare 0x0102
	textcolor 0x2
	msgbox Mission_Received_text1 MSG_NORMAL
	setflag 0x965
	release
	end

	EventScript_Miralba_5_2_NPC1_P2:
		msgbox EventScript_Miralba_5_2_NPC1_text2 MSG_YESNO
		compare 0x800D 0x1
		if 0x1 _call EventScript_Miralba_5_2_NPC1_P2_YES
		if 0x0 _call EventScript_Miralba_5_2_NPC1_P2_NO
		release
		end

		EventScript_Miralba_5_2_NPC1_P2_NO:
			msgbox EventScript_Miralba_5_2_NPC1_text3 MSG_NORMAL
			release
			end

		EventScript_Miralba_5_2_NPC1_P2_YES:
			setvar 0x8003 0x0
			setvar 0x8004 0x0
			special2 0x800D 0x18
			compare 0x800D 0x30C
			If 0x1 _goto EventScript_Miralba_5_2_NPC1_P3_0
			setvar 0x8004 0x1
			special2 0x800D 0x18
			compare 0x800D 0x30C
			If 0x1 _goto EventScript_Miralba_5_2_NPC1_P3_1
			setvar 0x8004 0x2
			special2 0x800D 0x18
			compare 0x800D 0x30C
			If 0x1 _goto EventScript_Miralba_5_2_NPC1_P3_2
			setvar 0x8004 0x3
			special2 0x800D 0x18
			compare 0x800D 0x30C
			If 0x1 _goto EventScript_Miralba_5_2_NPC1_P3_3
			setvar 0x8004 0x4
			special2 0x800D 0x18
			compare 0x800D 0x30C
			If 0x1 _goto EventScript_Miralba_5_2_NPC1_P3_4
			setvar 0x8004 0x5
			special2 0x800D 0x18
			compare 0x800D 0x30C
			If 0x1 _goto EventScript_Miralba_5_2_NPC1_P3_5
			msgbox EventScript_Miralba_5_2_NPC1_text4 MSG_NORMAL
			release
			end


			EventScript_Miralba_5_2_NPC1_P3_0:
				setvar 0x8004 0x0
				special 0x62
				compare 0x8004 0x0
				if 0x1 _goto EventScript_Miralba_5_2_NPC1_P4 
				release
				end
			
			EventScript_Miralba_5_2_NPC1_P3_1:
				setvar 0x8004 0x1
				special 0x62
				compare 0x8004 0x1
				if 0x1 _goto EventScript_Miralba_5_2_NPC1_P4 
				release
				end			
			
			EventScript_Miralba_5_2_NPC1_P3_2:
				setvar 0x8004 0x2
				special 0x62
				compare 0x8004 0x2
				if 0x1 _goto EventScript_Miralba_5_2_NPC1_P4 
				release
				end
							
			EventScript_Miralba_5_2_NPC1_P3_3:
				setvar 0x8004 0x3
				special 0x62
				compare 0x8004 0x3
				if 0x1 _goto EventScript_Miralba_5_2_NPC1_P4 
				release
				end		
						
			EventScript_Miralba_5_2_NPC1_P3_4:
				setvar 0x8004 0x4
				special 0x62
				compare 0x8004 0x4
				if 0x1 _goto EventScript_Miralba_5_2_NPC1_P4 
				release
				end		
						
			EventScript_Miralba_5_2_NPC1_P3_5:
				setvar 0x8004 0x5
				special 0x62
				compare 0x8004 0x5
				if 0x1 _goto EventScript_Miralba_5_2_NPC1_P4 
				release
				end

			EventScript_Miralba_5_2_NPC1_P4:
				lock
				faceplayer
				spritebehave 0x2 0x8
				textcolor 0x2
				msgbox EventScript_Miralba_5_2_NPC1_text5 MSG_NORMAL
				pause 0x1E
				fanfare 0x0103
				lock
				textcolor 0x2
				msgbox Mission_Completed_text1 MSG_NORMAL
				spritebehave 0x2 0x8
				textcolor 0x1
				msgbox EventScript_Miralba_5_2_NPC1_text6 MSG_NORMAL
				pause 0x1E
				textcolor 0x2
				fanfare 0x0101
				spritebehave 0x2 0x8
				msgbox EventScript_Miralba_5_2_NPC1_text7 MSG_NORMAL
				pause 0x1E
				msgbox EventScript_Miralba_5_2_NPC1_text8 MSG_NORMAL
				setflag 0x966
				spritebehave 0x2 0x2
				release
				end

			EventScript_Miralba_5_2_NPC1_P5:
				msgbox EventScript_Miralba_5_2_NPC1_text9 MSG_NORMAL
				release
				end