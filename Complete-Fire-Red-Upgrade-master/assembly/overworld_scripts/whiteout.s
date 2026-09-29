.text
.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@ Scripts run right after the player whites out and respawns (repointed in the repoints file).
@ If var 0x5037 is not 0 the player respawned at a custom spot (see WhiteoutLogic in src/overworld.c),
@ where there is no nurse or mom, so the party is just healed.

.global EventScript_AfterWhiteOutHeal
EventScript_AfterWhiteOutHeal:
	compare 0x5037 0x0
	if notequal _goto EventScript_AfterWhiteOut_CustomRespawn
	lockall
	fadedefaultbgm
	goto EventScript_common_healing_pkmn_center_P1 @Same healing as talking to the nurse (common.s)

@ The mom script itself stays vanilla
.global EventScript_AfterWhiteOutMomHeal
EventScript_AfterWhiteOutMomHeal:
	compare 0x5037 0x0
	if notequal _goto EventScript_AfterWhiteOut_CustomRespawn
	goto 0x81A8DD8

EventScript_AfterWhiteOut_CustomRespawn:
	lockall
	special 0x0 @HealPlayerParty
	fadedefaultbgm
	releaseall
	end
