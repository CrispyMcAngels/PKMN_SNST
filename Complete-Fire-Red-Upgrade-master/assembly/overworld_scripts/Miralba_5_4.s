.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global gMapScripts_Miralba_5_4
gMapScripts_Miralba_5_4:
	mapscript MAP_SCRIPT_ON_TRANSITION Miralba_5_4_MapScriptOnTransition
	mapscript MAP_SCRIPT_ON_RESUME Miralba_5_4_MapScriptOnResume
	mapscript MAP_SCRIPT_ON_FRAME_TABLE Miralba_5_4_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

		Miralba_5_4_MapScriptOnTransition:
			sethealingplace 0x2
			call Miralba_5_4_FollowerTip_Setup
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

		@First visit with the following Pokemon unlocked: the trainer waits in the middle of the center.
		@Flag 0x99C = tip given; temp var 0x4005 starts the tip on the first frame
		Miralba_5_4_FollowerTip_Setup:
			checkflag 0x99C
			if 0x1 _goto Miralba_5_4_FollowerTip_SetupEnd
			compare 0x501F 0x100
			if 0x5 _goto Miralba_5_4_FollowerTip_SetupEnd
			movesprite2 0x4 0x7 0x6
			spritebehave 0x4 0x8 @Faces the door instead of wandering
			setvar 0x4005 0x1
		Miralba_5_4_FollowerTip_SetupEnd:
			return

		Miralba_5_4_MapScriptOnFrame:
			levelscript 0x4005, 0x1, EventScript_Miralba_5_4_FollowerTip
			.hword MAP_SCRIPT_TERMIN

@The trainer shows the player the following Pokemon. If the option is off, it's turned on just for the
@demo: the Pokemon comes out of its ball, then goes back in and the option is left off (temp var 0x4006 = 1)
EventScript_Miralba_5_4_FollowerTip:
	lockall
	setvar 0x4005 0x0
	pause 0x10
	applymovement 0x4 Miralba_5_4_FollowerTip_mov_notice
	waitmovement 0x0
	msgbox EventScript_Miralba_5_4_FollowerTip_text_call MSG_NORMAL
	applymovement 0x4 Miralba_5_4_FollowerTip_mov_approach
	waitmovement 0x0
	setvar 0x4006 0x0
	checkflag 0x999
	if 0x1 _goto EventScript_Miralba_5_4_FollowerTip_Demo
	setflag 0x999
	setvar 0x4006 0x1
EventScript_Miralba_5_4_FollowerTip_Demo:
	msgbox EventScript_Miralba_5_4_FollowerTip_text_explain1 MSG_NORMAL
	call EventScript_FollowerMon_ComeOutOfBall
	msgbox EventScript_Miralba_5_4_FollowerTip_text_explain2 MSG_NORMAL
	compare 0x4006 0x1
	if 0x1 _goto EventScript_Miralba_5_4_FollowerTip_OptionOff
	msgbox EventScript_Miralba_5_4_FollowerTip_text_on MSG_NORMAL
	goto EventScript_Miralba_5_4_FollowerTip_Leave
EventScript_Miralba_5_4_FollowerTip_OptionOff:
	msgbox EventScript_Miralba_5_4_FollowerTip_text_off MSG_NORMAL
	call EventScript_FollowerMon_ReturnToBall
	clearflag 0x999 @The option stays as the player chose it
	clearflag 0x99A
EventScript_Miralba_5_4_FollowerTip_Leave:
	msgbox EventScript_Miralba_5_4_FollowerTip_text_bye MSG_NORMAL
	applymovement 0x4 Miralba_5_4_FollowerTip_mov_leave
	waitmovement 0x0
	setflag 0x99C
	releaseall
	end

Miralba_5_4_FollowerTip_mov_notice: @!
	.byte 0x62
	.byte 0xFE

Miralba_5_4_FollowerTip_mov_approach: @Down to (7,8), in front of the door
	.byte 0x10
	.byte 0x10
	.byte 0xFE

Miralba_5_4_FollowerTip_mov_leave: @Back to (13,6), above the trainer at (10,6)
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x13
	.byte 0x10
	.byte 0xFE

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
