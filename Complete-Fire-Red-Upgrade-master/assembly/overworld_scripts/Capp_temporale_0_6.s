.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Capp_temporale_0_6
gMapScripts_Capp_temporale_0_6:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Capp_temporale_0_6_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN
		
	Capp_temporale_0_6_MapScriptOnFrame:
		levelscript 0x4050, 6, Capp_temporale_0_6_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN		

	Capp_temporale_0_6_MapScriptOnFrameBegin:
		pause 0x1E
		pause 0x1E
		fadescreen 0x3
		movesprite 0x1 0x0C 0x17
		sound 0x9
		fadescreen 0x2
		pause 0x1E
		pause 0x1E
		pause 0x1E
		showpokepic 0x3B9 0x0 0x6
    	msgbox EventScript_Capp_temporale_0_6_text1 MSG_NORMAL
		special 0x15A
		applymovement 0x1 Capp_temporale_0_6_mov1
		waitmovement 0x1
		applymovement 0x1 Capp_temporale_0_6_mov1a
		applymovement 0x2 Capp_temporale_0_6_mov1b
		waitmovement 0x0
		sound 0x9
		hidesprite 0x1
		pause 0x1E
		applymovement 0x2 Capp_temporale_0_6_mov1c
		waitmovement 0x0		
		pause 0x1E
		applymovement 0xFF Capp_temporale_0_6_mov2
		waitmovement 0x0
		pause 0x1E
		warpmuted 0x3 0x2f 0xFF 0x06 0x0D
		releaseall
		end
		
	Capp_temporale_0_6_mov1:
		.byte 0x1C
		.byte 0x11
		.byte 0x11
		.byte 0xFE

	Capp_temporale_0_6_mov1a:
		.byte 0x11
		.byte 0xFE

	Capp_temporale_0_6_mov1b:
		.byte 0x2e 
		.byte 0x2F
		.byte 0xFE

	Capp_temporale_0_6_mov1c:
		.byte 0x2e 
		.byte 0x2d
		.byte 0xFE

	Capp_temporale_0_6_mov2:
		.byte 0xD 
		.byte 0xD 
		.byte 0xD 
		.byte 0xFE
