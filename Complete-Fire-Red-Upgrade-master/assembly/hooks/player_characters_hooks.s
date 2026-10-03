.text
.thumb
.align 2

@ Time Echo protagonists (src/player_characters.c) don't register Pokemon in the Pokedex.
@ Every read and write of the seen and caught flags goes through FireRed's DexFlagCheck (0x8104AB0,
@ r0 = dex number, r1 = case: 0 get seen, 1 get caught, 2 set seen, 3 set caught). While an echo
@ protagonist is played, the two "set" cases return without doing anything; reading works as usual.
.pool
@0x8104AB0 with r3
.global DexFlagCheckHook
DexFlagCheckHook:
	push {r0-r2, lr}
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #0x2 @FLAG_SET_SEEN or FLAG_SET_CAUGHT
	blo DexFlagCheckHook_Vanilla
	bl IsEchoCharacterLoaded
	cmp r0, #0x0
	beq DexFlagCheckHook_Vanilla
	pop {r0-r3}
	mov lr, r3
	mov r0, #0x0
	bx lr

DexFlagCheckHook_Vanilla:
	pop {r0-r3}
	mov lr, r3
	push {r4-r7, lr} @The instructions the hook replaced
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	lsl r1, r1, #0x18
	ldr r4, =0x8104AB8 | 1
	bx r4

@ The bag menu during echoes (src/player_characters.c): the bag picture, its palette, and the pockets.
.pool
@0x8108310 with r0
.global LoadBagSpriteSheetHook
LoadBagSpriteSheetHook:
	bl LoadBagSpriteSheet
	ldr r0, =0x8108352 | 1 @Next loading step
	bx r0

.pool
@0x8108340 with r0
.global LoadBagSpritePaletteHook
LoadBagSpritePaletteHook:
	bl LoadBagSpritePalette
	ldr r0, =0x8108352 | 1
	bx r0

.pool
@0x81091B8 with r0
.global SwitchBagPocketRightHook
SwitchBagPocketRightHook:
	mov r0, r4 @Current pocket
	bl TrySwitchBagPocketRight
	ldr r1, =0x81091C8 | 1 @Return r0
	bx r1

@ The trainer card during echoes: no badges, no stars, no ID number. The Pokedex row is already gone,
@ since echo protagonists don't have FLAG_SYS_POKEDEX_GET.
.pool
@0x8089A94 with r1 (the start of the function that counts the card's stars and badges; the badge loop
@itself can't be hooked, since it jumps back into the middle of its first instructions)
.global TrainerCardBadgesHook
TrainerCardBadgesHook:
	push {lr}
	bl TrainerCard_HideAchievements
	pop {r1}
	mov lr, r1
	cmp r0, #0x0
	beq TrainerCardBadges_Count
	bx lr @Echo protagonist: no stars or badges

TrainerCardBadges_Count:
	push {r4, r5, lr} @The instructions the hook replaced
	ldr r4, =0x20397A4 @sTrainerCardDataPtr
	ldr r0, [r4]
	mov r1, #0x0
	ldr r2, =0x8089A9C | 1
	bx r2

.pool
@0x8089F78 with r0
.global TrainerCardIdHook
TrainerCardIdHook:
	push {lr}
	bl IsEchoCharacterLoaded
	pop {r1}
	mov lr, r1
	cmp r0, #0x0
	beq TrainerCardId_Print
	bx lr @Echo protagonists have no ID number on their card

TrainerCardId_Print:
	push {r4, lr} @The instructions the hook replaced
	sub sp, #0x2C
	ldr r1, =0x8419CE1 @"IDNo."
	add r0, sp, #0xC
	ldr r2, =0x8089F80 | 1
	bx r2

.pool
@0x808924C with r1
.global TrainerCardFlipHook
TrainerCardFlipHook:
	ldrh r1, [r0, #0x2E] @The instructions the hook replaced: is A pressed?
	mov r0, #0x1
	and r0, r1
	cmp r0, #0x0
	beq TrainerCardFlip_No
	bl IsEchoCharacterLoaded
	cmp r0, #0x0
	bne TrainerCardFlip_No @Echo protagonists can't flip their card
	ldr r0, =0x8089256 | 1 @Flip it
	bx r0

TrainerCardFlip_No:
	ldr r0, =0x30030F0 @gMain: the code after this checks B in r1
	ldrh r1, [r0, #0x2E]
	ldr r0, =0x8089280 | 1
	bx r0
