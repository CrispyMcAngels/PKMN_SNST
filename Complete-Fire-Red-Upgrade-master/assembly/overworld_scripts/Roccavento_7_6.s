.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Roccavento 7.6: pizzeria, which is also the town's Pokemon Center.
@npc 2 (Charmander) uses EventScript_Stellavia_10_9_NPC3 (eventscripts).

@The nurse: the structure of EventScript_common_healing_pkmn_center (common.s), with this map's animation:
@she only turns her back to the machine, and Chansey (local ID 2) hops while the party heals
.global EventScript_Roccavento_7_6_NPC0
EventScript_Roccavento_7_6_NPC0:
	lock
	faceplayer
	msgbox Roccavento_7_6_NPC0_text1 MSG_NORMAL
	msgbox Roccavento_7_6_NPC0_text2 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Roccavento_7_6_NPC0_Heal
	closeonkeypress
	msgbox healing_pkmn_center_text3 MSG_NORMAL
	release
	end

EventScript_Roccavento_7_6_NPC0_Heal:
	msgbox healing_pkmn_center_text4 MSG_NORMAL
	call EventScript_FollowerMon_CutsceneHide @The following Pokemon goes back into its ball for the nurse
	applymovement LASTTALKED Roccavento_7_6_mov_FaceUp @She turns her back to the player, to the machine
	waitmovement LASTTALKED
	pause 0x9
	@PLACEHOLDER: the pizzeria's machine animation (setmaptile on its tiles + special 0x8E), see EventScript_common_healing_animation
	applymovement 0x2 Roccavento_7_6_mov_Hop @Chansey lends a hand
	fanfare 0x100
	waitfanfare
	special 0x0 @Heals the party
	pause 0x9
	faceplayer
	call EventScript_FollowerMon_CutsceneEnd @And comes back out once they're healed
	msgbox healing_pkmn_center_text5 MSG_NORMAL
	closeonkeypress
	msgbox healing_pkmn_center_text3 MSG_NORMAL
	release
	end

Roccavento_7_6_mov_FaceUp:
	.byte 0x1
	.byte 0xFE

Roccavento_7_6_mov_Hop:
	.byte 0x52 @jump_onspot_down
	.byte 0x52
	.byte 0xFE

@Chansey, the nurse's helper
.global EventScript_Roccavento_7_6_NPC1
EventScript_Roccavento_7_6_NPC1:
	lock
	faceplayer
	cry 0x71 0x0
	msgbox Roccavento_7_6_NPC1_text1 MSG_NORMAL
	waitcry
	release
	end

@The pizzaiolo: PLACEHOLDER text (to be rewritten in Neapolitan)
.global EventScript_Roccavento_7_6_NPC3
EventScript_Roccavento_7_6_NPC3:
	lock
	faceplayer
	msgbox Roccavento_7_6_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_7_6_NPC4
EventScript_Roccavento_7_6_NPC4:
	lock
	faceplayer
	msgbox Roccavento_7_6_NPC4_text1 MSG_NORMAL
	release
	end

@Side quest "Un appuntamento di fuoco": the boy lost his wallet (item 0x11D) in the Risaia Rosa.
@Flag 0x99E: quest received; 0x99F: completed. Wild Pokemon there can hold the wallet while it is active.
.global EventScript_Roccavento_7_6_NPC5
EventScript_Roccavento_7_6_NPC5:
	lock
	faceplayer
	checkflag 0x99F
	if 0x1 _goto EventScript_Roccavento_7_6_NPC5_Done
	checkflag 0x99E
	if 0x1 _goto EventScript_Roccavento_7_6_NPC5_Active
	msgbox Roccavento_7_6_NPC5_text1 MSG_NORMAL
	fanfare 0x0102
	msgbox Mission_Received_text1 MSG_NORMAL
	setflag 0x99E
	release
	end

EventScript_Roccavento_7_6_NPC5_Active:
	checkitem 0x11D 0x1
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Roccavento_7_6_NPC5_Return
	msgbox Roccavento_7_6_NPC5_text2 MSG_NORMAL
	release
	end

EventScript_Roccavento_7_6_NPC5_Return:
	checkitemspace 0x44 0x1 @Room for the reward first, or it would be lost (same item as below)
	compare 0x800D 0x0
	if 0x1 _goto EventScript_Roccavento_7_6_NPC5_BagFull
	msgbox Roccavento_7_6_NPC5_text3 MSG_NORMAL
	removeitem 0x11D 0x1
	fanfare 0x0103
	msgbox Mission_Completed_text1 MSG_NORMAL
	setflag 0x99F
	hidesprite 0x9 @The quest's "!" (local ID 9), hidden by flag 0x99F from now on
	msgbox Roccavento_7_6_NPC5_text4 MSG_NORMAL
	giveitem 0x44 0x1 MSG_OBTAIN @PLACEHOLDER reward: Rare Candy
	release
	end

EventScript_Roccavento_7_6_NPC5_BagFull:
	msgbox Roccavento_7_6_NPC5_text_bagfull MSG_NORMAL
	release
	end

EventScript_Roccavento_7_6_NPC5_Done:
	msgbox Roccavento_7_6_NPC5_text5 MSG_NORMAL
	release
	end

@His date: oblivious until the quest is over
.global EventScript_Roccavento_7_6_NPC6
EventScript_Roccavento_7_6_NPC6:
	lock
	faceplayer
	checkflag 0x99F
	if 0x1 _goto EventScript_Roccavento_7_6_NPC6_After
	msgbox Roccavento_7_6_NPC6_text1 MSG_NORMAL
	release
	end

EventScript_Roccavento_7_6_NPC6_After:
	msgbox Roccavento_7_6_NPC6_text2 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_7_6_NPC7
EventScript_Roccavento_7_6_NPC7:
	lock
	faceplayer
	msgbox Roccavento_7_6_NPC7_text1 MSG_NORMAL
	release
	end

