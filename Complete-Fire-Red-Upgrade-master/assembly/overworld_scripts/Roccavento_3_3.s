.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Roccavento_3_3
gMapScripts_Roccavento_3_3:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Roccavento_3_3_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_LOAD Roccavento_3_3_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Roccavento_3_3_MapScriptOnWarpIntoMapTable
    .byte MAP_SCRIPT_TERMIN

	Roccavento_3_3_MapScriptOnWarpIntoMapTable:
		levelscript 0x4051, 0x4C, Roccavento_3_3_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Roccavento_3_3_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x4
			end	

	Roccavento_3_3_MapScriptOnLoad:
		compare 0x4051 0x4C
		if 0x1 _call Roccavento_3_3_MapScriptOnLoad_1
		end

		Roccavento_3_3_MapScriptOnLoad_1:
			movesprite2 0xD 0x45 0x2C
			movesprite2 0xE 0x47 0x2C
			return

	Roccavento_3_3_MapScriptOnFrame:
		levelscript 0x4051, 0x4C, Roccavento_3_3_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Roccavento_3_3_MapScriptOnFrameBegin:
			pause 0x1E
			applymovement 0xD Roccavento_3_3_MapScriptOnFrame_mov1
			waitmovement 0xD
			sound 0x15
			pause 0x1E			
			showpokepic 0x3B4 0x0 0x6
			msgbox Roccavento_3_3_MapScriptOnFrame_text1 MSG_NORMAL
			special 0x15A
			pause 0x25			
			spriteface 0xD 0x2
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Roccavento_3_3_MapScriptOnFrame_text2 MSG_NORMAL
			special 0x15A
			pause 0x25			
			spriteface 0xD 0x3
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Roccavento_3_3_MapScriptOnFrame_text3 MSG_NORMAL
			special 0x15A
			pause 0x25		
			applymovement 0xD mov_exclamation
			waitmovement 0xD
			sound 0x15
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Roccavento_3_3_MapScriptOnFrame_text4 MSG_NORMAL
			special 0x15A
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Roccavento_3_3_MapScriptOnFrame_text5 MSG_NORMAL
			special 0x15A
			setvar 0x4051 0x4D
			releaseall
			end

			Roccavento_3_3_MapScriptOnFrame_mov1:
				.byte 0x1C
				.byte 0x1 
				.byte 0x1C
				.byte 0x3 
				.byte 0x1C
				.byte 0x0 
				.byte 0x1C
				.byte 0x2 
				.byte 0x1A
				.byte 0x62
				.byte 0xFE

//___NPCs___

.global EventScript_Roccavento_3_3_NPC2
EventScript_Roccavento_3_3_NPC2:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_3_3_NPC3
EventScript_Roccavento_3_3_NPC3:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_3_3_NPC5
EventScript_Roccavento_3_3_NPC5:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_3_3_NPC14
EventScript_Roccavento_3_3_NPC14:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC14_text1 MSG_NORMAL
	release
	end


//___SIGNs___


