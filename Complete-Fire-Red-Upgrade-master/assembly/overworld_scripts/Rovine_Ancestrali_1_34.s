.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Rovine_Ancestrali_1_34_Sign0
EventScript_Rovine_Ancestrali_1_34_Sign0:
	compare 0x4051 0x21 
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_34_Sign0_P1
	msgbox Rovine_Ancestrali_1_34_Sign0_text1 MSG_SIGN
	setvar 0x4050 0x4
	setvar 0x4056 0xD
	setvar 0x4057 0x13
	setvar 0x4058 0x11
	setvar 0x4059 0x7
	setvar 0x405a 0x3
	setvar 0x405b 0x14
	setvar 0x405c 0xC
	setvar 0x405d 0x12
	setvar 0x405e 0x8
	setvar 0x501F 0x12E
	warpmuted 0x0 0x5 0xFF 0x07 0x05
	end

	EventScript_Rovine_Ancestrali_1_34_Sign0_P1:
		msgbox Rovine_Ancestrali_1_34_Sign0_text2 MSG_SIGN
		end


.global EventScript_Rovine_Ancestrali_1_34_tile6
EventScript_Rovine_Ancestrali_1_34_tile6:
	lockall
	special 0x113
	applymovement 0x7F Rovine_Ancestrali_1_34_tile6_mov1
	waitmovement 0x0
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	//Non te lo chiedero una seconda volta..
    msgbox Rovine_Ancestrali_1_34_tile6_text1 0x7
    special 0x15A
	pause 0x1E
	showpokepic 0x3AD 0x15 0x6
	//Dannazione
    msgbox Rovine_Ancestrali_1_34_tile6_text2 0x7
    special 0x15A	
	pause 0x1E
	showpokepic 0x3B4 0x0 0x6
	//Non mi lasci altra scelta...
    msgbox Rovine_Ancestrali_1_34_tile6_text3 0x7
    special 0x15A
	pause 0x1E
	cry 0x117 0x0
	msgbox Rovine_Ancestrali_1_34_tile6_text4 0x7
	applymovement 0xA Rovine_Ancestrali_1_34_tile6_mov2
	waitmovement 0x0
	applymovement 0x6 Rovine_Ancestrali_1_34_tile6_mov3
	waitmovement 0x0
	showpokepic 0x3AD 0x15 0x6
	//Fermati!
    msgbox Rovine_Ancestrali_1_34_tile6_text5 0x7
    special 0x15A
	applymovement 0x8 Rovine_Ancestrali_1_34_tile6_mov4
	waitmovement 0x0	
	showpokepic 0x3B8 0x0 0x6
	//come dici???
    msgbox Rovine_Ancestrali_1_34_tile6_text6 0x7
    special 0x15A
	pause 0x1E
	showpokepic 0x3AD 0x15 0x6
	//Sei un tipo sveglio
    msgbox Rovine_Ancestrali_1_34_tile6_text7 0x7
    special 0x15A
	playsong 0x112 0x0
	applymovement 0x6 Rovine_Ancestrali_1_34_tile6_mov5
	waitmovement 0x0
	sound 0x9
	applymovement 0x7 Rovine_Ancestrali_1_34_tile6_mov5
	waitmovement 0x0
	sound 0x9
	setflag 0x95A
	setvar 0x4050 0x4
	setvar 0x4051 0x20
	setvar 0x4052 0x3
	warpmuted 0x1 0x22 0xFF 0x0B 0x08
	releaseall
	end

	Rovine_Ancestrali_1_34_tile6_mov1:
		.byte 0x11
		.byte 0x11
		.byte 0x11
		.byte 0xFE


	Rovine_Ancestrali_1_34_tile6_mov2:
		.byte 0x28
		.byte 0x28
		.byte 0xFE

	Rovine_Ancestrali_1_34_tile6_mov3:
		.byte 0x1A
		.byte 0x62
		.byte 0xFE

	Rovine_Ancestrali_1_34_tile6_mov4:
		.byte 0x1A
		.byte 0x62
		.byte 0x13
		.byte 0xFE

	Rovine_Ancestrali_1_34_tile6_mov5:
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0xFE

.global EventScript_Rovine_Ancestrali_1_34_tile8
EventScript_Rovine_Ancestrali_1_34_tile8:
	lockall
	showpokepic 0x3B6 0x0 0x6
    msgbox Rovine_Ancestrali_1_34_tile8_text1 0x7
    special 0x15A
	pause 0x1E
	applymovement 0xFF Rovine_Ancestrali_1_34_tile8_mov1
	waitmovement 0x0
	releaseall
	end

	Rovine_Ancestrali_1_34_tile8_mov1:
		.byte 0x11
		.byte 0xFE

.global EventScript_Rovine_Ancestrali_1_34_NPC0
EventScript_Rovine_Ancestrali_1_34_NPC0:
	lock
	faceplayer
	compare 0x4051 0x20
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_34_NPC0_P1
	showpokepic 0x3B5 0x0 0x6
    msgbox Rovine_Ancestrali_1_34_NPC0_text1 0x7
    special 0x15A
	spriteface 0x1 0x2
	release
	end

	EventScript_Rovine_Ancestrali_1_34_NPC0_P1:
		showpokepic 0x3B5 0x0 0x6
		msgbox Rovine_Ancestrali_1_34_NPC0_text2 0x7
		special 0x15A
		release
		end

.global EventScript_Rovine_Ancestrali_1_34_NPC1
EventScript_Rovine_Ancestrali_1_34_NPC1:
	lock
	faceplayer
	showpokepic 0x3BC 0x0 0x6
    msgbox Rovine_Ancestrali_1_34_NPC1_text1 0x7
    special 0x15A
	release
	end

.global EventScript_Rovine_Ancestrali_1_34_NPC2
EventScript_Rovine_Ancestrali_1_34_NPC2:
	lock
	faceplayer
	showpokepic 0x3BB 0x0 0x6
    msgbox Rovine_Ancestrali_1_34_NPC2_text1 0x7
    special 0x15A
	release
	end

.global EventScript_Rovine_Ancestrali_1_34_NPC4
EventScript_Rovine_Ancestrali_1_34_NPC4:
	lock
	faceplayer
	showpokepic 0x3BB 0x0 0x6
    msgbox Rovine_Ancestrali_1_34_NPC4_text1 0x7
    special 0x15A
	release
	end

.global EventScript_Rovine_Ancestrali_1_34_NPC7
EventScript_Rovine_Ancestrali_1_34_NPC7:
	lock
	faceplayer
	showpokepic 0x3B8 0x0 0x6
    msgbox Rovine_Ancestrali_1_34_NPC7_text1 0x7
    special 0x15A
	release
	end

.global EventScript_Rovine_Ancestrali_1_34_NPC8
EventScript_Rovine_Ancestrali_1_34_NPC8:
	lock
	faceplayer
	showpokepic 0x3B4 0x0 0x6
    msgbox Rovine_Ancestrali_1_34_NPC8_text1 0x7
    special 0x15A
	release
	end

.global EventScript_Rovine_Ancestrali_1_34_NPC3
EventScript_Rovine_Ancestrali_1_34_NPC3:

	trainerbattle0 0x0 0x16 0x0 Rovine_Ancestrali_1_34_NPC3_text1 Rovine_Ancestrali_1_34_NPC3_text2
	showpokepic 0x3BB 0x0 0x6
	msgbox Rovine_Ancestrali_1_34_NPC3_text3 0x7
    special 0x15A
	end

.global EventScript_Rovine_Ancestrali_1_34_tile0
EventScript_Rovine_Ancestrali_1_34_tile0:
	compare 0x4051 0x1F
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_34_tile0_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_34_tile0_P1
	end
	
EventScript_Rovine_Ancestrali_1_34_tile0_P2:
	showpokepic 0x3B6 0x0 0x6
	msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text0 0x7
	special 0x15A
	pause 0x1E
	applymovement 0xFF Rovine_Ancestrali_1_34_tile0_mov0
	waitmovement 0xFF
	releaseall
	end

Rovine_Ancestrali_1_34_tile0_mov0:
	.byte 0x11
	.byte 0xFE

EventScript_Rovine_Ancestrali_1_34_tile0_P1:	
	applymovement 0xFF Rovine_Ancestrali_1_34_tile0_mov1
	waitmovement 0x0
	showpokepic 0x3BC 0x0 0x6
	msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text6 0x7
	special 0x15A
	pause 0x1E	
	showpokepic 0x3BB 0x15 0x6
	msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text7 0x7
	special 0x15A
	trainerbattle10 0xA 0x14 0x15 0x0D 0x2 0x0 Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text8 Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text9
	fadedefault
	pause 0x1E
	spriteface 0x1 0x3
	spriteface 0xFF 0x4
	showpokepic 0x3B5 0x0 0x6
	//Sembra ci siano due scale...
	msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text10 0x7
	special 0x15A
	applymovement 0x1 Rovine_Ancestrali_1_34_MapScriptOnFrame_mov7
	waitmovement 0x0
	setvar 0x4051 0x1F
	setvar 0x4050 0x2
	movesprite2 0x1 0x10 0x0C
	spritebehave 0x1 0x45
	spritebehave 0x5 0x44
	releaseall
	end	

	Rovine_Ancestrali_1_34_tile0_mov1:
		.byte 0x11
		.byte 0x11
		.byte 0x11
		.byte 0xFE

.global EventScript_Rovine_Ancestrali_1_34_tile1
EventScript_Rovine_Ancestrali_1_34_tile1:
	compare 0x4051 0x1F
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_34_tile0_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_34_tile1_P1
	end
	
EventScript_Rovine_Ancestrali_1_34_tile1_P1:
	applymovement 0xFF Rovine_Ancestrali_1_34_tile1_mov1
	waitmovement 0x0
	showpokepic 0x3BC 0x0 0x6
	msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text6 0x7
	special 0x15A
	pause 0x1E	
	showpokepic 0x3BB 0x15 0x6
	msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text7 0x7
	special 0x15A
	trainerbattle10 0xA 0x14 0x15 0x0D 0x2 0x0 Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text8 Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text9
	fadedefault
	pause 0x1E
	spriteface 0x1 0x3
	spriteface 0xFF 0x4
	showpokepic 0x3B5 0x0 0x6
	//Sembra ci siano due scale...
	msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text10 0x7
	special 0x15A
	applymovement 0x1 Rovine_Ancestrali_1_34_MapScriptOnFrame_mov7
	waitmovement 0x0
	setvar 0x4051 0x1F
	setvar 0x4050 0x2
	movesprite2 0x1 0x10 0x0C
	spritebehave 0x1 0x45
	spritebehave 0x5 0x44
	releaseall
	end	

	Rovine_Ancestrali_1_34_tile1_mov1:
		.byte 0x11
		.byte 0x11
		.byte 0x12
		.byte 0x11
		.byte 0xFE

.global gMapScripts_Rovine_Ancestrali_1_34
gMapScripts_Rovine_Ancestrali_1_34:
	mapscript MAP_SCRIPT_ON_LOAD Rovine_Ancestrali_1_34_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Rovine_Ancestrali_1_34_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Rovine_Ancestrali_1_34_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

		Rovine_Ancestrali_1_34_MapScriptOnLoad:
			setvar 0x5007 0x7
			compare 0x4051 0x1E
			if 0x1 _goto Rovine_Ancestrali_1_34_MapScriptOnLoad_P1
			compare 0x4051 0x1F
			if 0x1 _goto Rovine_Ancestrali_1_34_MapScriptOnLoad_P2
			compare 0x4051 0x20
			if 0x1 _goto Rovine_Ancestrali_1_34_MapScriptOnLoad_P3
			compare 0x4051 0x21
			if 0x1 _goto Rovine_Ancestrali_1_34_MapScriptOnLoad_P4
			end

			Rovine_Ancestrali_1_34_MapScriptOnLoad_P1:
				movesprite2 0x1 0x0C 0x0E
				movesprite2 0x3 0x0C 0x0D
				movesprite2 0x2 0x0B 0x0D
				end
		
			Rovine_Ancestrali_1_34_MapScriptOnLoad_P2:
				movesprite2 0x1 0x0D 0x0C
				spritebehave 0x1 0x45
				spritebehave 0x5 0x44
				end

			Rovine_Ancestrali_1_34_MapScriptOnLoad_P3:
				movesprite2 0x1 0x0C 0x08
				spritebehave 0x1 0x7
				movesprite2 0x9 0x0C 0x07
				spritebehave 0x9 0x8
				movesprite2 0x8 0x0b 0x07
				spritebehave 0x8 0x8
				end

			Rovine_Ancestrali_1_34_MapScriptOnLoad_P4:
				movesprite2 0x1 0x0C 0x08
				spritebehave 0x1 0x7
				movesprite2 0x9 0x0D 0x07
				spritebehave 0x9 0x9
				movesprite2 0x8 0x0A 0x07
				spritebehave 0x8 0x7
				setmaptile 0x0B 0x01 0x37C 0x0
				setmaptile 0x0C 0x01 0x37D 0x0

				setmaptile 0x09 0x02 0x380 0x0
				setmaptile 0x0A 0x02 0x381 0x0
				setmaptile 0x0B 0x02 0x384 0x0
				setmaptile 0x0C 0x02 0x385 0x0
				setmaptile 0x0D 0x02 0x386 0x0
				setmaptile 0x0E 0x02 0x387 0x0

				setmaptile 0x09 0x03 0x388 0x0
				setmaptile 0x0A 0x03 0x389 0x0
				setmaptile 0x0B 0x03 0x38C 0x0
				setmaptile 0x0C 0x03 0x38D 0x0
				setmaptile 0x0D 0x03 0x38E 0x0
				setmaptile 0x0E 0x03 0x38F 0x0

				setmaptile 0x05 0x04 0x392 0x0
				setmaptile 0x06 0x04 0x392 0x0
				setmaptile 0x07 0x04 0x392 0x0
				setmaptile 0x09 0x04 0x390 0x0
				setmaptile 0x0A 0x04 0x391 0x0
				setmaptile 0x0B 0x04 0x394 0x0
				setmaptile 0x0C 0x04 0x395 0x0
				setmaptile 0x0D 0x04 0x396 0x0
				setmaptile 0x0E 0x04 0x397 0x0
				setmaptile 0x10 0x04 0x393 0x0			
				setmaptile 0x11 0x04 0x393 0x0				
				setmaptile 0x12 0x04 0x393 0x0				
				
				setmaptile 0x05 0x05 0x39A 0x0
				setmaptile 0x06 0x05 0x39A 0x0
				setmaptile 0x07 0x05 0x39A 0x0
				setmaptile 0x09 0x05 0x398 0x0
				setmaptile 0x0A 0x05 0x399 0x0
				setmaptile 0x0B 0x05 0x39C 0x0
				setmaptile 0x0C 0x05 0x39D 0x0
				setmaptile 0x0D 0x05 0x39E 0x0
				setmaptile 0x0E 0x05 0x39F 0x0
				setmaptile 0x10 0x05 0x39B 0x0			
				setmaptile 0x11 0x05 0x39B 0x0				
				setmaptile 0x12 0x05 0x39B 0x0					
				
				end


		Rovine_Ancestrali_1_34_MapScriptOnWarpIntoMapTable:
		levelscript 0x4050, 4, Rovine_Ancestrali_1_34_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Rovine_Ancestrali_1_34_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end

		Rovine_Ancestrali_1_34_MapScriptOnFrame:
		levelscript 0x4050, 4, Rovine_Ancestrali_1_34_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Rovine_Ancestrali_1_34_MapScriptOnFrameBegin:
			lockall
			compare 0x4051 0x1D
			if 0x1 _goto Rovine_Ancestrali_1_34_MapScriptOnFrame_P1
			compare 0x4051 0x20
			if 0x1 _goto Rovine_Ancestrali_1_34_MapScriptOnFrame_P2
			compare 0x4051 0x21
			if 0x1 _goto Rovine_Ancestrali_1_34_MapScriptOnFrame_P3
			compare 0x4051 0x26
			if 0x1 _goto Rovine_Ancestrali_1_34_MapScriptOnFrame_P4
			releaseall
			end


		Rovine_Ancestrali_1_34_MapScriptOnFrame_P1:
			movesprite2 0x1 0x0C 0x11
			setvar 0x4050 0x2
			applymovement 0x1 Rovine_Ancestrali_1_34_MapScriptOnFrame_mov1
			waitmovement 0x0
			showpokepic 0x3B5 0x0 0x6
			//Wow player, non credo ai miei occhi...
			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text1 0x7
			special 0x15A	
			special 0x113
			applymovement 0x7F Rovine_Ancestrali_1_34_MapScriptOnFrame_mov2
			waitmovement 0x7F
			pause 0x1E
			pause 0x1E
			pause 0x1E
			applymovement 0x7F Rovine_Ancestrali_1_34_MapScriptOnFrame_mov3
			waitmovement 0x7F			
			special 0x114
			showpokepic 0x3B5 0x0 0x6
			//Quest'antica sala...
			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text2 0x7
			special 0x15A	
			spriteface 0x1 0x3
			pause 0x1E
			spriteface 0xFF 0x4
			pause 0x1E
			showpokepic 0x3B5 0x0 0x6
			//Facciamoci coraggio...
			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text3 0x7
			special 0x15A	
			pause 0x1E
			showpokepic 0x3B5 0x0 0x6
			//Lascia che rimetta in sesto..
			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text4 0x7
			special 0x15A
			fadescreen 0x1 
			fanfare 0x0100
			waitfanfare
			special 0x0
			fadescreen 0x0			
			pause 0x1E
			showpokepic 0x3B5 0x0 0x6
			//Bene, ora non abbiamo piu' scuse!
			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text5 0x7
			special 0x15A
			applymovement 0xFF Rovine_Ancestrali_1_34_MapScriptOnFrame_mov4
			applymovement 0x1 Rovine_Ancestrali_1_34_MapScriptOnFrame_mov4
			waitmovement 0x0
			pause 0x1E
			playsong 0x112 0x0
			applymovement 0x2 Rovine_Ancestrali_1_34_MapScriptOnFrame_mov5
			waitmovement 0x0
			showpokepic 0x3BC 0x0 0x6
			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text6 0x7
			special 0x15A
			applymovement 0x3 Rovine_Ancestrali_1_34_MapScriptOnFrame_mov6
			waitmovement 0x0			
			showpokepic 0x3BB 0x15 0x6
			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text7 0x7
			special 0x15A

			trainerbattle10 0xA 0x14 0x15 0x0D 0x2 0x0 Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text8 Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text9
			fadedefault
			pause 0x1E
			spriteface 0x1 0x3
			spriteface 0xFF 0x4
			showpokepic 0x3B5 0x0 0x6
			//Wow player, non credo ai miei occhi...
			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P1_text10 0x7
			special 0x15A
			applymovement 0x1 Rovine_Ancestrali_1_34_MapScriptOnFrame_mov7
			waitmovement 0x0

			setvar 0x4051 0x1F
			setvar 0x4050 0x2
			movesprite2 0x1 0x10 0x0C
			spritebehave 0x1 0x45
			spritebehave 0x5 0x44
			releaseall
			end			


			Rovine_Ancestrali_1_34_MapScriptOnFrame_mov1:
				.byte 0x63
				.byte 0x63
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_mov2:
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_mov3:
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_mov4:
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_mov5:
				.byte 0x62
				.byte 0x1D
				.byte 0x1D
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_mov6:
				.byte 0x62
				.byte 0x1D
				.byte 0x1D
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_mov7:
				.byte 0x13
				.byte 0x11
				.byte 0x11
				.byte 0xFE

	
		Rovine_Ancestrali_1_34_MapScriptOnFrame_P2:
			showpokepic 0x3B4 0x0 0x6
			//Ero sicuro che...
  			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_text1 0x7
    		special 0x15A
			pause 0x1E
			showpokepic 0x3B8 0x15 0x6
			//Non sentirti cosi' in colpa...
  			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_text2 0x7
    		special 0x15A
			pause 0x1E
			spriteface 0x8 0x2
			applymovement 0x9 Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_mov1
			waitmovement 0x0
			applymovement 0x8 Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_mov2
			waitmovement 0x0
			pause 0x1E
			showpokepic 0x3B8 0x15 0x6
			//Non capisco...
  			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_text3 0x7
    		special 0x15A
			applymovement 0x8 Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_mov3
			waitmovement 0x0
			setvar 0x4050 0x2
			releaseall
			end


			Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_mov1:
				.byte 0x13
				.byte 0x1 
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_mov2:
				.byte 0x1 
				.byte 0x63
				.byte 0x1A
				.byte 0x12
				.byte 0x12
				.byte 0x1 
				.byte 0x63
				.byte 0x1C
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0x1 
				.byte 0x63
				.byte 0x1C
				.byte 0x12
				.byte 0x0 
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_P2_mov3:
				.byte 0x12
				.byte 0x3 
				.byte 0xFE

		Rovine_Ancestrali_1_34_MapScriptOnFrame_P3:
			lockall
			pause 0x1E
			setvar 0x8004 0xF  
    		setvar 0x8005 0xF  
    		setvar 0x8006 0xF  
    		setvar 0x8007 0xF
    		special 0x136
			waitstate
			applymovement 0x8 Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_mov1
			spriteface 0xFF 0x3
			showpokepic 0x3B8 0x15 0x6
			//Incredibile...
  			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_text1 0x7
    		special 0x15A
			applymovement 0x1 Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_mov2
			applymovement 0x9 Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_mov3
			waitmovement 0x0
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			//cosa ti sembra...
  			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_text2 0x7
    		special 0x15A
			spriteface 0x8 0x1
			pause 0x1E
			showpokepic 0x3B8 0x15 0x6
			//a prima vista...
  			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_text3 0x7
    		special 0x15A
			fadescreen 0x1
			hidesprite 0x8
			sound 0x9
			pause 0x1E
			fadescreen 0x0
			spriteface 0xFF 0x1
			spriteface 0x9 0x2
			showpokepic 0x3B4 0x0 0x6
			//Complimenti..
  			msgbox Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_text4 0x7
    		special 0x15A
			setvar 0x4050 0x5
			setvar 0x4051 0x22
			setflag 0x95B
			clearflag 0x952
			warp 0x3 0x29 0xFF 0x1C 0x04
			releaseall
			end



			Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_mov1:
				.byte 0x65
				.byte 0x55
				.byte 0x55
				.byte 0x1A
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_mov2:
				.byte 0x20
				.byte 0x2 
				.byte 0xFE

			Rovine_Ancestrali_1_34_MapScriptOnFrame_P3_mov3:
				.byte 0x12
				.byte 0x10
				.byte 0x12
				.byte 0x12
				.byte 0x01
				.byte 0x1A
				.byte 0x63
				.byte 0xFE

		Rovine_Ancestrali_1_34_MapScriptOnFrame_P4:
			playsong 0x0
			pause 0x1E
			applymovement 0x9 Rovine_Ancestrali_1_34_MapScriptOnFrame_P4_mov1
			waitmovement 0x0
			pause 0x1E
			showpokepic 0x3B4 0x0 0x6
			msgbox Rovine_Ancestrali_1_34_tile6_text1 0x7
			special 0x15A
			pause 0x1E
			showpokepic 0x3AD 0x15 0x6
			msgbox Rovine_Ancestrali_1_34_tile6_text2 0x7
			special 0x15A
			pause 0x1E
			//activate level script
			setvar 0x4050 0x5						
			//trigger level script p2 
			setvar 0x4051 0x27
			//apply player sprite
			setvar 0x501F 0x100
			writebytetooffset 0x0 0x2036E28
			setflag 0x95B
			setflag 0x95A
			warpmuted 0x3 0x29 0xFF 0x1C 0x04
			releaseall
			end
			
			Rovine_Ancestrali_1_34_MapScriptOnFrame_P4_mov1:
				.byte 0x62
				.byte 0xFE
	