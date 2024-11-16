.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Foresta_Frondosa_1_0
gMapScripts_Foresta_Frondosa_1_0:
	mapscript MAP_SCRIPT_ON_LOAD Foresta_Frondosa_1_0_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_RESUME Foresta_Frondosa_1_0_MapScriptOnResume
    .byte MAP_SCRIPT_TERMIN

		Foresta_Frondosa_1_0_MapScriptOnLoad:
			setworldmapflag 0x8A4
			setvar 0x5007 0x1 
			end
		
		Foresta_Frondosa_1_0_MapScriptOnResume:
			checkflag 0x0954
			if 0x1 _call Foresta_Frondosa_1_0_MapScriptOnResume_hideTreeckosAndRaito
			checkflag 0x0955
			if 0x1 _call Foresta_Frondosa_1_0_MapScriptOnResume_hideTreecko3
			end

		Foresta_Frondosa_1_0_MapScriptOnResume_hideTreeckosAndRaito:
			hidesprite 0x8
			hidesprite 0x9 
			hidesprite 0xB
			return

		Foresta_Frondosa_1_0_MapScriptOnResume_hideTreecko3:
			hidesprite 0xA
			return

.global EventScript_Foresta_Frondosa_1_0_Sign0
EventScript_Foresta_Frondosa_1_0_Sign0:
	msgbox Foresta_Frondosa_1_0_Sign0_text1 MSG_SIGN
	end

.global EventScript_Foresta_Frondosa_1_0_Sign2
EventScript_Foresta_Frondosa_1_0_Sign2:
	msgbox Foresta_Frondosa_1_0_Sign2_text1 MSG_SIGN
	end

.global EventScript_Foresta_Frondosa_1_0_Sign4
EventScript_Foresta_Frondosa_1_0_Sign4:
	msgbox Foresta_Frondosa_1_0_Sign4_text1 MSG_SIGN
	end

.global EventScript_Foresta_Frondosa_1_0_Sign5
EventScript_Foresta_Frondosa_1_0_Sign5:
	lockall
	compare 0x4051 0x1A
	if 0x4 _call Foresta_Frondosa_1_0_Sign5_after
	msgbox Foresta_Frondosa_1_0_Sign5_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Foresta_Frondosa_1_0_Sign5_yes
	if 0x0 _goto EventScript_Foresta_Frondosa_1_0_Sign5_no
	releaseall
	end

	EventScript_Foresta_Frondosa_1_0_Sign5_no:
		releaseall
		end

	Foresta_Frondosa_1_0_Sign5_after:
		msgbox Foresta_Frondosa_1_0_Sign5_text2 MSG_NORMAL
		releaseall
		end

	EventScript_Foresta_Frondosa_1_0_Sign5_yes:
		checkitem 0x98 0x1
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Foresta_Frondosa_1_0_Sign5_P1
		msgbox Foresta_Frondosa_1_0_Sign5_text3 MSG_NORMAL
		releaseall
		end

	EventScript_Foresta_Frondosa_1_0_Sign5_P1:
		removeitem 0x98 0x1
		msgbox Foresta_Frondosa_1_0_Sign5_text4 MSG_NORMAL
		pause 0x1E
		applymovement 0x8 Foresta_Frondosa_1_0_Sign5_mov1
		applymovement 0x9 Foresta_Frondosa_1_0_Sign5_mov2
		applymovement 0xA Foresta_Frondosa_1_0_Sign5_mov3
		applymovement 0xFF Foresta_Frondosa_1_0_Sign5_mov4
		waitmovement 0xA
		pause 0x1E
		msgbox Foresta_Frondosa_1_0_NPC9_text1 MSG_NORMAL
		cry 0x115 0x0 
		pause 0x1E
		applymovement 0x8 Foresta_Frondosa_1_0_Sign5_mov6
		applymovement 0x9 Foresta_Frondosa_1_0_Sign5_mov5
		applymovement 0xA Foresta_Frondosa_1_0_Sign5_mov5a
		waitmovement 0xA
		movesprite2 0xA 0x0E 0x0E
		spritebehave 0xA 0x1
		spriteface 0xFF 0x3
		pause 0x1E
		applymovement 0xB Foresta_Frondosa_1_0_Sign5_mov7
		waitmovement 0xB
		spriteface 0xFF 0x4 
		pause 0x1E
		showpokepic 0x3BA 0x0 0x6
		msgbox Foresta_Frondosa_1_0_Sign5_text5 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0xB Foresta_Frondosa_1_0_Sign5_mov8
		waitmovement 0xB
		movesprite2 0xB 0x1 0x0
		pause 0x1E
		showpokepic 0x3B6 0x0 0x6
		msgbox Foresta_Frondosa_1_0_Sign5_text6 MSG_NORMAL
		closeonkeypress
		special 0x15A
		setflag 0x954
		setvar 0x4051 0x1A
		releaseall
		end

		Foresta_Frondosa_1_0_Sign5_mov1:
			.byte 0x1C
			.byte 0x3 
			.byte 0x1B
			.byte 0x62
			.byte 0x1D
			.byte 0x20
			.byte 0x20
			.byte 0x20
			.byte 0x20
			.byte 0x1E
			.byte 0x2 
			.byte 0xFE

		Foresta_Frondosa_1_0_Sign5_mov2:
			.byte 0x1C
			.byte 0x1C
			.byte 0x3 
			.byte 0x1B
			.byte 0x62
			.byte 0x1D
			.byte 0x20
			.byte 0x20
			.byte 0x20
			.byte 0xFE

		Foresta_Frondosa_1_0_Sign5_mov3:
			.byte 0x1C
			.byte 0x3 
			.byte 0x1B
			.byte 0x62
			.byte 0x1D
			.byte 0x1D
			.byte 0x20
			.byte 0x20
			.byte 0x20
			.byte 0x1 
			.byte 0xFE

		Foresta_Frondosa_1_0_Sign5_mov4:
			.byte 0x1C
			.byte 0x1C
			.byte 0x1C
			.byte 0x2 
			.byte 0x62
			.byte 0x1D
			.byte 0x1D
			.byte 0x1 
			.byte 0xFE

		Foresta_Frondosa_1_0_Sign5_mov5:
			.byte 0x1F
			.byte 0x1F
			.byte 0x1F
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0xFE

		Foresta_Frondosa_1_0_Sign5_mov5a:
			.byte 0x1F
			.byte 0x1F
			.byte 0x1E
			.byte 0x1E
			.byte 0x1F
			.byte 0x1E
			.byte 0x1E
			.byte 0xFE

		Foresta_Frondosa_1_0_Sign5_mov6:
			.byte 0x1D
			.byte 0x1F
			.byte 0x1F
			.byte 0x1F
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0xFE

		Foresta_Frondosa_1_0_Sign5_mov7:
			.byte 0x11
			.byte 0x2 
			.byte 0xFE

		Foresta_Frondosa_1_0_Sign5_mov8:
			.byte 0x11
			.byte 0x11
			.byte 0x13
			.byte 0x13
			.byte 0x11
			.byte 0x11
			.byte 0x11
			.byte 0x11
			.byte 0x13
			.byte 0x11
			.byte 0x11
			.byte 0x11
			.byte 0x60
			.byte 0xFE




//NPC da 0 a 6 sono Rocket

.global EventScript_Foresta_Frondosa_1_0_NPC0
EventScript_Foresta_Frondosa_1_0_NPC0:

	trainerbattle0 0x0 0x4 0x0 Foresta_Frondosa_1_0_NPC0_text1 Foresta_Frondosa_1_0_NPC0_text2
	msgbox Foresta_Frondosa_1_0_NPC0_text3 MSG_NORMAL

	end

.global EventScript_Foresta_Frondosa_1_0_NPC1
EventScript_Foresta_Frondosa_1_0_NPC1:

	trainerbattle0 0x0 0x5 0x0 Foresta_Frondosa_1_0_NPC1_text1 Foresta_Frondosa_1_0_NPC1_text2
	msgbox Foresta_Frondosa_1_0_NPC1_text3 MSG_NORMAL

	end

.global EventScript_Foresta_Frondosa_1_0_NPC2
EventScript_Foresta_Frondosa_1_0_NPC2:

	trainerbattle0 0x0 0x6 0x0 Foresta_Frondosa_1_0_NPC2_text1 Foresta_Frondosa_1_0_NPC2_text2
	msgbox Foresta_Frondosa_1_0_NPC2_text3 MSG_NORMAL

	end

.global EventScript_Foresta_Frondosa_1_0_NPC3
EventScript_Foresta_Frondosa_1_0_NPC3:

	trainerbattle0 0x0 0x7 0x0 Foresta_Frondosa_1_0_NPC3_text1 Foresta_Frondosa_1_0_NPC3_text2
	msgbox Foresta_Frondosa_1_0_NPC3_text3 MSG_NORMAL

	end

.global EventScript_Foresta_Frondosa_1_0_NPC4
EventScript_Foresta_Frondosa_1_0_NPC4:

	trainerbattle0 0x0 0x8 0x0 Foresta_Frondosa_1_0_NPC4_text1 Foresta_Frondosa_1_0_NPC4_text2
	msgbox Foresta_Frondosa_1_0_NPC4_text3 MSG_NORMAL

	end

.global EventScript_Foresta_Frondosa_1_0_NPC5
EventScript_Foresta_Frondosa_1_0_NPC5:

	trainerbattle0 0x0 0x9 0x0 Foresta_Frondosa_1_0_NPC5_text1 Foresta_Frondosa_1_0_NPC5_text2
	msgbox Foresta_Frondosa_1_0_NPC5_text3 MSG_NORMAL

	end

.global EventScript_Foresta_Frondosa_1_0_NPC6
EventScript_Foresta_Frondosa_1_0_NPC6:

	trainerbattle0 0x0 0xA 0x0 Foresta_Frondosa_1_0_NPC6_text1 Foresta_Frondosa_1_0_NPC6_text2
	msgbox Foresta_Frondosa_1_0_NPC6_text3 MSG_NORMAL

	end

//NPC da 7 a 9 treecko

.global EventScript_Foresta_Frondosa_1_0_NPC7
EventScript_Foresta_Frondosa_1_0_NPC7:
	lock
	faceplayer
	applymovement 0x7 Foresta_Frondosa_1_0_NPC7_mov1
	waitmovement 0x0
	cry 0x115 0x0 
    msgbox Foresta_Frondosa_1_0_NPC7_text1 MSG_NORMAL	
	pause 0x1E
	applymovement 0xFF Foresta_Frondosa_1_0_NPC7_mov2
	waitmovement 0xFF
	showpokepic 0x3B6 0x0 0x6
    msgbox Foresta_Frondosa_1_0_NPC7_text2 MSG_NORMAL
    special 0x15A
	pause 0x1E
	compare 0x4051 0x18
	if 0x1 _call EventScript_Foresta_Frondosa_1_0_NPC7_P1
	if 0x0 _call EventScript_Foresta_Frondosa_1_0_NPC7_P2
	release
	end

	EventScript_Foresta_Frondosa_1_0_NPC7_P2:
		release
		end

	EventScript_Foresta_Frondosa_1_0_NPC7_P1:
		applymovement 0xB Foresta_Frondosa_1_0_NPC7_mov3
		waitmovement 0xB	
		spriteface 0xFF 0x4
		pause 0x1E
		showpokepic 0x3BA 0x0 0x6
		msgbox Foresta_Frondosa_1_0_NPC7_text3 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0xB Foresta_Frondosa_1_0_NPC7_mov4
		waitmovement 0xB
		setvar 0x4051 0x18
		release
		end

	Foresta_Frondosa_1_0_NPC7_mov1:
		.byte 0x62
		.byte 0x52
		.byte 0x52
		.byte 0xFE

	Foresta_Frondosa_1_0_NPC7_mov2:
		.byte 0x10
		.byte 0x1 
		.byte 0xFE

	Foresta_Frondosa_1_0_NPC7_mov3:
		.byte 0x11
		.byte 0x11
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0xFE

	Foresta_Frondosa_1_0_NPC7_mov4:
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x10
		.byte 0x10
		.byte 0x2 
		.byte 0xFE

.global EventScript_Foresta_Frondosa_1_0_NPC8
EventScript_Foresta_Frondosa_1_0_NPC8:
	lock
	faceplayer
	applymovement 0x7 Foresta_Frondosa_1_0_NPC7_mov1
	waitmovement 0x0
	cry 0x115 0x0 
    msgbox Foresta_Frondosa_1_0_NPC7_text1 MSG_NORMAL	
	pause 0x1E
	applymovement 0xFF Foresta_Frondosa_1_0_NPC7_mov2
	waitmovement 0xFF
	showpokepic 0x3B6 0x0 0x6
    msgbox Foresta_Frondosa_1_0_NPC7_text2 MSG_NORMAL
    special 0x15A
	pause 0x1E
	compare 0x4051 0x18
	if 0x1 _call EventScript_Foresta_Frondosa_1_0_NPC8_P1
	if 0x0 _call EventScript_Foresta_Frondosa_1_0_NPC8_P2
	release
	end

	EventScript_Foresta_Frondosa_1_0_NPC8_P2:
		release
		end

	EventScript_Foresta_Frondosa_1_0_NPC8_P1:
		applymovement 0xB Foresta_Frondosa_1_0_NPC8_mov3
		waitmovement 0xB	
		spriteface 0xFF 0x4
		pause 0x1E
		showpokepic 0x3BA 0x0 0x6
		msgbox Foresta_Frondosa_1_0_NPC7_text3 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0xB Foresta_Frondosa_1_0_NPC8_mov4
		waitmovement 0xB
		setvar 0x4051 0x19
		release
		end

	Foresta_Frondosa_1_0_NPC8_mov3:
		.byte 0x11
		.byte 0x11
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0xFE

	Foresta_Frondosa_1_0_NPC8_mov4:
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x10
		.byte 0x10
		.byte 0x2 
		.byte 0xFE

.global EventScript_Foresta_Frondosa_1_0_NPC9
EventScript_Foresta_Frondosa_1_0_NPC9:
	lock
	faceplayer
    msgbox Foresta_Frondosa_1_0_NPC9_text1 MSG_NORMAL	
	cry 0x115 0x0 
	wildbattle 0x115 0x5 0x0
	hidesprite 0xA
	setflag 0x955
	release
	end


//NPC 10 raito
.global EventScript_Foresta_Frondosa_1_0_NPC10
EventScript_Foresta_Frondosa_1_0_NPC10:
	lock
	faceplayer
	showpokepic 0x3BA 0x0 0x6
	msgbox Foresta_Frondosa_1_0_NPC10_text1 MSG_NORMAL
	special 0x15A
	release
	end

//NPC 11 e 12 pigliamosche

.global EventScript_Foresta_Frondosa_1_0_NPC11
EventScript_Foresta_Frondosa_1_0_NPC11:

	trainerbattle0 0x0 0xB 0x0 Foresta_Frondosa_1_0_NPC11_text1 Foresta_Frondosa_1_0_NPC11_text2
	msgbox Foresta_Frondosa_1_0_NPC11_text3 MSG_NORMAL

	end

.global EventScript_Foresta_Frondosa_1_0_NPC12
EventScript_Foresta_Frondosa_1_0_NPC12:

	trainerbattle0 0x0 0xC 0x0 Foresta_Frondosa_1_0_NPC12_text1 Foresta_Frondosa_1_0_NPC12_text2
	msgbox Foresta_Frondosa_1_0_NPC12_text3 MSG_NORMAL

	end

//NPC 13, 14, 15 persone normali

.global EventScript_Foresta_Frondosa_1_0_NPC13
EventScript_Foresta_Frondosa_1_0_NPC13:
	lock
	faceplayer
	msgbox Foresta_Frondosa_1_0_NPC13_text1 MSG_NORMAL
	release
	end

.global EventScript_Foresta_Frondosa_1_0_NPC14
EventScript_Foresta_Frondosa_1_0_NPC14:
	lock
	faceplayer
	msgbox Foresta_Frondosa_1_0_NPC14_text1 MSG_NORMAL
	release
	end

.global EventScript_Foresta_Frondosa_1_0_NPC15
EventScript_Foresta_Frondosa_1_0_NPC15:
	lock
	faceplayer
	msgbox Foresta_Frondosa_1_0_NPC15_text1 MSG_NORMAL
	release
	end

//NPC 16, 17, 18, 19 pokeballs

.global EventScript_Foresta_Frondosa_1_0_NPC16
EventScript_Foresta_Frondosa_1_0_NPC16:
	giveitem 0x16 0x1 MSG_FIND
	end

.global EventScript_Foresta_Frondosa_1_0_NPC17
EventScript_Foresta_Frondosa_1_0_NPC17:
	giveitem 0x3 0x1 MSG_FIND
	end

.global EventScript_Foresta_Frondosa_1_0_NPC18
EventScript_Foresta_Frondosa_1_0_NPC18:
	giveitem 0x56 0x1 MSG_FIND
	end

.global EventScript_Foresta_Frondosa_1_0_NPC19
EventScript_Foresta_Frondosa_1_0_NPC19:
	giveitem 0xE 0x1 MSG_FIND
	end