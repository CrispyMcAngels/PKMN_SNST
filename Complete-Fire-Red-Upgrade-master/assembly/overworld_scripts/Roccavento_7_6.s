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

.global EventScript_Roccavento_7_6_NPC0_Heal @Also used after whiting out (whiteout.s)
EventScript_Roccavento_7_6_NPC0_Heal:
	msgbox healing_pkmn_center_text4 MSG_NORMAL
	call EventScript_FollowerMon_CutsceneHide @The following Pokemon goes back into its ball for the nurse
	applymovement LASTTALKED Roccavento_7_6_mov_FaceUp @She turns her back to the player, to the tray
	waitmovement LASTTALKED
	pause 0x9
	special2 0x800D 0x84 @Party size
	copyvar 0x8008 0x800D
	call Roccavento_7_6_Ball1
	compare 0x8008 0x2
	if 0x0 _goto Roccavento_7_6_Healing
	call Roccavento_7_6_Ball2
	compare 0x8008 0x3
	if 0x0 _goto Roccavento_7_6_Healing
	call Roccavento_7_6_Ball3
	compare 0x8008 0x4
	if 0x0 _goto Roccavento_7_6_Healing
	call Roccavento_7_6_Ball4
	compare 0x8008 0x5
	if 0x0 _goto Roccavento_7_6_Healing
	call Roccavento_7_6_Ball5
	compare 0x8008 0x6
	if 0x0 _goto Roccavento_7_6_Healing
	call Roccavento_7_6_Ball6

Roccavento_7_6_Healing:
	applymovement 0x2 Roccavento_7_6_mov_Hop @Chansey lends a hand
	fanfare 0x100
	waitfanfare
	special 0x0 @Heals the party
	pause 0x1E
	@The balls come back, the last one first
	compare 0x8008 0x6
	if 0x4 _call Roccavento_7_6_TakeBall6
	compare 0x8008 0x5
	if 0x4 _call Roccavento_7_6_TakeBall5
	compare 0x8008 0x4
	if 0x4 _call Roccavento_7_6_TakeBall4
	compare 0x8008 0x3
	if 0x4 _call Roccavento_7_6_TakeBall3
	compare 0x8008 0x2
	if 0x4 _call Roccavento_7_6_TakeBall2
	call Roccavento_7_6_TakeBall1
	pause 0x9
	faceplayer
	call EventScript_FollowerMon_CutsceneEnd @And comes back out once they're healed
	msgbox healing_pkmn_center_text5 MSG_NORMAL
	closeonkeypress
	msgbox healing_pkmn_center_text3 MSG_NORMAL
	release
	end

@The tray (2,3)-(3,4): one more ball each time
Roccavento_7_6_Ball1:
	sound 0x17
	setmaptile 0x2 0x3 0x2EB 0x1 @(2,3) 747
	special 0x8E
	pause 0x1E
	return

Roccavento_7_6_Ball2:
	sound 0x17
	setmaptile 0x2 0x3 0x2EC 0x1 @(2,3) 748
	setmaptile 0x3 0x3 0x2ED 0x1 @(3,3) 749
	special 0x8E
	pause 0x1E
	return

Roccavento_7_6_Ball3:
	sound 0x17
	setmaptile 0x3 0x3 0x2EE 0x1 @(3,3) 750
	special 0x8E
	pause 0x1E
	return

Roccavento_7_6_Ball4:
	sound 0x17
	setmaptile 0x2 0x3 0x2F3 0x1 @(2,3) 755
	setmaptile 0x2 0x4 0x2F0 0x1 @(2,4) 752
	special 0x8E
	pause 0x1E
	return

Roccavento_7_6_Ball5:
	sound 0x17
	setmaptile 0x2 0x3 0x2F4 0x1 @(2,3) 756
	setmaptile 0x3 0x3 0x2F5 0x1 @(3,3) 757
	setmaptile 0x2 0x4 0x2F8 0x1 @(2,4) 760
	setmaptile 0x3 0x4 0x300 0x1 @(3,4) 768
	special 0x8E
	pause 0x1E
	return

Roccavento_7_6_Ball6:
	sound 0x17
	setmaptile 0x3 0x3 0x2F6 0x1 @(3,3) 758
	setmaptile 0x3 0x4 0x308 0x1 @(3,4) 776
	special 0x8E
	pause 0x1E
	return

@Taking ball n back: the tiles it changed go back to how they were with n - 1 balls (0 = the empty tray)
Roccavento_7_6_TakeBall6:
	setmaptile 0x3 0x3 0x2F5 0x1 @(3,3) 757
	setmaptile 0x3 0x4 0x300 0x1 @(3,4) 768
	special 0x8E
	pause 0x9
	return

Roccavento_7_6_TakeBall5:
	setmaptile 0x2 0x3 0x2F3 0x1 @(2,3) 755
	setmaptile 0x3 0x3 0x2EE 0x1 @(3,3) 750
	setmaptile 0x2 0x4 0x2F0 0x1 @(2,4) 752
	setmaptile 0x3 0x4 0x288 0x1 @(3,4) 648
	special 0x8E
	pause 0x9
	return

Roccavento_7_6_TakeBall4:
	setmaptile 0x2 0x3 0x2EC 0x1 @(2,3) 748
	setmaptile 0x2 0x4 0x2E8 0x1 @(2,4) 744
	special 0x8E
	pause 0x9
	return

Roccavento_7_6_TakeBall3:
	setmaptile 0x3 0x3 0x2ED 0x1 @(3,3) 749
	special 0x8E
	pause 0x9
	return

Roccavento_7_6_TakeBall2:
	setmaptile 0x2 0x3 0x2EB 0x1 @(2,3) 747
	setmaptile 0x3 0x3 0x2E1 0x1 @(3,3) 737
	special 0x8E
	pause 0x9
	return

Roccavento_7_6_TakeBall1:
	setmaptile 0x2 0x3 0x2E0 0x1 @(2,3) 736
	special 0x8E
	pause 0x9
	return

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

@The pizzaiolo: his secret recipe, in Neapolitan
.global EventScript_Roccavento_7_6_NPC3
EventScript_Roccavento_7_6_NPC3:
	lock
	faceplayer
	msgbox Roccavento_7_6_NPC3_text1 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text2 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text3 MSG_YESNO @Do you want the secret recipe?
	compare 0x800D 0x0
	if 0x1 _goto EventScript_Roccavento_7_6_NPC3_NoRecipe
	msgbox Roccavento_7_6_NPC3_text4 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text5 MSG_NORMAL
	applymovement LASTTALKED Roccavento_7_6_mov_Cheer @Like at the stadium
	waitmovement LASTTALKED
	faceplayer
	msgbox Roccavento_7_6_NPC3_text6 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text7 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text8 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text9 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text10 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text11 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text12 MSG_NORMAL
	release
	end

EventScript_Roccavento_7_6_NPC3_NoRecipe:
	msgbox Roccavento_7_6_NPC3_text13 MSG_NORMAL
	msgbox Roccavento_7_6_NPC3_text12 MSG_NORMAL
	release
	end

Roccavento_7_6_mov_Cheer:
	.byte 0x52 @Jump in place
	.byte 0x52
	.byte 0xFE

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
	checkitemspace 0x18B 0x1 @Room for the reward first, or it would be lost (same item as below)
	compare 0x800D 0x0
	if 0x1 _goto EventScript_Roccavento_7_6_NPC5_BagFull
	msgbox Roccavento_7_6_NPC5_text3 MSG_NORMAL
	removeitem 0x11D 0x1
	fanfare 0x0103
	msgbox Mission_Completed_text1 MSG_NORMAL
	setflag 0x99F
	hidesprite 0x9 @The quest's "!" (local ID 9), hidden by flag 0x99F from now on
	msgbox Roccavento_7_6_NPC5_text4 MSG_NORMAL
	giveitem 0x18B 0x1 MSG_OBTAIN @The reward: TM70 Flash (ITEM_TM70_FLASH)
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

@The pizza boxes by the counter (sign 8, (1,4)): the pizzeria's PC. FireRed's PC menu (EventScript_PC, 0x81A6955),
@copied without its screen effect (specials 0xD6/0xD7 draw the vanilla PC's tiles on the tile in front): instead, the top
@box's lid opens on the terminal inside, and closes on log off. The stack's top block is (1,3).
.equ PIZZA_PC_CLOSED, 0x3A6 @934: the stack's top block, closed
.equ PIZZA_PC_HALF, 0x3A8 @936: the lid half open
.equ PIZZA_PC_OPEN, 0x3AA @938: the lid open, the terminal on
.global EventScript_Roccavento_7_6_BoxPC
EventScript_Roccavento_7_6_BoxPC:
	special 0x187
	compare 0x800D 0x2
	if 0x1 _goto 0x81A7AE0 @As the vanilla PC
	lockall
	checkflag 0x841
	if 0x1 _goto 0x81A698E @As the vanilla PC
	setvar 0x8004 0x1B
	special 0x17D
	setmaptile 0x1 0x3 PIZZA_PC_HALF 0x1 @The lid opens
	special 0x8E
	pause 0x6
	setmaptile 0x1 0x3 PIZZA_PC_OPEN 0x1
	special 0x8E
	sound 0x4 @SE_PC_ON: the terminal inside turns on
	msgbox Roccavento_7_6_BoxPC_text1 MSG_SIGN

Roccavento_7_6_BoxPC_Menu:
	preparemsg 0x81A508A @Which PC?
	waitmsg
	special 0x106
	waitstate

Roccavento_7_6_BoxPC_Choice:
	copyvar 0x8000 0x800D
	compare 0x8000 0x0
	if 0x1 _goto Roccavento_7_6_BoxPC_Storage
	compare 0x8000 0x1
	if 0x1 _goto Roccavento_7_6_BoxPC_Items
	compare 0x8000 0x2
	if 0x1 _goto Roccavento_7_6_BoxPC_Oak
	compare 0x8000 0x3
	if 0x1 _goto Roccavento_7_6_BoxPC_HallOfFame
	goto Roccavento_7_6_BoxPC_LogOff

@The Pokemon storage system (someone's / Bill's PC)
Roccavento_7_6_BoxPC_Storage:
	sound 0x2
	checkflag 0x834
	if 0x0 _call Roccavento_7_6_BoxPC_SomeonesPC
	checkflag 0x834
	if 0x1 _call Roccavento_7_6_BoxPC_BillsPC
	msgbox 0x81A50BE MSG_SIGN
	special 0x3C
	waitstate
	setvar 0x8004 0x1B
	special 0x17D
	goto Roccavento_7_6_BoxPC_Menu

Roccavento_7_6_BoxPC_SomeonesPC:
	msgbox 0x81A50A7 MSG_SIGN
	return

Roccavento_7_6_BoxPC_BillsPC:
	msgbox 0x81A50EF MSG_SIGN
	return

@The player's PC: item storage
Roccavento_7_6_BoxPC_Items:
	sound 0x2
	msgbox 0x81A50DD MSG_SIGN
	special 0xFA
	waitstate
	goto Roccavento_7_6_BoxPC_Menu

@Prof. Oak's PC: the Pokedex rating
Roccavento_7_6_BoxPC_Oak:
	checkflag 0x829
	if 0x0 _goto Roccavento_7_6_BoxPC_LogOff
	sound 0x2
	msgbox 0x81A5BC6 MSG_SIGN
	msgbox 0x81A5C03 MSG_YESNO
	compare 0x800D 0x0
	if 0x1 _goto Roccavento_7_6_BoxPC_OakEnd
	setflag 0x2FF
	call 0x81A73E0
	clearflag 0x2FF

Roccavento_7_6_BoxPC_OakEnd:
	msgbox 0x81A5C2E MSG_SIGN
	goto Roccavento_7_6_BoxPC_Menu

@The Hall of Fame
Roccavento_7_6_BoxPC_HallOfFame:
	checkflag 0x82C
	if 0x0 _goto Roccavento_7_6_BoxPC_LogOff
	sound 0x2
	setvar 0x8004 0x1F
	special 0x17E
	special 0x17D
	special 0x107
	waitstate
	special 0x17F
	goto Roccavento_7_6_BoxPC_Choice

Roccavento_7_6_BoxPC_LogOff:
	setvar 0x8004 0x0
	sound 0x3 @SE_PC_OFF
	setmaptile 0x1 0x3 PIZZA_PC_HALF 0x1 @The lid closes
	special 0x8E
	pause 0x6
	setmaptile 0x1 0x3 PIZZA_PC_CLOSED 0x1
	special 0x8E
	special 0x190
	releaseall
	end

//___SIGNs___

@The pizza in front of Charmander (signs 0 and 1)
.global EventScript_Roccavento_7_6_Sign0
EventScript_Roccavento_7_6_Sign0:
	msgbox Roccavento_7_6_Sign0_text1 MSG_SIGN
	end

@The man's pizza
.global EventScript_Roccavento_7_6_Sign2
EventScript_Roccavento_7_6_Sign2:
	msgbox Roccavento_7_6_Sign2_text1 MSG_SIGN
	end

@The couple's pizza, on their date
.global EventScript_Roccavento_7_6_Sign3
EventScript_Roccavento_7_6_Sign3:
	msgbox Roccavento_7_6_Sign3_text1 MSG_SIGN
	msgbox Roccavento_7_6_Sign3_text2 MSG_SIGN
	end

@The girl's pizza
.global EventScript_Roccavento_7_6_Sign4
EventScript_Roccavento_7_6_Sign4:
	msgbox Roccavento_7_6_Sign4_text1 MSG_SIGN
	end

@The pizza just out of the oven
.global EventScript_Roccavento_7_6_Sign5
EventScript_Roccavento_7_6_Sign5:
	msgbox Roccavento_7_6_Sign5_text1 MSG_SIGN
	end

@The side of the healing tray: a wooden crate full of hay
.global EventScript_Roccavento_7_6_Sign6
EventScript_Roccavento_7_6_Sign6:
	msgbox Roccavento_7_6_Sign6_text1 MSG_SIGN
	end

@The blackboard with the menu
.global EventScript_Roccavento_7_6_Sign7
EventScript_Roccavento_7_6_Sign7:
	msgbox Roccavento_7_6_Sign7_text1 MSG_SIGN
	msgbox Roccavento_7_6_Sign7_text2 MSG_SIGN
	msgbox Roccavento_7_6_Sign7_text3 MSG_SIGN
	end
