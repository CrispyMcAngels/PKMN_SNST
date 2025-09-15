.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Percorso4_3_22
gMapScripts_Percorso4_3_22:
	mapscript MAP_SCRIPT_ON_LOAD Percorso4_3_22_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

		Percorso4_3_22_MapScriptOnLoad:
			setvar 0x5007 0x0
			end


//___SIGNs___

	.global EventScript_Percorso_4_3_22_Sign0
	EventScript_Percorso_4_3_22_Sign0:
		msgbox Percorso_4_3_22_Sign0 0x7
		end

	.global EventScript_Percorso_4_3_22_Sign1_5
	EventScript_Percorso_4_3_22_Sign1_5:
		msgbox Percorso_4_3_22_Sign1_5 0x7
		end

	.global EventScript_Percorso_4_3_22_Sign6
	EventScript_Percorso_4_3_22_Sign6:
		msgbox Percorso_4_3_22_Sign6 0x7
		end

	.global EventScript_Percorso_4_3_22_Sign7
	EventScript_Percorso_4_3_22_Sign7:
		msgbox Percorso_4_3_22_Sign7 0x7
		end


//___NPCs___

.global EventScript_Percorso_4_3_22_NPC0
EventScript_Percorso_4_3_22_NPC0:
	lock
	faceplayer
	msgbox Percorso_4_3_22_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC1
EventScript_Percorso_4_3_22_NPC1:
	//lady aroma
	trainerbattle0 0x0 0x2A 0x0 Percorso_4_3_22_NPC1_text1 Percorso_4_3_22_NPC1_text2
	msgbox Percorso_4_3_22_NPC1_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC3
EventScript_Percorso_4_3_22_NPC3:
	//tipo 1
	trainerbattle0 0x0 0x2B 0x0 Percorso_4_3_22_NPC3_text1 Percorso_4_3_22_NPC3_text2
	msgbox Percorso_4_3_22_NPC3_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC4
EventScript_Percorso_4_3_22_NPC4:
	//pescatore
	trainerbattle0 0x0 0x2C 0x0 Percorso_4_3_22_NPC4_text1 Percorso_4_3_22_NPC4_text2
	msgbox Percorso_4_3_22_NPC4_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC5
EventScript_Percorso_4_3_22_NPC5:
	lock
	faceplayer
	msgbox Percorso_4_3_22_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC6
EventScript_Percorso_4_3_22_NPC6:
	//avventuriero
	trainerbattle0 0x0 0x2D 0x0 Percorso_4_3_22_NPC6_text1 Percorso_4_3_22_NPC6_text2
	msgbox Percorso_4_3_22_NPC6_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC7
EventScript_Percorso_4_3_22_NPC7:
	//ranger F
	trainerbattle0 0x0 0x2E 0x0 Percorso_4_3_22_NPC7_text1 Percorso_4_3_22_NPC7_text2
	msgbox Percorso_4_3_22_NPC7_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC8
EventScript_Percorso_4_3_22_NPC8:
	lock
	faceplayer
	msgbox Percorso_4_3_22_NPC8_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC9
EventScript_Percorso_4_3_22_NPC9:
	//lady aroma 2
	trainerbattle0 0x0 0x2F 0x0 Percorso_4_3_22_NPC9_text1 Percorso_4_3_22_NPC9_text2
	msgbox Percorso_4_3_22_NPC9_text3 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC10
EventScript_Percorso_4_3_22_NPC10:
	lock
	faceplayer
	msgbox Percorso_4_3_22_NPC10_text1 MSG_NORMAL
	release
	end

.global EventScript_Percorso_4_3_22_NPC11
EventScript_Percorso_4_3_22_NPC11:
	lock
	faceplayer
	checkitem 0x153 0x1
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Percorso_4_3_22_NPC11_P1
	msgbox Percorso_4_3_22_NPC11_text1 MSG_NORMAL
	setvar 0x503A 0x2 
	setvar 0x503B 0x0
	trainerbattle3 0x3 0x30 0x100 Percorso_4_3_22_NPC11_text2
	pause 0x1E
	msgbox Percorso_4_3_22_NPC11_text3 MSG_NORMAL
	pause 0x1E
	giveitem 0x153 0x1 MSG_OBTAIN
	pause 0x1E
	msgbox Percorso_4_3_22_NPC11_text4 MSG_NORMAL
	warpmuted 0x3 0x16 0xFF 0xB 0x28
	release
	end

	EventScript_Percorso_4_3_22_NPC11_P1:
		msgbox Percorso_4_3_22_NPC11_text4 MSG_NORMAL
		release
		end

.global EventScript_Percorso_4_3_22_NPC14
EventScript_Percorso_4_3_22_NPC14:
	giveitem 0x44 0x1 MSG_FIND
	end




//___TILESCRIPTs___


.global EventScript_Percorso4_3_22_tile0
EventScript_Percorso4_3_22_tile0:
	lockall
	pause 0x1E
	special 0x113
	applymovement 0x7F EventScript_Percorso4_3_22_tile0_mov0
	waitmovement 0x0
	pause 0x1E
	textcolor 0x0
	msgbox Percorso_4_3_22_tile0_text1 MSG_NORMAL
	pause 0x1E
	msgbox Percorso_4_3_22_tile0_text2 MSG_NORMAL
	pause 0x1E
	cry 0x115 0x0 
	textcolor 0x2
	msgbox Percorso_4_3_22_tile0_text3 MSG_NORMAL
	pause 0x1E
	applymovement 0xD EventScript_Percorso4_3_22_tile0_mov1
	waitmovement 0x0
	spriteface 0xC 0x2
	pause 0x1E
	cry 0x115 0x0 
	applymovement 0xD EventScript_Percorso4_3_22_tile0_mov2
	waitmovement 0x0	
	sound 0x79
	movesprite2 0xE 0x0 0x0
	hidesprite 0xE
	pause 0x1E
	applymovement 0xD EventScript_Percorso4_3_22_tile0_mov3
	waitmovement 0x0
	pause 0x1E
	textcolor 0x0
	msgbox Percorso_4_3_22_tile0_text4 MSG_NORMAL
	movesprite2 0xD 0x0 0x0
	hidesprite 0xD
	setflag 0x978
	pause 0x1E
	applymovement 0x7F EventScript_Percorso4_3_22_tile0_mov4
	waitmovement 0x0
	special 0x114
	applymovement 0xC EventScript_Percorso4_3_22_tile0_mov5
	waitmovement 0x0
	msgbox Percorso_4_3_22_tile0_text5 MSG_NORMAL
	pause 0x1E
	spriteface 0xC 0x3
	pause 0x1E
	spriteface 0xC 0x1
	msgbox Percorso_4_3_22_tile0_text6 MSG_NORMAL
	applymovement 0xC EventScript_Percorso4_3_22_tile0_mov6
	waitmovement 0x0
	spritebehave 0xC 0x1
	setvar 0x4051 0x34
	releaseall
	end

	EventScript_Percorso4_3_22_tile0_mov0:
		.byte 0x11
		.byte 0x11
		.byte 0xFE

	EventScript_Percorso4_3_22_tile0_mov1:
		.byte 0x11
		.byte 0x11
		.byte 0xFE

	EventScript_Percorso4_3_22_tile0_mov2:
		.byte 0x22
		.byte 0x22
		.byte 0xFE

	EventScript_Percorso4_3_22_tile0_mov3:
		.byte 0x0 
		.byte 0x52
		.byte 0x52
		.byte 0x1D
		.byte 0x1F
		.byte 0x0 
		.byte 0x66
		.byte 0xFE

	EventScript_Percorso4_3_22_tile0_mov4:
		.byte 0x10
		.byte 0x10
		.byte 0xFE

	EventScript_Percorso4_3_22_tile0_mov5:
		.byte 0x0 
		.byte 0x62
		.byte 0xFE

	EventScript_Percorso4_3_22_tile0_mov6:
		.byte 0x11
		.byte 0xFE
