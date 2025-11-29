.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//LEVELS__________________

.global gMapScripts_Ardesiopoli_6_8
gMapScripts_Ardesiopoli_6_8:
	mapscript MAP_SCRIPT_ON_LOAD Ardesiopoli_6_8_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Ardesiopoli_6_8_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Ardesiopoli_6_8_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Ardesiopoli_6_8_MapScriptOnLoad:
		compare 0x4060 0x4
		if 0x1 _call Ardesiopoli_6_8_MapScriptOnLoad_moveoldLady
		compare 0x4060 0x5
		if 0x1 _call Ardesiopoli_6_8_MapScriptOnLoad_moveoldLady2
		end

	Ardesiopoli_6_8_MapScriptOnLoad_moveoldLady:
		movesprite2 0x2 0x03 0x07
		return

	Ardesiopoli_6_8_MapScriptOnLoad_moveoldLady2:
		movesprite2 0x2 0x07 0x05
		return


	Ardesiopoli_6_8_MapScriptOnWarpIntoMapTable:
	levelscript 0x4060, 3, Ardesiopoli_6_8_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN

	Ardesiopoli_6_8_MapScriptOnWarpIntoMapTableBegin:
		spriteface 0xFF 0x2
		end	

	Ardesiopoli_6_8_MapScriptOnFrame:
		levelscript 0x4060, 3, Ardesiopoli_6_8_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Ardesiopoli_6_8_MapScriptOnFrameBegin:
			lockall
			pause 0x1E
			pause 0x1E
			spriteface 0x2 0x2
			movesprite 0x2 0x3 0x9
			sound 0x9
			applymovement 0x2 Ardesiopoli_6_8_MapScriptOnFrameBegin_mov1
			waitmovement 0x2
			spriteface 0xFF 0x1
			pause 0x1E
			textcolor 0x1
			msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text1 MSG_NORMAL
			pause 0x1E
			fanfare 0x0103
			textcolor 0x2
			msgbox Mission_Completed_text1 MSG_NORMAL
			pause 0x1E
			//close mission
			setflag 0x96C
			textcolor 0x1
			msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text2 MSG_NORMAL
			//variable to decouple later on
			setvar 0x4060 0x4
			pause 0x1E
			countpokemon
			compare 0x800D 0x6
			if 0x1 _goto Ardesiopoli_6_8_MapScriptOnFrameBegin_Full
			fanfare 0x013E
			giveegg 0x25F
			textcolor 0x2
			msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text4 MSG_NORMAL
			pause 0x1E
			textcolor 0x1
			msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text5 MSG_NORMAL
			spriteface 0x2 0x3
			pause 0x1E
			pause 0x1E
			spriteface 0x2 0x2
			pause 0x1E
			msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text6 MSG_NORMAL
			warpmuted 0x6 0x8 0xFF 0x03 0x06
			//variable to end script
			setvar 0x4060 0x5
			releaseall
			end

			Ardesiopoli_6_8_MapScriptOnFrameBegin_Full:
				textcolor 0x1
				msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text3 MSG_NORMAL
				releaseall
				end

			Ardesiopoli_6_8_MapScriptOnFrameBegin_mov1:
				.byte 0x1C
				.byte 0x11
				.byte 0x11
				.byte 0x66
				.byte 0xFE




//NPCS____________________


.global EventScript_Ardesiopoli_6_8_NPC1
EventScript_Ardesiopoli_6_8_NPC1:
	lock
	msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text7 MSG_NORMAL
	pause 0x1E
	countpokemon
	compare 0x800D 0x6
	if 0x1 _goto Ardesiopoli_6_8_MapScriptOnFrameBegin_Full
	fanfare 0x013E
	giveegg 0x25F
	textcolor 0x2
	msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text4 MSG_NORMAL
	pause 0x1E
	textcolor 0x1
	msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text5 MSG_NORMAL
	spriteface 0x2 0x3
	pause 0x1E
	pause 0x1E
	faceplayer
	pause 0x1E
	msgbox Ardesiopoli_6_8_MapScriptOnFrameBegin_text6 MSG_NORMAL
	warpmuted 0x6 0x8 0xFF 0x03 0x04
	//variable to end script
	setvar 0x4060 0x5
	releaseall
	end





.global EventScript_Ardesiopoli_6_8_NPC0
EventScript_Ardesiopoli_6_8_NPC0:
	lock
	showpokepic 0x3BB 0x0 0x6
	msgbox Ardesiopoli_6_8_NPC0_text1 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	faceplayer
	playsong 0x112 0x0
	applymovement 0x1 Ardesiopoli_6_8_NPC0_mov1
	waitmovement 0x0
	pause 0x1E
	trainerbattle1 0x1 0x1A 0x0 Ardesiopoli_6_8_NPC0_text2 Ardesiopoli_6_8_NPC0_text3 EventScript_Ardesiopoli_6_8_NPC0_P2
	release
	end
	
	EventScript_Ardesiopoli_6_8_NPC0_P2:
		fadedefault
		pause 0x1E
		applymovement 0x1 Ardesiopoli_6_8_NPC0_mov1
		waitmovement 0x0
		showpokepic 0x3BB 0x0 0x6
		msgbox Ardesiopoli_6_8_NPC0_text4 MSG_NORMAL
		special 0x15A	
		pause 0x1E
		fanfare 0x013E
		msgbox Ardesiopoli_6_8_NPC0_text5 MSG_NORMAL
		closeonkeypress
		applymovement 0x1 Ardesiopoli_6_8_NPC0_mov2
		waitmovement 0x0	
		showpokepic 0x3BB 0x0 0x6
		msgbox Ardesiopoli_6_8_NPC0_text6 MSG_NORMAL
		special 0x15A
		setflag 0x96C
		setvar 0x4060 0x3
		warp 0x6 0x8 0xFF 0x03 0x06
		release
		end

	Ardesiopoli_6_8_NPC0_mov1:
		.byte 0x62
		.byte 0xFE

	Ardesiopoli_6_8_NPC0_mov2:
		.byte 0x1C
		.byte 0x2 
		.byte 0x1C
		.byte 0x64
		.byte 0x1A
		.byte 0x0 
		.byte 0x1B
		.byte 0xFE

