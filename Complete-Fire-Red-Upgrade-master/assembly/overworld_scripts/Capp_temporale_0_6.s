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
		playsong 0x188 0x0
		fadescreen 0x2
		pause 0x1E
		pause 0x1E
		pause 0x1E
		showpokepic 0x3B9 0x0 0x6
    	msgbox EventScript_Capp_temporale_0_6_text1 0x7
		special 0x15A
		applymovement 0x1 Capp_temporale_0_6_mov1
		waitmovement 0x1 
		sound 0x9
		hidesprite 0x1 
		pause 0x1E
		applymovement 0xFF Capp_temporale_0_6_mov2
		waitmovement 0x0
		warpmuted 0x3 0x2f 0xFF 0x06 0x0D
		releaseall
		end
		
	Capp_temporale_0_6_mov1:
		.byte 0x1C
		.byte 0x11
		.byte 0x11
		.byte 0x11
		.byte 0x60
		.byte 0xFE

	Capp_temporale_0_6_mov2:
		.byte 0xD 
		.byte 0xD 
		.byte 0xD 
		.byte 0xFE
