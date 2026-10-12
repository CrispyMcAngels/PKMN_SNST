.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
.include "../asm_defines.s"

@Santuario del Vento, the heart of the shrine: the Custode's test (tag battle with Crispy), the Ho-Oh fresco,
@Raito and the Fiamma Gialla. Story var 0x4051: 0x54 (sent here by Raito in Risaia Rosa) -> 0x55

.equ TRAINER_CUSTODE, 0x5F @95
.equ PARTNER_CRISPY, 0x60 @96, Crispy's team in the tag battle
.equ CRISPY_BACKSPRITE, 0x5 @Trainer back sprite 5
.equ ITEM_FIAMMA_GIALLA, 0x175 @PLACEHOLDER: ITEM_RUBY until the Fiamma Gialla exists

//___LEVEL___

.global gMapScripts_Santuario_del_Vento_1_62
gMapScripts_Santuario_del_Vento_1_62:
	mapscript MAP_SCRIPT_ON_LOAD Santuario_del_Vento_1_62_OnLoad
	.byte MAP_SCRIPT_TERMIN

Santuario_del_Vento_1_62_OnLoad:
	setvar 0x5041 0x0
	setvar 0x5007 0x19
	end


//___TILE___

@Trigger 0 in HMA: var 0x4051, value 0x54
.global EventScript_Santuario_del_Vento_1_62_Tile0
EventScript_Santuario_del_Vento_1_62_Tile0:
	lockall
	call EventScript_FollowerMon_CutsceneHideInstant
	@1. The Custode's test
	applymovement 0xFF Santuario_del_Vento_1_62_mov1
	waitmovement 0xFF
	pause 0x1E
	movesprite 0x3 0x8 0x13
	applymovement 0x3 Santuario_del_Vento_1_62_mov_CrispyArrives
	waitmovement 0x3
	pause 0x1E
	sound 0x15
	applymovement 0x1 mov_exclamation
	waitmovement 0x1
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text2 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text3 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text4 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text5 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text6 MSG_NORMAL
	special 0x15A
	pause 0x1E
	applymovement 0x1 Santuario_del_Vento_1_62_mov2
	waitmovement 0x1	
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text7 MSG_NORMAL
	special 0x15A
	pause 0x1E
	spriteface 0x3 0x4
	pause 0x10
	spriteface 0xFF 0x3
	pause 0x1E
	show_mugshot CRISPY
	preparemsg Santuario_del_Vento_1_62_text8
	waitmsg
	special 0x15A @The portrait goes first: its box and the menu's share the same tiles (0x38)
	setvar 0x8000 0xC @Scrolling list 12 (src/scripting.c): two "...", any answer goes on the same way
	setvar 0x8001 0x2
	setvar 0x8004 0x0 @Special 0x158 is only CFRU's scrolling multichoice when 0x8004 is 0
	special 0x158
	waitstate
	closeonkeypress
	pause 0x1E
	spriteface 0x3 0x2
	spriteface 0xFF 0x2
	pause 0x1E
	applymovement 0x1 Santuario_del_Vento_1_62_mov3
	waitmovement 0x1

	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text9 MSG_NORMAL
	closeonkeypress
	special 0x15A
	
	trainerbattle12 0xC TRAINER_CUSTODE PARTNER_CRISPY CRISPY_BACKSPRITE 0x0 Santuario_del_Vento_1_62_text_Defeat
	fadedefault
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text10 MSG_NORMAL
	special 0x15A
	pause 0x1E
	sound 0x15
	applymovement 0x1 mov_exclamation
	waitmovement 0x1
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text11 MSG_NORMAL
	closeonkeypress
	special 0x15A

	@2. To the chapel and the fresco
	applymovement 0x1 Santuario_del_Vento_1_62_mov_CustodeToChapel
	applymovement 0xFF Santuario_del_Vento_1_62_mov_PlayerToChapel
	applymovement 0x3 Santuario_del_Vento_1_62_mov_CrispyToChapel
	waitmovement 0x0
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text12 MSG_NORMAL
	special 0x15A
	pause 0x1E

	setvar 0x503E 0x325D
	call EventScript_RefreshTextColor

	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text13 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text14 MSG_NORMAL
	special 0x15A
	pause 0x1E
	spriteface 0x1 0x1
	pause 0x1E
	sound 0x15
	applymovement 0x1 mov_question
	waitmovement 0x1
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text15 MSG_NORMAL
	special 0x15A
	pause 0x1E
	applymovement 0xFF Santuario_del_Vento_1_62_mov_Nod
	waitmovement 0xFF
	pause 0x1E
	
	spriteface 0x3 0x4
	pause 0x1e
	sound 0x15
	applymovement 0x3 mov_exclamation
	waitmovement 0x3
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text15a MSG_NORMAL
	special 0x15A
	pause 0x1E

	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text15b MSG_NORMAL
	special 0x15A
	pause 0x1E

	//custom color to dusk 
	setvar 0x503E 0x2447
	call EventScript_RefreshTextColor

	msgbox Santuario_del_Vento_1_62_text16 MSG_NORMAL @The player's story, no speaker
	pause 0x1F

	sound 0x15
	applymovement 0x3 mov_exclamation
	waitmovement 0x3
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text17 MSG_NORMAL
	special 0x15A
	pause 0x1E
	spriteface 0x1 0x2
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text18 MSG_NORMAL
	special 0x15A
	pause 0x1E

	spriteface 0x3 0x2
	pause 0x1E
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text19 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text20 MSG_NORMAL
	special 0x15A
	pause 0x1E

	@3. The legend
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text21 MSG_NORMAL
	special 0x15A
	pause 0x1E
	spriteface 0x1 0x3
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text22 MSG_NORMAL
	special 0x15A
	spriteface 0x1 0x1
	pause 0x1E
	sound 0x15
	applymovement 0x3 mov_question
	waitmovement 0x3
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text23 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text24 MSG_NORMAL
	special 0x15A
	spriteface 0x1 0x2
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text25 MSG_NORMAL
	special 0x15A
	spriteface 0x1 0x1
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text26 MSG_NORMAL
	special 0x15A
	pause 0x1E
	closeonkeypress
	pause 0x3C @The wind through the chapel
	sound 0x7A

	@4. Raito: a lightning strike, a white flash and he stands in the chapel
	pause 0x1E
	sound 0xE @Thunder
	setvar 0x8004 0x0
	setvar 0x8005 0x4
	setvar 0x8006 0x8
	setvar 0x8007 0x4
	special 0x136
	//fare movesprite instead
	movesprite 0x4 0x8 0xD
	applymovement 0x4 Santuario_del_Vento_1_62_mov4
	waitmovement 0x4
	movesprite 0x4 0x0 0x0
	pause 0x1E
	spriteface 0xFF 0x1
	spriteface 0x3 0x1
	sound 0x15
	applymovement 0xFF mov_exclamation
	applymovement 0x3 mov_exclamation
	waitmovement 0x0
	pause 0x1E
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text27 MSG_NORMAL
	special 0x15A
	pause 0x1E
	show_mugshot CUSTODE
	msgbox Santuario_del_Vento_1_62_text28 MSG_NORMAL
	special 0x15A
	pause 0x1E

	fadescreen 0x3 @To white
	sound 0x29 @Electricity
	movesprite 0x2 0x8 0xD
	fadescreen 0x2 @From white
	pause 0x1E

//until here

//aggiungere tipo, scusate il ritardo...

	show_mugshot RAITO
	msgbox Santuario_del_Vento_1_62_text29 MSG_NORMAL
	special 0x15A

	pause 0x1E
	show_mugshot RAITO
	msgbox Santuario_del_Vento_1_62_text30 MSG_NORMAL
	special 0x15A
	closeonkeypress
	sound 0xC3 @The flame lights up
	pause 0x1E
	msgbox Santuario_del_Vento_1_62_text31 MSG_NORMAL
	show_mugshot RAITO
	msgbox Santuario_del_Vento_1_62_text32 MSG_NORMAL
	special 0x15A
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text33 MSG_NORMAL
	special 0x15A
	show_mugshot RAITO
	msgbox Santuario_del_Vento_1_62_text34 MSG_NORMAL
	special 0x15A
	show_mugshot RAITO
	msgbox Santuario_del_Vento_1_62_text35 MSG_NORMAL
	special 0x15A

	giveitem ITEM_FIAMMA_GIALLA 0x1 MSG_OBTAIN
	show_mugshot RAITO
	msgbox Santuario_del_Vento_1_62_text36 MSG_NORMAL
	special 0x15A
	show_mugshot RAITO
	msgbox Santuario_del_Vento_1_62_text37 MSG_NORMAL
	special 0x15A
	closeonkeypress

	@Raito dissolves into sparks
	sound 0x27
	fadescreen 0x3
	hidesprite 0x2
	fadescreen 0x2
	pause 0x1E

	@5. Towards Bettivo
	show_mugshot CRISPY
	msgbox Santuario_del_Vento_1_62_text38 MSG_NORMAL
	special 0x15A
	msgbox Santuario_del_Vento_1_62_text39 MSG_NORMAL
	msgbox Santuario_del_Vento_1_62_text40 MSG_NORMAL
	closeonkeypress
	fadescreen 0x1
	setvar 0x4051 0x55
	sound 0x7A
	pause 0x3C
	fadescreen 0x0
	call EventScript_FollowerMon_CutsceneEnd
	releaseall
	end

Santuario_del_Vento_1_62_mov1:
	.byte 0x13
	.byte 0x1 
	.byte 0xFE

Santuario_del_Vento_1_62_mov_CrispyArrives:
	.byte 0x12 @Walk left, out of the player's tile
	.byte 0x1 @Face up
	.byte 0xFE

Santuario_del_Vento_1_62_mov2:
	.byte 0x10
	.byte 0x12
	.byte 0x0 
	.byte 0xFE

Santuario_del_Vento_1_62_mov3:
	.byte 0x13
	.byte 0x0 
	.byte 0xFE

Santuario_del_Vento_1_62_mov4:
	.byte 0x0 
	.byte 0x19
	.byte 0x1 
	.byte 0x19
	.byte 0x2 
	.byte 0x19
	.byte 0xFE


Santuario_del_Vento_1_62_mov_Nod:
	.byte 0x54 @Jump in place, facing up
	.byte 0xFE


Santuario_del_Vento_1_62_mov_CustodeToChapel:
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0xFE


Santuario_del_Vento_1_62_mov_PlayerToChapel:
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0xFE

Santuario_del_Vento_1_62_mov_CrispyToChapel:
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x11
	.byte 0x12
	.byte 0x11
	.byte 0xFE

