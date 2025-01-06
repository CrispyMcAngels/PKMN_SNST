.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Percorso11_3_25
gMapScripts_Percorso11_3_25:
	mapscript MAP_SCRIPT_ON_LOAD Percorso11_3_25_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

	Percorso11_3_25_MapScriptOnLoad:
		setvar 0x5007 0x0
		end

.global EventScript_Percorso_11_3_25_Sign0
EventScript_Percorso_11_3_25_Sign0:
	msgbox Percorso_11_3_25_Sign0_text1 MSG_SIGN
	end

.global EventScript_Percorso_11_3_25_Sign1
EventScript_Percorso_11_3_25_Sign1:
	msgbox Percorso_11_3_25_Sign1_text1 MSG_SIGN
	end

.global EventScript_Percorso_11_Brandon
EventScript_Percorso_11_Brandon:
	lock
	compare 0x4051 0x12
	if 0x1 _call EventScript_Percorso_11_Brandon_Part1
	faceplayer
	showpokepic 0x3B5 0x15 0x6
	msgbox Percorso_11_Brandon_text1 0x7
	special 0x15A
	release
	end


	EventScript_Percorso_11_Brandon_Part1:
	//mmh dannzione
	showpokepic 0x3B5 0x15 0x6
	msgbox Percorso_11_Brandon_text2 0x7
	special 0x15A
	applymovement 0x1 EventScript_Percorso_11_Brandon_mov1
	waitmovement 0x0
	playsong 0x13C 0x0
	//mmh dannzione
	showpokepic 0x3B5 0x15 0x6
	msgbox Percorso_11_Brandon_text3 0x7
	special 0x15A
	applymovement 0xFF EventScript_Percorso_11_Brandon_mov2
	waitmovement 0x0
	//vai axew...
	showpokepic 0x3B6 0x0 0x6
	msgbox Percorso_11_Brandon_text4 0x7
	special 0x15A
	movesprite 0x7 0x0F 0x0A
	pause 0x1E
	movesprite 0x6 0x0F 0x0A
	hidesprite 0x7
	msgbox Percorso_11_Brandon_text5 0x7
	cry 0x297 0x0
	pause 0x1E
	//vai deinoo...
	showpokepic 0x3B5 0x15 0x6
	msgbox Percorso_11_Brandon_text5a 0x7
	special 0x15A
	movesprite 0x7 0x10 0x0A
	showsprite 0x7
	pause 0x1E
	movesprite 0x2 0x10 0x0A
	hidesprite 0x7
	msgbox Percorso_11_Brandon_text6 0x7
	cry 0x2AE 0x0
	fadedefault

	//trainerbattle
	setvar 0x503A 0x2 
	setvar 0x503B 0x0
	trainerbattle3 0x3 0x146 0x100 Percorso_11_Brandon_textIntro

	showpokepic 0x3B5 0x15 0x6
	msgbox Percorso_11_Brandon_text7 0x7
	special 0x15A
	cry 0x2AE 0x0
	movesprite2 0x2 0x09 0x0B
	hidesprite 0x2
	pause 0x1E
	//ottimo lavoro axew...
	showpokepic 0x3B6 0x0 0x6
	msgbox Percorso_11_Brandon_text8 0x7
	special 0x15A
	cry 0x297 0x0
	hidesprite 0x6

	//arriva prof oak
	playsong 0x012E 0x0
	movesprite 0x5 0x06 0x09
	applymovement 0x5 EventScript_Percorso_11_Brandon_mov4
	waitmovement 0x0
	pause 0x1E
	fadedefault
	applymovement 0xFF EventScript_Percorso_11_Brandon_mov5
	applymovement 0x1 EventScript_Percorso_11_Brandon_mov6	
	waitmovement 0x0
	//eccomi ragazzi...
	showpokepic 0x3B7 0x0 0x6
	msgbox Percorso_11_Brandon_text9 0x7
	special 0x15A
	fanfare 0x0101
	msgbox Percorso_11_Brandon_text10 0x7
	applymovement 0x5 EventScript_Percorso_11_Brandon_mov7
	waitmovement 0x0
	//tieni brandon...
	showpokepic 0x3B7 0x0 0x6
	msgbox Percorso_11_Brandon_text11 0x7
	special 0x15A
	pause 0x1E
	fanfare 0x0101
	msgbox Percorso_11_Brandon_text12 0x7
	//questo strumento
	showpokepic 0x3B7 0x0 0x6
	msgbox Percorso_11_Brandon_text13 0x7
	special 0x15A
	pause 0x1E
	//grazie mille prof oak
	showpokepic 0x3B5 0x15 0x6
	msgbox Percorso_11_Brandon_text14 0x7
	special 0x15A
	pause 0x1E
	//certamente...
	showpokepic 0x3B7 0x0 0x6
	msgbox Percorso_11_Brandon_text15 0x7
	special 0x15A
	applymovement 0x1 EventScript_Percorso_11_Brandon_mov8
	waitmovement 0x0
	//hai sentito player?
	showpokepic 0x3B5 0x15 0x6
	msgbox Percorso_11_Brandon_text16 0x7
	special 0x15A
	spriteface 0x1 0x2
	pause 0x1E
	//sono certo...
	showpokepic 0x3B7 0x0 0x6
	msgbox Percorso_11_Brandon_text17 0x7
	special 0x15A
	playsong 0x012E 0x0 
	applymovement 0x5 EventScript_Percorso_11_Brandon_mov9
	waitmovement 0x0
	fadedefault
	hidesprite 0x5
	spriteface 0xFF 0x4
	spriteface 0x1 0x3
	pause 0x1E
	showpokepic 0x3B5 0x15 0x6
	msgbox Percorso_11_Brandon_text1 0x7
	special 0x15A
	applymovement 0x1 EventScript_Percorso_11_Brandon_mov10
	waitmovement 0x0
	special 0x0
	setvar 0x4051 0x13
	clearflag 0x950
	setflag 0x829
	release
	end
	

	EventScript_Percorso_11_Brandon_mov1:
		.byte 0x1A
		.byte 0x2 
		.byte 0x62
		.byte 0xFE

	EventScript_Percorso_11_Brandon_mov2:
		.byte 0x12
		.byte 0x12
		.byte 0x3 
		.byte 0xFE


	EventScript_Percorso_11_Brandon_mov4:
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x11
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x10 
		.byte 0x62
		.byte 0xFE

	EventScript_Percorso_11_Brandon_mov5:
		.byte 0x13
		.byte 0x1 
		.byte 0xFE

	EventScript_Percorso_11_Brandon_mov6:
		.byte 0x12
		.byte 0x1 
		.byte 0xFE
	
	EventScript_Percorso_11_Brandon_mov7:
		.byte 0x13
		.byte 0x0 
		.byte 0xFE

	EventScript_Percorso_11_Brandon_mov8:
		.byte 0x54
		.byte 0x54
		.byte 0xFE

	EventScript_Percorso_11_Brandon_mov9:
		.byte 0x11
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x10
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0xFE

	EventScript_Percorso_11_Brandon_mov10:
		.byte 0x13
		.byte 0xFE

.global EventScript_Percorso_11_3_25_NPC3
EventScript_Percorso_11_3_25_NPC3:
	lock
	faceplayer
	msgbox Percorso_11_3_25_NPC3_text1 0x7
	release
	end

.global EventScript_Percorso_11_3_25_NPC2
EventScript_Percorso_11_3_25_NPC2:
	lock
	faceplayer
	cry 0x1C1 0x0
	msgbox Percorso_11_3_25_NPC2_text1 0x7
	release
	end

.global EventScript_Percorso_11_3_25_NPC1
EventScript_Percorso_11_3_25_NPC1:
	lock
	faceplayer
	cry 0x2AE 0x0
	msgbox Percorso_11_3_25_NPC1_text1 0x7
	release
	end