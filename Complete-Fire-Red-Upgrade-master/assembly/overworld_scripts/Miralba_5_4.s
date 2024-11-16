.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global gMapScripts_Miralba_5_4
gMapScripts_Miralba_5_4:
	mapscript MAP_SCRIPT_ON_TRANSITION Miralba_5_4_MapScriptOnTransition
	mapscript MAP_SCRIPT_ON_RESUME Miralba_5_4_MapScriptOnResume
    .byte MAP_SCRIPT_TERMIN

		Miralba_5_4_MapScriptOnTransition:
			sethealingplace 0x2
			compare 0x4051 0x1b
			if 0x1 _goto Miralba_5_4_MapScriptOnTransition_P1
			compare 0x4051 0x1D
			if 0x1 _goto Miralba_5_4_MapScriptOnTransition_P2
			end

			Miralba_5_4_MapScriptOnTransition_P1:
				//destroy FOLLOWER
				special 0xD2
				clearflag 0x959
				setvar 0x4051 0x1C
				end

			Miralba_5_4_MapScriptOnTransition_P2:
				setvar 0x4051 0x1E
				end

		Miralba_5_4_MapScriptOnResume:
			special 0x182
			end

.global EventScript_Miralba_5_4_NPC1
EventScript_Miralba_5_4_NPC1:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_4_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_5_4_NPC2
EventScript_Miralba_5_4_NPC2:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_4_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Miralba_5_4_NPC3
EventScript_Miralba_5_4_NPC3:
	lock
	faceplayer
	msgbox EventScript_Miralba_5_4_NPC3_text1 MSG_NORMAL
	release
	end