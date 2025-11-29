.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Radiantia_3_4
gMapScripts_Radiantia_3_4:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Radiantia_3_4_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_LOAD Radiantia_3_4_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

	Radiantia_3_4_MapScriptOnLoad:
		compare 0x4051 0x35
		if 0x1 _call Radiantia_3_4_MapScriptOnLoad_1
		end

		Radiantia_3_4_MapScriptOnLoad_1:
			movesprite2 0xB 0x1D 0x10
			return

	Radiantia_3_4_MapScriptOnFrame:
		levelscript 0x4060, 6, Radiantia_3_4_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Radiantia_3_4_MapScriptOnFrameBegin:
			compare 0x4051 0x35
			if 0x1 _goto Radiantia_3_4_MapScriptOnFrameBegin_P1
			applymovement 0xFF Radiantia_3_4_MapScriptOnFrameBegin_mov0
			waitmovement 0xFF
			compare 0x501F 0x100
			if 0x1 _call Player_Blue
			compare 0x501F 0x1A3
			if 0x1 _call Player_Orange
			compare 0x501F 0x1A4
			if 0x1 _call Player_Green
			pause 0x1E
			msgbox Radiantia_3_4_MapScriptOnFrame_text1 MSG_NORMAL
			special 0x15A
			setvar 0x4060 0x7
			releaseall
			end

			Radiantia_3_4_MapScriptOnFrameBegin_mov0:
				.byte 0x1D
				.byte 0x1B
				.byte 0x1 
				.byte 0x62
				.byte 0xFE

		Radiantia_3_4_MapScriptOnFrameBegin_P1:
			pause 0x1E
			applymovement 0xB Radiantia_3_4_mov1
			waitmovement 0x0
			pause 0x1E
			spriteface 0xB 0x3
			playsong 0x18A 0x0
			applymovement 0xB Radiantia_3_4_mov2
			waitmovement 0x0			
			pause 0x1E
			textcolor 0x0
			showpokepic 0x3B4 0x0 0x6
			msgbox Radiantia_3_4_MapScriptOnFrame_text2 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0xFF Radiantia_3_4_mov3
			waitmovement 0xFF		
			pause 0x1E
			applymovement 0xB Radiantia_3_4_mov1
			waitmovement 0x0				
			fadedefault
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Radiantia_3_4_MapScriptOnFrame_text3 MSG_NORMAL
			special 0x15A		
			pause 0x1E
			spriteface 0xB 0x3
			pause 0x1E
			pause 0x1E
			spriteface 0xB 0x2
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Radiantia_3_4_MapScriptOnFrame_text4 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Radiantia_3_4_MapScriptOnFrame_text5 MSG_NORMAL
			special 0x15A
			pause 0x1E
			spriteface 0xB 0x1
			pause 0x1E
			applymovement 0xB Radiantia_3_4_mov1
			waitmovement 0x0
			spriteface 0xB 0x2
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Radiantia_3_4_MapScriptOnFrame_text6 MSG_NORMAL
			special 0x15A
			pause 0x1E
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Radiantia_3_4_MapScriptOnFrame_text7 MSG_NORMAL
			special 0x15A
			playsong 0x18A 0x0
			applymovement 0xB Radiantia_3_4_mov4
			waitmovement 0x0			
			movesprite 0xB 0x0 0x0
			movesprite2 0xB 0x0 0x0
			setvar 0x4051 0x36
			setvar 0x4060 0x7
			fadedefault
			releaseall
			end


			Radiantia_3_4_mov1:
				.byte 0x62
				.byte 0xFE

			Radiantia_3_4_mov2:
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0x1 
				.byte 0xFE

			Radiantia_3_4_mov3:
				.byte 0x21
				.byte 0x21
				.byte 0x21
				.byte 0xFE

			Radiantia_3_4_mov4:
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0xFE


//___SIGNs___

.global EventScript_Radiantia_3_4_Sign0
EventScript_Radiantia_3_4_Sign0:
	msgbox Radiantia_3_4_Sign0_text1 0x7
	end

.global EventScript_Radiantia_3_4_Sign1
EventScript_Radiantia_3_4_Sign1:
	msgbox Radiantia_3_4_Sign1_text1 0x7
	end

.global EventScript_Radiantia_3_4_Sign2
EventScript_Radiantia_3_4_Sign2:
	msgbox Radiantia_3_4_Sign2_text1 0x7
	end

.global EventScript_Radiantia_3_4_Sign3
EventScript_Radiantia_3_4_Sign3:
	msgbox Radiantia_3_4_Sign3_text1 0x7
	end

.global EventScript_Radiantia_3_4_Sign4_5
EventScript_Radiantia_3_4_Sign4_5:
	msgbox Radiantia_3_4_Sign4_5_text1 0x7
	end

.global EventScript_Radiantia_3_4_Sign6
EventScript_Radiantia_3_4_Sign6:
	msgbox Radiantia_3_4_Sign6_text1 0x7
	end

//___NPCs___

.global EventScript_Radiantia_3_4_NPC0
EventScript_Radiantia_3_4_NPC0:
	lock
	faceplayer
	//setvar 0x5025 0x17B
	msgbox Radiantia_3_4_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_3_4_NPC1
EventScript_Radiantia_3_4_NPC1:
	lock
	faceplayer
	msgbox Radiantia_3_4_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_3_4_NPC2
EventScript_Radiantia_3_4_NPC2:
	lock
	faceplayer
	msgbox Radiantia_3_4_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_3_4_NPC3
EventScript_Radiantia_3_4_NPC3:
	lock
	faceplayer
	msgbox Radiantia_3_4_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_3_4_NPC4
EventScript_Radiantia_3_4_NPC4:
	lock
	faceplayer
	msgbox Radiantia_3_4_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Radiantia_3_4_NPC5
EventScript_Radiantia_3_4_NPC5:
	lock
	faceplayer
	msgbox Radiantia_3_4_NPC5_text1 MSG_NORMAL
	release
	end


		Player_Blue:
			showpokepic 0x3b6 0x0 0x6
			return

		Player_Orange:
			showpokepic 0x3bE 0x0 0x6
			return

		Player_Green:
			showpokepic 0x3bF 0x0 0x6
			return