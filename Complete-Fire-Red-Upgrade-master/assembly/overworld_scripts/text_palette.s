.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Applies the custom text color (var 0x503E, VAR_TEXT_PAL_CUSTOM_COLOR) to text boxes already on screen.
@Use with "call" right after setting the var, eg:
@	setvar 0x503E 0x7C1F
@	call EventScript_RefreshTextColor
.global EventScript_RefreshTextColor
EventScript_RefreshTextColor:
	callasm RefreshStdTextPalette
	return
