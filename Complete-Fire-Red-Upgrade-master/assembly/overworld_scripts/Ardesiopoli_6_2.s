.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//LEVELS__________________

.global gMapScripts_Ardesiopoli_6_2
gMapScripts_Ardesiopoli_6_2:
	mapscript MAP_SCRIPT_ON_LOAD Ardesiopoli_6_2_MapScriptOnLoad
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Ardesiopoli_6_2_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Ardesiopoli_6_2_MapScriptOnLoad:
		setvar 0x5007 0x4
		compare 0x4051 0x30
		if 0x1 _call Ardesiopoli_3_2_MapScriptOnLoad_move_tizio
		end

		Ardesiopoli_3_2_MapScriptOnLoad_move_tizio:
			movesprite2 0x3 0x0C 0x16
			return

	Ardesiopoli_6_2_MapScriptOnFrame:
		levelscript 0x4061, 0, Ardesiopoli_6_2_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Ardesiopoli_6_2_MapScriptOnFrameBegin:
			lockall
			pause 0x1E
			applymovement 0x3 Ardesiopoli_6_2_MapScriptOnFrame_mov1
			waitmovement 0x3	
			textcolor 0x0
			msgbox Ardesiopoli_6_2_MapScriptOnFrame_text1 MSG_NORMAL
			pause 0x1E
			applymovement 0x3 Ardesiopoli_6_2_MapScriptOnFrame_mov2
			applymovement 0xFF Ardesiopoli_6_2_MapScriptOnFrame_mov2
			waitmovement 0x0 
			warp 0x3 0x2 0xFF 0x23 0x28
			releaseall
			end

			Ardesiopoli_6_2_MapScriptOnFrame_mov1:
				.byte 0x62
				.byte 0x1A
				.byte 0x10
				.byte 0xFE

			Ardesiopoli_6_2_MapScriptOnFrame_mov2:
				.byte 0x10
				.byte 0xFE


//NPCS____________________

.global EventScript_Ardesiopoli_6_2_NPC0
EventScript_Ardesiopoli_6_2_NPC0:
	lock
	faceplayer
	showpokepic 0x3B8 0x0 0x6
	msgbox Ardesiopoli_6_2_NPC0_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	//trainerbattle
	setvar 0x503A 0x2 
	setvar 0x503B 0x0
	trainerbattle3 0x3 0x1E 0x100 Ardesiopoli_6_2_NPC0_text2
	pause 0x1E
	showpokepic 0x3B8 0x0 0x6
	msgbox Ardesiopoli_6_2_NPC0_text3 MSG_NORMAL
	special 0x15A
	pause 0x1E
	special 0x113
	applymovement 0x7F Ardesiopoli_6_2_NPC0_mov1
	waitmovement 0x0
	pause 0x1E
	fanfare 0x0104
	msgbox Ardesiopoli_6_2_NPC0_text4 0x7
	pause 0x1E
	setflag 0x820
	applymovement 0x7F Ardesiopoli_6_2_NPC0_mov2
	waitmovement 0x0
	special 0x114
	pause 0x1E
	showpokepic 0x3B8 0x0 0x6
	msgbox Ardesiopoli_6_2_NPC0_text5 MSG_NORMAL
	special 0x15A
	pause 0x1E	
	setvar 0x8008 0x1
	giveitem 0x18A 0x1 MSG_OBTAIN
	textcolor 0x0
	showpokepic 0x3B8 0x0 0x6
	msgbox Ardesiopoli_6_2_NPC0_text6 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B8 0x0 0x6
	msgbox Ardesiopoli_6_2_NPC0_text7 MSG_NORMAL
	special 0x15A
	setvar 0x4050 0x9
	setvar 0x4051 0x32
	setvar 0x4061 0x1
	setflag 0x4B0
	warp 0x6 0x1 0xFF 0x7 0x7
	release
	end

	Ardesiopoli_6_2_NPC0_mov1:
		.byte 0x11
		.byte 0x11
		.byte 0x11
		.byte 0x11
		.byte 0xFE

	Ardesiopoli_6_2_NPC0_mov2:
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0xFE

.global EventScript_Ardesiopoli_6_2_NPC1
EventScript_Ardesiopoli_6_2_NPC1:
	trainerbattle0 0x0 0x1B 0x0 EventScript_Ardesiopoli_6_2_NPC1_text1 EventScript_Ardesiopoli_6_2_NPC1_text2
	msgbox EventScript_Ardesiopoli_6_2_NPC1_text3 MSG_NORMAL
	end

.global EventScript_Ardesiopoli_6_2_NPC2
EventScript_Ardesiopoli_6_2_NPC2:
	lock
	faceplayer
	checkflag 0x820
	if 0x1 _goto EventScript_Ardesiopoli_6_2_NPC2_P1
	msgbox EventScript_Ardesiopoli_6_2_NPC2_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_2_NPC2_P1:
		msgbox EventScript_Ardesiopoli_6_2_NPC2_text2 MSG_NORMAL
		release
		end	

.global EventScript_Ardesiopoli_6_2_NPC4
EventScript_Ardesiopoli_6_2_NPC4:
	trainerbattle0 0x0 0x1C 0x0 EventScript_Ardesiopoli_6_2_NPC4_text1 EventScript_Ardesiopoli_6_2_NPC4_text2
	msgbox EventScript_Ardesiopoli_6_2_NPC4_text3 MSG_NORMAL
	end

.global EventScript_Ardesiopoli_6_2_NPC3
EventScript_Ardesiopoli_6_2_NPC3:
	trainerbattle0 0x0 0x1D 0x0 EventScript_Ardesiopoli_6_2_NPC3_text1 EventScript_Ardesiopoli_6_2_NPC3_text2
	msgbox EventScript_Ardesiopoli_6_2_NPC3_text3 MSG_NORMAL
	end