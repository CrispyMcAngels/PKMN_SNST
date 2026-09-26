.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global EventScript_GrtVentiSuss_1_37_tile0
EventScript_GrtVentiSuss_1_37_tile0:
	lockall
	sound 0x15
	applymovement 0xFF GrtVentiSuss_1_37_tile0_mov0
	waitmovement 0xFF	
	sound 0x15
	applymovement 0xFF GrtVentiSuss_1_37_tile0_mov0_a
	waitmovement 0xFF	
	sound 0x15
	applymovement 0xFF GrtVentiSuss_1_37_tile0_mov0_b
	waitmovement 0xFF
	pause 0x1E
	show_mugshot PLAYER	
    msgbox GrtVentiSuss_1_37_tile0_text1 MSG_NORMAL
    special 0x15A
	setvar 0x4051 0x3A
	releaseall
	end

	GrtVentiSuss_1_37_tile0_mov0:
		.byte 0x63
		.byte 0x1C
		.byte 0x2 
		.byte 0x1C
		.byte 0xFE

	GrtVentiSuss_1_37_tile0_mov0_a:
		.byte 0x62
		.byte 0x1C
		.byte 0x3 
		.byte 0x1C
		.byte 0xFE

	GrtVentiSuss_1_37_tile0_mov0_b:
		.byte 0x62
		.byte 0x1C
		.byte 0x55
		.byte 0x55
		.byte 0xFE
