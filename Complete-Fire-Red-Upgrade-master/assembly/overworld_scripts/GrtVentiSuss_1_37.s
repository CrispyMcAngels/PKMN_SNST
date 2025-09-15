.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global EventScript_GrtVentiSuss_1_37_tile0
EventScript_GrtVentiSuss_1_37_tile0:
	lockall
	applymovement 0xFF GrtVentiSuss_1_37_tile0_mov0
	waitmovement 0xFF	
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	textcolor 0x0
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
		.byte 0x62
		.byte 0x1C
		.byte 0x3 
		.byte 0x1C
		.byte 0x62
		.byte 0x1C
		.byte 0x55
		.byte 0x55
		.byte 0xFE


		
		Player_Blue:
			showpokepic 0x3b6 0x15 0x6
			return

		Player_Orange:
			showpokepic 0x3bE 0x15 0x6
			return

		Player_Green:
			showpokepic 0x3bF 0x15 0x6
			return