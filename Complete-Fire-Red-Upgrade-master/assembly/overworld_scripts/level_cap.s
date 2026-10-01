.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Levels every party Pokemon below the level cap up to it (src/level_up_to_cap.c), on every difficulty.
@Use it with "call" from a script that already did lock/lockall. Moves and evolutions happen level by level.
.global EventScript_LevelPartyToCap
EventScript_LevelPartyToCap:
	setvar 0x502A 0x0 @VAR_LEVEL_UP_TO_CAP: the party slot (0x502A-0x502D are this script's)
	callasm LevelUpToCap_FindNextMon
	compare LASTRESULT 0x0
	if equal _goto EventScript_LevelPartyToCap_AlreadyAtCap

EventScript_LevelPartyToCap_NextLevel:
	callasm LevelUpToCap_GainLevel

EventScript_LevelPartyToCap_NextMove:
	callasm LevelUpToCap_TryLearnMove
	compare LASTRESULT 0x0
	if equal _goto EventScript_LevelPartyToCap_Evolution
	bufferpartypokemon 0x0 0x502A
	compare LASTRESULT 0x1
	if equal _goto EventScript_LevelPartyToCap_Learned
	msgbox gText_LevelUpToCap_WantsToLearn MSG_YESNO @Four moves already: forget one?
	compare LASTRESULT 0x0
	if equal _goto EventScript_LevelPartyToCap_DidNotLearn
	fadescreen 0x1
	callasm LevelUpToCap_ShowForgetScreen
	waitstate
	callasm LevelUpToCap_ReplaceMove
	compare LASTRESULT 0x0
	if equal _goto EventScript_LevelPartyToCap_DidNotLearn
	bufferpartypokemon 0x0 0x502A
	msgbox gText_LevelUpToCap_ForgotAndLearned MSG_NORMAL
	goto EventScript_LevelPartyToCap_NextMove

EventScript_LevelPartyToCap_Learned:
	msgbox gText_LevelUpToCap_Learned MSG_NORMAL
	goto EventScript_LevelPartyToCap_NextMove

EventScript_LevelPartyToCap_DidNotLearn:
	bufferpartypokemon 0x0 0x502A
	msgbox gText_LevelUpToCap_DidNotLearn MSG_NORMAL
	goto EventScript_LevelPartyToCap_NextMove

EventScript_LevelPartyToCap_Evolution:
	callasm LevelUpToCap_CanEvolve
	compare LASTRESULT 0x0
	if equal _goto EventScript_LevelPartyToCap_CheckCap
	fadescreen 0x1
	callasm LevelUpToCap_Evolve
	waitstate

EventScript_LevelPartyToCap_CheckCap:
	callasm LevelUpToCap_IsBelowCap
	compare LASTRESULT 0x1
	if equal _goto EventScript_LevelPartyToCap_NextLevel
	bufferpartypokemon 0x0 0x502A @Done with this Pokemon (its evolved name, if it evolved)
	buffernumber 0x1 0x502D
	fanfare 0x101 @Level-up jingle (fanfare 0 in the ROM's table); waitfanfare then resumes the map music
	msgbox gText_LevelUpToCap_GrewToLevel MSG_KEEPOPEN
	waitfanfare
	closeonkeypress
	addvar 0x502A 0x1
	callasm LevelUpToCap_FindNextMon
	compare LASTRESULT 0x1
	if equal _goto EventScript_LevelPartyToCap_NextLevel
	return

EventScript_LevelPartyToCap_AlreadyAtCap:
	msgbox gText_LevelUpToCap_AlreadyAtCap MSG_NORMAL
	return
