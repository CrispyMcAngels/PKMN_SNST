.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Risaia_Rosa_3_50
gMapScripts_Risaia_Rosa_3_50:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Risaia_Rosa_3_50_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_LOAD Risaia_Rosa_3_50_MapScriptOnLoad
	//mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Risaia_Rosa_3_50_MapScriptOnWarpIntoMapTable
    .byte MAP_SCRIPT_TERMIN

	//Risaia_Rosa_3_50_MapScriptOnWarpIntoMapTable:
	//	levelscript 0x4051, 0x4D, Risaia_Rosa_3_50_MapScriptOnWarpIntoMapTableBegin
	//	.hword MAP_SCRIPT_TERMIN

	//	Risaia_Rosa_3_50_MapScriptOnWarpIntoMapTableBegin:
	//		spriteface 0xFF 0x4
	//		end	

	Risaia_Rosa_3_50_MapScriptOnLoad:
		sethealingplace 0x4 @Roccavento's pizzeria, the nearest nurse (as in Roccavento_3_3)
		setvar 0x5007 0x16
		compare 0x4051 0x53
		if 0x1 _goto Risaia_Rosa_3_50_MapScriptOnLoad_P1
		end

		Risaia_Rosa_3_50_MapScriptOnLoad_P1:
			movesprite2 0x1 0xE 0x13
			spritebehave 0x1 0xA
			return

		
	Risaia_Rosa_3_50_MapScriptOnFrame:
		levelscript 0x4067, 0x2, Risaia_Rosa_3_50_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Risaia_Rosa_3_50_MapScriptOnFrameBegin:
			compare 0x4051 0x53
			if 0x1 _goto Risaia_Rosa_3_50_MapScriptOnFrameBegin_P2
			compare 0x4067 0x2
			if 0x1 _goto Risaia_Rosa_3_50_MapScriptOnFrameBegin_P1
			releaseall
			end

		Risaia_Rosa_3_50_MapScriptOnFrameBegin_P1:
			spriteface 0xFF 0x2	
			pause 0x25
			show_mugshot PLAYER
			msgbox Risaia_Rosa_3_50_MapScript_text1 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			movesprite 0x3 0x0F 0x14
			spriteface 0x1 0x2	
			pause 0x25
			setvar 0x500E 0x6
			pause 0x1E		
			show_mugshot RAITO
			msgbox Risaia_Rosa_3_50_MapScript_text2 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			setvar 0x8004 0xF  
			setvar 0x8005 0xF  
			setvar 0x8006 0xF  
			setvar 0x8007 0xF
			special 0x136
			sound 0xC
			pause 0x15
			setvar 0x4052 0x6
			setvar 0x501F 0x12E
			warpteleport 0x0 0x11 0xFF 0x7 0x6
			releaseall 
			end

		Risaia_Rosa_3_50_MapScriptOnFrameBegin_P2:
			pause 0x4E
			sound 0x15
			applymovement 0x1 mov_exclamation
			waitmovement 0x1
			show_mugshot RAITO
			msgbox Risaia_Rosa_3_50_MapScript_text3 MSG_NORMAL
			special 0x15A
			pause 0x1E
			spriteface 0xFF 0x3
			pause 0x1E
			applymovement 0xFF Risaia_Rosa_3_50_MapScript_mov1
			waitmovement 0xFF
			pause 0x1E
			show_mugshot PLAYER 
			msgbox Risaia_Rosa_3_50_MapScript_text4 MSG_NORMAL
			special 0x15A
			pause 0x1E
			show_mugshot PLAYER
			msgbox Risaia_Rosa_3_50_MapScript_text5 MSG_NORMAL
			special 0x15A
			sound 0x15
			applymovement 0x1 mov_exclamation
			waitmovement 0x1			
			playsong 0x192 0x0
			pause 0x1E
			show_mugshot RAITO
			msgbox Risaia_Rosa_3_50_MapScript_text6 MSG_NORMAL
			special 0x15A
			pause 0x1E
			spriteface 0x1 0x2
			pause 0x1E
			spriteface 0xFF 0x2
			pause 0x1E
			show_mugshot RAITO
			msgbox Risaia_Rosa_3_50_MapScript_text7 MSG_NORMAL
			special 0x15A
			pause 0x2E
			spriteface 0x1 0x4
			pause 0x1E
			spriteface 0x1 0x3
			pause 0x1E
			show_mugshot RAITO
			msgbox Risaia_Rosa_3_50_MapScript_text8 MSG_NORMAL
			special 0x15A
			pause 0x1E
			spriteface 0x1 0x1
			pause 0x1E
			show_mugshot RAITO
			msgbox Risaia_Rosa_3_50_MapScript_text9 MSG_NORMAL
			special 0x15A
			pause 0x1E
			spriteface 0x1 0x4
			pause 0x1E
			show_mugshot RAITO
			msgbox Risaia_Rosa_3_50_MapScript_text10 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0x1 Risaia_Rosa_3_50_MapScript_mov2
			waitmovement 0x1
			spriteface 0xFF 0x1
			pause 0x1E
			show_mugshot RAITO
			msgbox Risaia_Rosa_3_50_MapScript_text11 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0x1 Risaia_Rosa_3_50_MapScript_mov3
			waitmovement 0x1
			movesprite 0x1 0x0 0x0
			//disable level script 
			setvar 0x4067 0x0
			//go on var 
			setvar 0x4051 0x54
			fadedefault
			releaseall
			end

	Risaia_Rosa_3_50_MapScript_mov1:
		.byte 0x23
		.byte 0x23
		.byte 0x23
		.byte 0xFE

	Risaia_Rosa_3_50_MapScript_mov2:
		.byte 0x10
		.byte 0x13
		.byte 0x1 
		.byte 0xFE

	Risaia_Rosa_3_50_MapScript_mov3:
		.byte 0x10
		.byte 0x13
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0x60
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0xFE


//___TILEs___

.global EventScript_Risaia_Rosa_3_50_tile0
EventScript_Risaia_Rosa_3_50_tile0:
	lockall
	applymovement 0xFF Risaia_Rosa_3_50_tile0_mov1
	waitmovement 0xFF
	sound 0x15
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text1 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text2 MSG_NORMAL
	special 0x15A	
	playsong 0x188
	pause 0x2E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text3 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	special 0x113
	applymovement 0x7F Risaia_Rosa_3_50_tile0_mov2
	waitmovement 0x7F
	pause 0x2E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text4 MSG_NORMAL
	special 0x15A	
	pause 0x2E	
	applymovement 0x7F Risaia_Rosa_3_50_tile0_mov3
	waitmovement 0x7F	

	pause 0x25
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text5 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	spriteface 0x1 0x1
	pause 0x1E
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text6 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	spriteface 0x1 0x2
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text7 MSG_NORMAL
	special 0x15A	
	spriteface 0x1 0x1
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text8 MSG_NORMAL
	special 0x15A	
	pause 0x25
	movesprite 0x2 0x10 0x14
	pause 0x25
	sound 0x15
	spriteface 0xFF 0x4
	applymovement 0xFF mov_question
	waitmovement 0xFF
	pause 0x1E
	show_mugshot PLAYER
	msgbox Risaia_Rosa_3_50_tile0_text16 MSG_NORMAL
	special 0x15A	
	pause 0x25
	applymovement 0x1 Risaia_Rosa_3_50_tile0_mov4a
	waitmovement 0x1
	pause 0x1E
	sound 0x15
	applymovement 0x1 mov_exclamation
	waitmovement 0x1
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text9 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	show_mugshot PLAYER
	msgbox Risaia_Rosa_3_50_tile0_text10 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text11 MSG_NORMAL
	special 0x15A	

	pause 0x1E
	applymovement 0x1 Risaia_Rosa_3_50_tile0_mov4b
	waitmovement 0x1
	spriteface 0xFF 0x2
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text12 MSG_NORMAL
	special 0x15A	
	pause 0x1E	
	applymovement 0x1 Risaia_Rosa_3_50_tile0_mov4c
	waitmovement 0x1
	applymovement 0x1 mov_exclamation
	waitmovement 0x1
	pause 0x1E
	movesprite 0x2 0x0F 0x14
	playsong 0x18C
	applymovement 0x2 Risaia_Rosa_3_50_tile0_mov5
	waitmovement 0x2
	pause 0x25
	spritebehave 0x2 0x49
	pause 0x25
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text12b MSG_NORMAL
	special 0x15A	
	pause 0x1E		


	applymovement 0x1 Risaia_Rosa_3_50_tile0_mov4
	waitmovement 0x1
	//applymovement 0x7F Risaia_Rosa_3_50_tile0_mov3a
	//waitmovement 0x7F	
	//special 0x114

	sound 0xC
	//setmaptile
	setmaptile 0xF 0xF 0x3A8 0x1
	setmaptile 0xF 0x10 0x3B0 0x1
	setmaptile 0xE 0x11 0x3AA 0x1
	setmaptile 0xF 0x11 0x3B8 0x1
	setmaptile 0x10 0x11 0x3B9 0x1
	setmaptile 0xE 0x12 0x3B2 0x1
	setmaptile 0xF 0x12 0x3C0 0x1
	setmaptile 0x10 0x12 0x3C1 0x1
	special 0x8e
	pause 0x25
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text12a MSG_NORMAL
	special 0x15A	
	spriteface 0x1 0x4
	pause 0x10
	spriteface 0xFF 0x3
	pause 0x1E
	show_mugshot RAITO
	msgbox Risaia_Rosa_3_50_tile0_text13 MSG_NORMAL
	special 0x15A		
	setflag 0x990
	setflag 0x991
	setflag 0x992
	setflag 0x11
	pause 0x1E
	fanfare 0x0102
	msgbox Risaia_Rosa_3_50_tile0_text14 MSG_NORMAL
	pause 0x1E
	msgbox Risaia_Rosa_3_50_tile0_text15 MSG_NORMAL
	spriteface 0xFF 0x2
	movesprite 0x2 0x0 0x0
	applymovement 0xFF Risaia_Rosa_3_50_tile0_mov7
	waitmovement 0xFF
	special 0x114
	releaseall
	end

Risaia_Rosa_3_50_tile0_mov1:
	.byte 0x11
	.byte 0x12
	.byte 0x1 
	.byte 0x1C
	.byte 0x63
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov2:
	.byte 0xD 
	.byte 0xD 
	.byte 0xD 
	.byte 0xD 
	.byte 0xD 
	.byte 0xD 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov3:
	.byte 0xC 
	.byte 0xC 
	.byte 0xC 
	.byte 0xC
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov4a:
	.byte 0x13
	.byte 0x0 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov4:
	.byte 0x10
	.byte 0x1 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov4b:
	.byte 0x12
	.byte 0x0 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov4c:
	.byte 0x12
	.byte 0x3
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov5:
	.byte 0x11
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov6:
	.byte 0x10
	.byte 0x3 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov3a:
	.byte 0xC 
	.byte 0xC 
	.byte 0xFE

Risaia_Rosa_3_50_tile0_mov7:
	.byte 0x11
	.byte 0xFE

.global EventScript_Risaia_Rosa_3_50_tile1
EventScript_Risaia_Rosa_3_50_tile1:
	lockall
	show_mugshot PLAYER
	msgbox Risaia_Rosa_3_50_tile1_text1 MSG_NORMAL
	special 0x15A
	getplayerpos 0x4001 0x4002
	compare 0x4001 0xE
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_tile1_L
	compare 0x4001 0xF
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_tile1_D
	compare 0x4001 0x10
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_tile1_R
	releaseall
	end

	EventScript_Risaia_Rosa_3_50_tile1_L:
		applymovement 0xFF Risaia_Rosa_3_50_tile1_mov1
		waitmovement 0xFF		
		releaseall
		end

	EventScript_Risaia_Rosa_3_50_tile1_D:
		applymovement 0xFF Risaia_Rosa_3_50_tile1_mov2
		waitmovement 0xFF		
		releaseall
		end

	EventScript_Risaia_Rosa_3_50_tile1_R:
		applymovement 0xFF Risaia_Rosa_3_50_tile1_mov3
		waitmovement 0xFF		
		releaseall
		end

	Risaia_Rosa_3_50_tile1_mov1:
		.byte 0x13
		.byte 0xFE

	Risaia_Rosa_3_50_tile1_mov2:
		.byte 0x11
		.byte 0xFE

	Risaia_Rosa_3_50_tile1_mov3:
		.byte 0x12
		.byte 0xFE

//___NPCs___

@Risaia Rosa's people and trainers (object list from index 3: 0-2 are the Pilastro scene's)
.equ FLAG_BIG_ROOT_GIVEN, 0x9A3
.equ FLAG_PILLAR_AWAKENED, 0x990 @Set by the Pilastro delle Ere scene (time echoes unlocked)
.equ TRAINER_MONDINA_ROSA, 0x59 @89
.equ TRAINER_PESCATORE_GINO, 0x5A @90
.equ TRAINER_ALLEVATORE_PIERO, 0x5B @91
.equ TRAINER_PIGLIAMOSCHE_TOBIA, 0x5C @92
.equ TRAINER_GEMELLE_LIA_LEA, 0x5D @93: double battle
.equ TRAINER_MEDIUM_SELENE, 0x5E @94

@npc 3: Nonna Mondina, in the water among the paddies (the Pilastri delle Ere, as folklore)
.global EventScript_Risaia_Rosa_3_50_NPC3
EventScript_Risaia_Rosa_3_50_NPC3:
	lockall @Not lock: she wanders in the paddy and lock alone didn't stop her while talking
	faceplayer
	msgbox Risaia_Rosa_3_50_NPC3_text1 MSG_NORMAL
	msgbox Risaia_Rosa_3_50_NPC3_text2 MSG_NORMAL
	releaseall
	end

@npc 4: the farmer at the farmhouse, gives a Big Root once
.global EventScript_Risaia_Rosa_3_50_NPC4
EventScript_Risaia_Rosa_3_50_NPC4:
	lockall
	faceplayer
	checkflag FLAG_BIG_ROOT_GIVEN
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_NPC4_Given
	msgbox Risaia_Rosa_3_50_NPC4_text1 MSG_NORMAL
	msgbox Risaia_Rosa_3_50_NPC4_text2 MSG_NORMAL
	giveitem 0x2BB 0x1 MSG_OBTAIN @ITEM_BIG_ROOT
	compare 0x800D 0x0
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_NPC4_End @No room in the bag: he'll try again next time
	setflag FLAG_BIG_ROOT_GIVEN
	releaseall
	end

EventScript_Risaia_Rosa_3_50_NPC4_Given:
	msgbox Risaia_Rosa_3_50_NPC4_text3 MSG_NORMAL
EventScript_Risaia_Rosa_3_50_NPC4_End:
	release
	end

@npc 5: the fisherman on the walkway (a hint while the wallet quest is active)
.global EventScript_Risaia_Rosa_3_50_NPC5
EventScript_Risaia_Rosa_3_50_NPC5:
	lock
	faceplayer
	checkflag 0x99E @Wallet quest received...
	if 0x0 _goto EventScript_Risaia_Rosa_3_50_NPC5_Normal
	checkflag 0x99F @...and not done yet
	if 0x1 _goto EventScript_Risaia_Rosa_3_50_NPC5_Normal
	msgbox Risaia_Rosa_3_50_NPC5_text2 MSG_NORMAL
	release
	end

EventScript_Risaia_Rosa_3_50_NPC5_Normal:
	msgbox Risaia_Rosa_3_50_NPC5_text1 MSG_NORMAL
	release
	end

@npc 6: the cloud watcher, on the hilltop
.global EventScript_Risaia_Rosa_3_50_NPC6
EventScript_Risaia_Rosa_3_50_NPC6:
	lock
	faceplayer
	msgbox Risaia_Rosa_3_50_NPC6_text1 MSG_NORMAL
	release
	end

@npc 7: Mondina Rosa (Picnicker)
.global EventScript_Risaia_Rosa_3_50_NPC7
EventScript_Risaia_Rosa_3_50_NPC7:
	trainerbattle0 0x0 TRAINER_MONDINA_ROSA 0x0 Risaia_Rosa_3_50_NPC7_text1 Risaia_Rosa_3_50_NPC7_text2
	msgbox Risaia_Rosa_3_50_NPC7_text3 MSG_NORMAL
	end

@npc 8: Pescatore Gino (Fisherman)
.global EventScript_Risaia_Rosa_3_50_NPC8
EventScript_Risaia_Rosa_3_50_NPC8:
	trainerbattle0 0x0 TRAINER_PESCATORE_GINO 0x0 Risaia_Rosa_3_50_NPC8_text1 Risaia_Rosa_3_50_NPC8_text2
	msgbox Risaia_Rosa_3_50_NPC8_text3 MSG_NORMAL
	end

@npc 9: Allevatore Piero (Bird Keeper)
.global EventScript_Risaia_Rosa_3_50_NPC9
EventScript_Risaia_Rosa_3_50_NPC9:
	trainerbattle0 0x0 TRAINER_ALLEVATORE_PIERO 0x0 Risaia_Rosa_3_50_NPC9_text1 Risaia_Rosa_3_50_NPC9_text2
	msgbox Risaia_Rosa_3_50_NPC9_text3 MSG_NORMAL
	end

@npc 10: Pigliamosche Tobia (Bug Catcher)
.global EventScript_Risaia_Rosa_3_50_NPC10
EventScript_Risaia_Rosa_3_50_NPC10:
	trainerbattle0 0x0 TRAINER_PIGLIAMOSCHE_TOBIA 0x0 Risaia_Rosa_3_50_NPC10_text1 Risaia_Rosa_3_50_NPC10_text2
	msgbox Risaia_Rosa_3_50_NPC10_text3 MSG_NORMAL
	end

@npcs 11 and 12: Gemelle Lia e Lea (Twins, one object each), a double battle
.global EventScript_Risaia_Rosa_3_50_NPC11
EventScript_Risaia_Rosa_3_50_NPC11:
	trainerbattle4 0x4 TRAINER_GEMELLE_LIA_LEA 0x0 Risaia_Rosa_3_50_NPC11_text1 Risaia_Rosa_3_50_NPC11_text2 Risaia_Rosa_3_50_NPC11_text4
	msgbox Risaia_Rosa_3_50_NPC11_text3 MSG_NORMAL
	end

@npc 13: Medium Selene, near the great tree (the Pilastri delle Ere, as a vision): her intro changes once the Pilastro
@on the hilltop has been awakened
.global EventScript_Risaia_Rosa_3_50_NPC12
EventScript_Risaia_Rosa_3_50_NPC12:
	trainerbattle0 0x0 TRAINER_MEDIUM_SELENE 0x0 Risaia_Rosa_3_50_NPC12_text1 Risaia_Rosa_3_50_NPC12_text3
	msgbox Risaia_Rosa_3_50_NPC12_text4 MSG_NORMAL
	end

//___SIGNs___

.global EventScript_Roccavento_3_50_Sign0
EventScript_Roccavento_3_50_Sign0:
	setvar 0x4067 0x2
	end

@Poke Balls on the ground: the item, and the object's flag (set in HMA) hides them once taken
.global EventScript_Risaia_Rosa_3_50_ItemBall_ShinyStone
EventScript_Risaia_Rosa_3_50_ItemBall_ShinyStone: @npc 14, flag 0x19A: Shiny Stone
	finditem 0x63 0x1
	end

.global EventScript_Risaia_Rosa_3_50_ItemBall_GreatBalls
EventScript_Risaia_Rosa_3_50_ItemBall_GreatBalls: @npc 15, flag 0x19B: Great Ball x3
	finditem 0x3 0x3
	end

.global EventScript_Risaia_Rosa_3_50_ItemBall_SuperPotions
EventScript_Risaia_Rosa_3_50_ItemBall_SuperPotions: @npc 16, flag 0x19D: Super Potion x2
	finditem 0x16 0x2
	end
