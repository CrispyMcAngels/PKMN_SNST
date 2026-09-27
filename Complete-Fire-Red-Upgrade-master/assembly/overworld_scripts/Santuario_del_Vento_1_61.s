.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
.include "../asm_defines.s"

.global gMapScripts_Santuario_del_Vento_1_61
gMapScripts_Santuario_del_Vento_1_61:
	mapscript MAP_SCRIPT_ON_LOAD SDV_1_61_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

		SDV_1_61_MapScriptOnLoad:
			setvar 0x400A 0x0255
			setvar 0x5041 0x1D
			end