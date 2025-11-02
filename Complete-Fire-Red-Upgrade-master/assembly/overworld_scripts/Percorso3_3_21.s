.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global EventScript_Percorso3_3_21_tile3
EventScript_Percorso3_3_21_tile3:
	lockall
	playsong 0x0 0x0
	fadescreen 0x1
	pause 0x1E
	clearflag 0x35
	clearflag 0x36
	clearflag 0x37
	clearflag 0x38
	clearflag 0x39
	clearflag 0x3A
	clearflag 0x3B
	clearflag 0x3C
	msgbox Percorso3_3_21_tile3_text1 0x7
	setvar 0x501F 0x12E
	warpmuted 0x1 0x1 0xFF 0x15 0x20
	releaseall 
	end


.global EventScript_Percorso3_3_21_tile0
EventScript_Percorso3_3_21_tile0:
	lockall
	pause 0x1E
	applymovement 0x12 Percorso3_3_21_tile0_mov0
	waitmovement 0x12
	cry 0xB2 0x0
	msgbox Percorso3_3_21_tile0_text1 MSG_NORMAL
	pause 0x1E
	applymovement 0x12 Percorso3_3_21_tile0_mov1
	waitmovement 0x12
	pause 0x1E	
	movesprite2 0x12 0x1B 0x07	
	movesprite 0x12 0x1B 0x07
	pause 0x1E
	applymovement 0xFF Percorso3_3_21_tile0_mov2
	waitmovement 0xFF	
	pause 0x1E
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	textcolor 0x0
    msgbox Percorso3_3_21_tile0_text2 MSG_NORMAL
    special 0x15A
	setvar 0x4051 0x37
	setvar 0x4052 0x6
	releaseall
	end

	Percorso3_3_21_tile0_mov0:
		.byte 0x2
		.byte 0x1C
		.byte 0x62
		.byte 0xFE

	Percorso3_3_21_tile0_mov1:
		.byte 0x1E
		.byte 0x1E
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x1D
		.byte 0x1D
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0xFE

	Percorso3_3_21_tile0_mov2:
		.byte 0x63
		.byte 0xFE

.global EventScript_Percorso3_3_21_tile1
EventScript_Percorso3_3_21_tile1:
	lockall
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	textcolor 0x0
    msgbox Percorso3_3_21_tile1_text1 MSG_NORMAL
    special 0x15A
	applymovement 0xFF Percorso3_3_21_tile1_mov0
	waitmovement 0xFF
	releaseall
	end

	Percorso3_3_21_tile1_mov0:
		.byte 0x11
		.byte 0xFE

.global EventScript_Percorso3_3_21_tile2
EventScript_Percorso3_3_21_tile2:
	lockall
	spriteface 0xFF 0x4
	pause 0x1E
	applymovement 0x12 Percorso3_3_21_tile0_mov0
	waitmovement 0x12
	cry 0xB2 0x0
	msgbox Percorso3_3_21_tile0_text1 MSG_NORMAL
	pause 0x1E
	applymovement 0x12 Percorso3_3_21_tile2_mov1
	waitmovement 0x12	
	sound 0x9
	pause 0x1E
	movesprite2 0x12 0x0 0x0	
	movesprite 0x12 0x0 0x0
	pause 0x1E
	applymovement 0xFF Percorso3_3_21_tile2_mov2
	waitmovement 0xFF
	compare 0x501F 0x100
	if 0x1 _call Player_Blue
	compare 0x501F 0x1A3
	if 0x1 _call Player_Orange
	compare 0x501F 0x1A4
	if 0x1 _call Player_Green
	textcolor 0x0
    msgbox Percorso3_3_21_tile2_text1 MSG_NORMAL
    special 0x15A
	setvar 0x4051 0x38
	releaseall
	end

	Percorso3_3_21_tile2_mov1:
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x11
		.byte 0x60
		.byte 0x1E
		.byte 0xFE

	Percorso3_3_21_tile2_mov2:
		.byte 0x62
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


.global gMapScripts_Percorso3_3_21
gMapScripts_Percorso3_3_21:
	mapscript MAP_SCRIPT_ON_LOAD Percorso2_3_21_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

		Percorso2_3_21_MapScriptOnLoad:
			setvar 0x5007 0x0
			compare 0x4051 0x36
			if 0x1 _call Percorso2_3_21_MapScriptOnLoad_Xatu1
			compare 0x4051 0x37
			if 0x1 _call Percorso2_3_21_MapScriptOnLoad_Xatu2
			end

			Percorso2_3_21_MapScriptOnLoad_Xatu1:
				movesprite2 0x12 0x0A 0x06
				spritebehave 0xB 0x1
				return

			Percorso2_3_21_MapScriptOnLoad_Xatu2:
				movesprite2 0x12 0x1B 0x07
				return

.global EventScript_Percorso_3_3_21_NPC0
EventScript_Percorso_3_3_21_NPC0:
	//Gentiluomo
	trainerbattle0 0x0 0x22 0x0 Percorso_3_3_21_NPC0_text1 Percorso_3_3_21_NPC0_text2
	msgbox Percorso_3_3_21_NPC0_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC1
EventScript_Percorso_3_3_21_NPC1:
	lock
	faceplayer
	msgbox Percorso_3_3_21_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC3
EventScript_Percorso_3_3_21_NPC3:
	//ranger F
	trainerbattle0 0x0 0x23 0x0 Percorso_3_3_21_NPC3_text1 Percorso_3_3_21_NPC3_text2
	msgbox Percorso_3_3_21_NPC3_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC4
EventScript_Percorso_3_3_21_NPC4:
	//Cintura nera
	trainerbattle0 0x0 0x24 0x0 Percorso_3_3_21_NPC4_text1 Percorso_3_3_21_NPC4_text2
	msgbox Percorso_3_3_21_NPC4_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC5
EventScript_Percorso_3_3_21_NPC5:
	//Ranger F 2
	trainerbattle0 0x0 0x25 0x0 Percorso_3_3_21_NPC5_text1 Percorso_3_3_21_NPC5_text2
	msgbox Percorso_3_3_21_NPC5_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC6
EventScript_Percorso_3_3_21_NPC6:
	//Bird one
	trainerbattle0 0x0 0x26 0x0 Percorso_3_3_21_NPC6_text1 Percorso_3_3_21_NPC6_text2
	msgbox Percorso_3_3_21_NPC6_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC7
EventScript_Percorso_3_3_21_NPC7:
	//tipa 2
	trainerbattle0 0x0 0x27 0x0 Percorso_3_3_21_NPC7_text1 Percorso_3_3_21_NPC7_text2
	msgbox Percorso_3_3_21_NPC7_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC8
EventScript_Percorso_3_3_21_NPC8:
	//bullo
	trainerbattle0 0x0 0x28 0x0 Percorso_3_3_21_NPC8_text1 Percorso_3_3_21_NPC8_text2
	msgbox Percorso_3_3_21_NPC8_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC9
EventScript_Percorso_3_3_21_NPC9:
	//ranger M
	trainerbattle0 0x0 0x29 0x0 Percorso_3_3_21_NPC9_text1 Percorso_3_3_21_NPC9_text2
	msgbox Percorso_3_3_21_NPC9_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC10
EventScript_Percorso_3_3_21_NPC10:
	lock
	faceplayer
	checkflag 0x02F
	if 0x1 _goto EventScript_Percorso_3_3_21_NPC10_P1
	msgbox Percorso_3_3_21_NPC10_text1 MSG_NORMAL
	pause 0x1E
	giveitem 0x16 0x2 MSG_OBTAIN
	setflag 0x02F
	release
	end

	EventScript_Percorso_3_3_21_NPC10_P1:
		msgbox Percorso_3_3_21_NPC10_text2 MSG_NORMAL
		release
		end

.global EventScript_Percorso_3_3_21_NPC11
EventScript_Percorso_3_3_21_NPC11:
	lock
	faceplayer
	msgbox Percorso_3_3_21_NPC11_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_3_3_21_NPC14
EventScript_Percorso_3_3_21_NPC14:
	giveitem 0x18 0x1 MSG_FIND
	end

.global EventScript_Percorso_3_3_21_NPC15
EventScript_Percorso_3_3_21_NPC15:
	giveitem 0x22 0x1 MSG_FIND
	end

.global EventScript_Percorso_3_3_21_NPC16
EventScript_Percorso_3_3_21_NPC16:
	giveitem 0x56 0x1 MSG_FIND
	end

.global EventScript_Percorso_3_3_21_Sign0_1
EventScript_Percorso_3_3_21_Sign0_1:
	msgbox Percorso_3_3_21_Sign0_1 0x7
	end

.global EventScript_Percorso_3_3_21_Sign2
EventScript_Percorso_3_3_21_Sign2:
	msgbox Percorso_3_3_21_Sign2 0x7
	end

.global EventScript_Percorso_3_3_21_Sign3
EventScript_Percorso_3_3_21_Sign3:
	msgbox Percorso_3_3_21_Sign3 0x7
	end

.global EventScript_Percorso_3_3_21_Sign4
EventScript_Percorso_3_3_21_Sign4:
	msgbox Percorso_3_3_21_Sign4 0x7
	end

.global EventScript_Percorso_3_3_21_Sign5
EventScript_Percorso_3_3_21_Sign5:
	msgbox Percorso_3_3_21_Sign5 0x7
	end