.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
.include "../asm_defines.s"

.equ FLAG_SHRINE_DOOR_OPEN, 0x1 @FLAG_TEMP_1: cleared on every map change, when the door closes again

//___NPCs___

@Local ID 5 (npc 4): one of the Monaci del Vento, guardian of the crossing, before the jump
.global EventScript_Santuario_del_Vento_1_59_NPC4
EventScript_Santuario_del_Vento_1_59_NPC4:
	lock
	faceplayer
	checkflag 0x9A0 @He has already explained the crossing
	if 0x1 _goto Santuario_del_Vento_1_59_NPC4_Again
	msgbox Santuario_del_Vento_1_59_NPC4_text1 MSG_NORMAL
	spriteface 0x5 0x2 @He looks at the void
	msgbox Santuario_del_Vento_1_59_NPC4_text2 MSG_NORMAL
	faceplayer
	msgbox Santuario_del_Vento_1_59_NPC4_text3 MSG_NORMAL
	setflag 0x9A0
	release
	end

Santuario_del_Vento_1_59_NPC4_Again:
	msgbox Santuario_del_Vento_1_59_NPC4_text4 MSG_NORMAL
	release
	end

//___SIGNs___

@The void above the path's tip (18,22): trust the wind, jump, fall, and get carried up to the shrine (18,13).
@The camera is detached (special 0x113), so the whole crossing plays as one shot, without a warp.
.global EventScript_Santuario_del_Vento_1_59_Sign2
EventScript_Santuario_del_Vento_1_59_Sign2:
	lockall
	msgbox Santuario_del_Vento_1_59_Sign2_text1 MSG_YESNO
	compare 0x800D 0x0
	if 0x1 _goto Santuario_del_Vento_1_59_Sign2_No
	closeonkeypress @Closes the question box right away
	call EventScript_FollowerMon_CutsceneHide
	special 0x113 @Camera stays here
	applymovement 0xFF Santuario_del_Vento_1_59_mov_jump
	waitmovement 0x0
	sound 0x25 @SE_FALL
	applymovement 0xFF Santuario_del_Vento_1_59_mov_fall
	waitmovement 0x0
	setvar 0x8004 0x0 @Light vertical rumble while she falls
	setvar 0x8005 0x4
	setvar 0x8006 0x8
	setvar 0x8007 0x3
	special 0x136
	pause 0x28
	sound 0x7D @Gust (as in Hurricane's animation)
	applymovement 0xFF Santuario_del_Vento_1_59_mov_carried @Hidden, under the shrine's edge
	waitmovement 0x0
	applymovement 0x7F Santuario_del_Vento_1_59_mov_camera @The camera follows the wind up the gap
	pause 0x30
	sound 0x7E @Second gust
	waitmovement 0x0
	applymovement 0xFF Santuario_del_Vento_1_59_mov_land
	waitmovement 0x0
	setvar 0x8004 0x0 @Landing thud
	setvar 0x8005 0x2
	setvar 0x8006 0x4
	setvar 0x8007 0x2
	special 0x136
	pause 0x10
	special 0x114 @Camera back on the player (already centred on her)
	call EventScript_FollowerMon_CutsceneEnd @Out of its ball again, if it was following
	releaseall
	end

Santuario_del_Vento_1_59_Sign2_No:
	releaseall
	end

@(18,23) -> (18,21): a leap off the tip, facing up, a short hang in the air
Santuario_del_Vento_1_59_mov_jump:
	.byte 0x4C @Lock facing
	.byte 0x15 @Jump 2 up
	.byte 0x1B @Delay 8
	.byte 0xFE

@(18,21) -> (18,22): the drop, then out of sight
Santuario_del_Vento_1_59_mov_fall:
	.byte 0x39 @Slide fast down
	.byte 0x60 @Invisible
	.byte 0xFE

@(18,22) -> (18,15), invisible
Santuario_del_Vento_1_59_mov_carried:
	.byte 0x3A, 0x3A, 0x3A, 0x3A, 0x3A, 0x3A, 0x3A @Slide fast up x7
	.byte 0xFE

@Camera (18,23) -> (18,13), through the cloud
Santuario_del_Vento_1_59_mov_camera:
	.byte 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11 @Walk up x10
	.byte 0xFE

@(18,15) -> (18,13): rises out of the void and lands on the edge
Santuario_del_Vento_1_59_mov_land:
	.byte 0x61 @Visible
	.byte 0x3A @Slide fast up
	.byte 0x4F @Jump 1 up
	.byte 0x4D @Unlock facing
	.byte 0xFE

@The void below the shrine's edge (18,14): the way back. Jump down, fall, and the wind sets her down on the path's tip (18,23)
.global EventScript_Santuario_del_Vento_1_59_Sign1
EventScript_Santuario_del_Vento_1_59_Sign1:
	lockall
	msgbox Santuario_del_Vento_1_59_Sign2_text1 MSG_YESNO
	compare 0x800D 0x0
	if 0x1 _goto Santuario_del_Vento_1_59_Sign2_No
	closeonkeypress @Closes the question box right away
	call EventScript_FollowerMon_CutsceneHide
	special 0x113 @Camera stays here
	applymovement 0xFF Santuario_del_Vento_1_59_mov_back_jump
	waitmovement 0x0
	sound 0x25 @SE_FALL
	applymovement 0xFF Santuario_del_Vento_1_59_mov_back_fall
	waitmovement 0x0
	setvar 0x8004 0x0 @Light vertical rumble while she falls
	setvar 0x8005 0x4
	setvar 0x8006 0x8
	setvar 0x8007 0x3
	special 0x136
	pause 0x28
	sound 0x7D @Gust
	applymovement 0xFF Santuario_del_Vento_1_59_mov_back_carried @Hidden, just above the path's tip
	waitmovement 0x0
	applymovement 0x7F Santuario_del_Vento_1_59_mov_back_camera @The camera follows the wind down the gap
	pause 0x30
	sound 0x7E @Second gust
	waitmovement 0x0
	applymovement 0xFF Santuario_del_Vento_1_59_mov_back_land
	waitmovement 0x0
	setvar 0x8004 0x0 @Landing thud
	setvar 0x8005 0x2
	setvar 0x8006 0x4
	setvar 0x8007 0x2
	special 0x136
	pause 0x10
	special 0x114 @Camera back on the player (already centred on her)
	call EventScript_FollowerMon_CutsceneEnd @Out of its ball again, if it was following
	releaseall
	end

@(18,13) -> (18,15): a leap off the edge, facing down, a short hang in the air
Santuario_del_Vento_1_59_mov_back_jump:
	.byte 0x4C @Lock facing
	.byte 0x14 @Jump 2 down
	.byte 0x1B @Delay 8
	.byte 0xFE

@(18,15) -> (18,16): the drop, then out of sight
Santuario_del_Vento_1_59_mov_back_fall:
	.byte 0x39 @Slide fast down
	.byte 0x60 @Invisible
	.byte 0xFE

@(18,16) -> (18,21), invisible
Santuario_del_Vento_1_59_mov_back_carried:
	.byte 0x39, 0x39, 0x39, 0x39, 0x39 @Slide fast down x5
	.byte 0xFE

@Camera (18,13) -> (18,23), through the cloud
Santuario_del_Vento_1_59_mov_back_camera:
	.byte 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10 @Walk down x10
	.byte 0xFE

@(18,21) -> (18,23): out of the void and onto the path's tip
Santuario_del_Vento_1_59_mov_back_land:
	.byte 0x61 @Visible
	.byte 0x39 @Slide fast down
	.byte 0x4E @Jump 1 down
	.byte 0x4D @Unlock facing
	.byte 0xFE

@The shrine's door (18,8): too heavy to just open. The player pushes twice, and it opens until the map reloads
.global EventScript_Santuario_del_Vento_1_59_Sign3
EventScript_Santuario_del_Vento_1_59_Sign3:
	checkflag FLAG_SHRINE_DOOR_OPEN
	if 0x1 _goto Santuario_del_Vento_1_59_Sign3_Open
	lockall
	msgbox Santuario_del_Vento_1_59_Sign3_text1 MSG_NORMAL
	applymovement 0xFF Santuario_del_Vento_1_59_mov_push
	waitmovement 0x0
	sound 0x8 @SE_DOOR_OPEN
	setvar 0x8004 0x0 @The heavy door grinds open
	setvar 0x8005 0x2
	setvar 0x8006 0x6
	setvar 0x8007 0x3
	special 0x136
	call Santuario_del_Vento_1_59_OpenDoorTiles
	special 0x8E @Redraw the map
	setflag FLAG_SHRINE_DOOR_OPEN
	pause 0x20
	msgbox Santuario_del_Vento_1_59_Sign3_text2 MSG_NORMAL
	releaseall
	end

Santuario_del_Vento_1_59_Sign3_Open:
	end

@Two pushes against the door
Santuario_del_Vento_1_59_mov_push:
	.byte 0x22 @Walk in place up
	.byte 0x22 @Walk in place up
	.byte 0xFE

@The open door: (18,8) is the cave door to 1.60 (warp 2), the rest stays solid. Not kept: it closes when the map reloads
Santuario_del_Vento_1_59_OpenDoorTiles:
	setmaptile 0x11 0x7 0x347 0x1 @(17,7) 839
	setmaptile 0x12 0x7 0x357 0x1 @(18,7) 855
	setmaptile 0x13 0x7 0x387 0x1 @(19,7) 903
	setmaptile 0x11 0x8 0x34F 0x1 @(17,8) 847
	setmaptile 0x12 0x8 0x35F 0x0 @(18,8) 863: the cave door, walkable
	setmaptile 0x13 0x8 0x38F 0x1 @(19,8) 911
	return
