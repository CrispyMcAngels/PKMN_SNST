.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Riding a Pokemon in the sky (src/sky_mount.c). Var 0x5029 (VAR_SKY_MOUNT) picks the Pokemon: 0 = none, 1 = Swellow, 2 = Rapidash (on the ground).
@To arrive on a sky map already riding, just set the var before the warp. To leave, set it to 0 before the warp.
@These are only needed to get on or off without a warp. Use them with "call".

@Puts the player on the Pokemon chosen by var 0x5029 right away. Set the var first.
.global EventScript_SkyMount_Start
EventScript_SkyMount_Start:
	callasm SkyMount_Start
	return

@Gets the player off the Pokemon right away and sets var 0x5029 to 0.
.global EventScript_SkyMount_End
EventScript_SkyMount_End:
	callasm SkyMount_End
	return
