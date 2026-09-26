.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Run when the player talks to the Pokemon following them (FLAG_FOLLOWER_POKEMON)
.global EventScript_FollowerMon
EventScript_FollowerMon:
	lock
	faceplayer
	callasm FollowerMon_BufferSpecies
	cry 0x8004 0x0
	waitcry
	release
	end

@All of these are used with "call".
@Hiding sets flag 0x99A (FLAG_FOLLOWER_POKEMON_HIDDEN), so the Pokemon stays hidden until one of the
@"show" scripts is used, or until the flag is cleared (it then comes out on the player's next step).

@Recalls the following Pokemon into a Poke Ball (eg. before a cutscene)
.global EventScript_FollowerMon_ReturnToBall
EventScript_FollowerMon_ReturnToBall:
	callasm FollowerMon_ReturnToBall
	waitstate
	return

@Instantly hides the following Pokemon, no animation
.global EventScript_FollowerMon_Hide
EventScript_FollowerMon_Hide:
	callasm FollowerMon_Hide
	return

@Instantly brings the following Pokemon back next to the player, no animation
.global EventScript_FollowerMon_Show
EventScript_FollowerMon_Show:
	callasm FollowerMon_Show
	return

@Brings the following Pokemon back next to the player, out of a Poke Ball
.global EventScript_FollowerMon_ComeOutOfBall
EventScript_FollowerMon_ComeOutOfBall:
	callasm FollowerMon_ComeOutOfBall
	waitstate
	return
