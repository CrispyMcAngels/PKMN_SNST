.text
.thumb
.align 2

@ The "Consegna lampo" side quest (src/courier_quest.c): no going into buildings while delivering.
@ FireRed's GetWarpEventAtMapPosition (0x806DC30, r0 = map header, r1 = position) finds the warp the
@ player stepped on or walked into. When CourierQuest_IsWarpBlocked says the warp leads into a
@ building, it answers -1 (no warp) and the quest's "give up?" question runs instead.
.pool
@0x806DC30 with r2
.global CourierQuestWarpHook
CourierQuestWarpHook:
	push {lr} @The instruction the hook replaced
	push {r0-r1}
	bl CourierQuest_IsWarpBlocked
	lsl r2, r0, #0x18 @bool8
	pop {r0-r1}
	cmp r2, #0x0
	bne CourierQuestWarpHook_Blocked
	add r3, r1, #0x0 @The instructions the hook replaced
	ldrh r1, [r3]
	sub r1, #0x7
	ldr r2, =0x806DC38 | 1
	bx r2

CourierQuestWarpHook_Blocked:
	mov r0, #0x0
	mvn r0, r0 @-1
	pop {r1}
	bx r1

.pool
