.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Passo_Tuono_1_1
gMapScripts_Passo_Tuono_1_1:
	mapscript MAP_SCRIPT_ON_LOAD Passo_Tuono_1_1_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_FRAME_TABLE Passo_Tuono_1_1_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Passo_Tuono_1_1_MapScriptOnLoad:
		setvar 0x5007 0x8
		compare 0x4066 0x0
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_CUTSCENE
		compare 0x4051 0x40
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		compare 0x4051 0x41
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		compare 0x4051 0x42
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		compare 0x4051 0x43
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		compare 0x4051 0x44
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		compare 0x4051 0x45
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		compare 0x4051 0x46
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		compare 0x4051 0x47
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		compare 0x4051 0x48
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_Dusk
		checkflag 0x35
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_35
		checkflag 0x36
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_36
		checkflag 0x37
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_37
		checkflag 0x38
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_38
		checkflag 0x39
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_39
		checkflag 0x3A
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_3A
		checkflag 0x3B
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_3B
		checkflag 0x3C
		if 0x1 _call Passo_Tuono_1_1_MapScriptOnLoad_3C
		end

//

		Passo_Tuono_1_1_MapScriptOnLoad_CUTSCENE:
			//move crono e vesper in mezzo alla mappa
			movesprite2 0x1 0x15 0x17
			movesprite2 0x2 0x14 0x17
			//move normal NPCs a 24 0
			movesprite2 0xE 0x24 0x0
			movesprite2 0xF 0x24 0x0
			movesprite2 0x10 0x24 0x0
			movesprite2 0x11 0x24 0x0
			return

		Passo_Tuono_1_1_MapScriptOnLoad_Dusk:
			//move dusk
			movesprite2 0x3 0x1E 0x1B
			movesprite2 0x4 0x8 0x17
			movesprite2 0x5 0x8 0xC
			movesprite2 0x6 0x7 0x20
			movesprite2 0x7 0x15 0x16
			
			//move normal NPCs a 24 0
			movesprite2 0xE 0x24 0x0
			movesprite2 0xF 0x24 0x0
			movesprite2 0x10 0x24 0x0
			movesprite2 0x11 0x24 0x0
			return


		Passo_Tuono_1_1_MapScriptOnLoad_35:
			setmaptile 0x4 0x3 0x3F5 0x1
			setmaptile 0x4 0x4 0x3F4 0x1
			return

		Passo_Tuono_1_1_MapScriptOnLoad_36:
			setmaptile 0xC 0xC 0x3F6 0x1
			setmaptile 0xC 0xD 0x3F4 0x1
			return

		Passo_Tuono_1_1_MapScriptOnLoad_37:
			setmaptile 0x14 0x2 0x3FA 0x1
			return

		Passo_Tuono_1_1_MapScriptOnLoad_38:
			setmaptile 0x26 0x13 0x3F5 0x1
			setmaptile 0x26 0x14 0x3F4 0x1
			return

		Passo_Tuono_1_1_MapScriptOnLoad_39:
			setmaptile 0x20 0x14 0x3F8 0x1
			setmaptile 0x20 0x15 0x3F4 0x1
			return

		Passo_Tuono_1_1_MapScriptOnLoad_3A:
			setmaptile 0x0F 0x18 0x3F5 0x1
			setmaptile 0x0F 0x19 0x3F4 0x1
			return

		Passo_Tuono_1_1_MapScriptOnLoad_3B:
			setmaptile 0x01 0x19 0x3F7 0x1
			return

		Passo_Tuono_1_1_MapScriptOnLoad_3C:
			setmaptile 0x15 0x11 0x38A 0x1
			setmaptile 0x16 0x11 0x38B 0x1 
			setmaptile 0x15 0x12 0x38C 0x0
			setmaptile 0x16 0x12 0x38D 0x0
			setmaptile 0x15 0x13 0x29F 0x0
			setmaptile 0x16 0x13 0x171 0x0
			setmaptile 0x15 0x14 0x205 0x0
			setmaptile 0x16 0x14 0x171 0x0
			setmaptile 0x17 0x14 0x224 0x0
			return


	Passo_Tuono_1_1_MapScriptOnFrame:
		levelscript 0x4066, 0, Passo_Tuono_1_1_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_1_MapScriptOnFrameBegin:
			pause 0x3E
			special 0x113
			applymovement 0x7F Passo_Tuono_1_1_mov1
			waitmovement 0x7F
			pause 0x1E
			showpokepic 0x3AB 0x0 0x6
			textcolor 0x0
			msgbox Passo_Tuono_1_1_text1 MSG_NORMAL
			special 0x15A
			pause 0x1E
			applymovement 0x2 Passo_Tuono_1_1_mov2
			waitmovement 0x2
			spriteface 0x1 0x2
			pause 0x1E
			showpokepic 0x3AD 0x15 0x6
			msgbox Passo_Tuono_1_1_text2 MSG_NORMAL
			special 0x15A						
			pause 0x1E
			applymovement 0x2 Passo_Tuono_1_1_mov3
			waitmovement 0x2	
			spriteface 0x1 0x4	
			pause 0x1E
			showpokepic 0x3AD 0x15 0x6
			msgbox Passo_Tuono_1_1_text3 MSG_NORMAL
			special 0x15A	
			pause 0x1E
			spriteface 0x2 0x3
			pause 0x1E	
			showpokepic 0x3AB 0x0 0x6
			msgbox Passo_Tuono_1_1_text4 MSG_NORMAL
			special 0x15A
			pause 0x2E
			showpokepic 0x3AD 0x15 0x6
			msgbox Passo_Tuono_1_1_text5 MSG_NORMAL
			special 0x15A	
			pause 0x2E
			applymovement 0x1 Passo_Tuono_1_1_mov4
			waitmovement 0x1
			pause 0x1E
			showpokepic 0x3AB 0x0 0x6
			msgbox Passo_Tuono_1_1_text6 MSG_NORMAL
			special 0x15A
			pause 0x2E
			fadescreen 0x3
			pause 0x2E
			hidesprite 0x1
			sound 0x9
			fadescreen 0x2
			pause 0x2E
			applymovement 0x2 Passo_Tuono_1_1_mov5
			waitmovement 0x2
			pause 0x1E
			showpokepic 0x3AD 0x0 0x6
			msgbox Passo_Tuono_1_1_text7 MSG_NORMAL
			special 0x15A				
			pause 0x2E
			showpokepic 0x3AD 0x0 0x6
			msgbox Passo_Tuono_1_1_text8 MSG_NORMAL
			special 0x15A	
			pause 0x2E
			applymovement 0x2 Passo_Tuono_1_1_mov6
			waitmovement 0x2
			pause 0x1E
			showpokepic 0x3AD 0x0 0x6
			msgbox Passo_Tuono_1_1_text9 MSG_NORMAL
			special 0x15A	
			fadescreen 0x3
			pause 0x1E
			hidesprite 0x2
			sound 0x9
			fadescreen 0x2
			pause 0x3E
			setvar 0x4066 0x1
			compare 0x5026 0x0
			if 0x1 _goto blue_1_1
			compare 0x5026 0x88
			if 0x1 _goto orange_1_1
			compare 0x5026 0x85
			if 0x1 _goto green_1_1	
			releaseall
			end

				blue_1_1:
					setvar 0x501F 0x100
					warpmuted 0x3 0x15 0xFF 0x64 0x6
					releaseall
					end

				orange_1_1:
					setvar 0x501F 0x1a3
					warpmuted 0x3 0x15 0xFF 0x64 0x6
					releaseall
					end

				green_1_1:
					setvar 0x501F 0x1a4
					warpmuted 0x3 0x15 0xFF 0x64 0x6
					releaseall
					end


			
			Passo_Tuono_1_1_mov1:
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xD 
				.byte 0xFE

			Passo_Tuono_1_1_mov2:
				.byte 0x1 
				.byte 0x1A
				.byte 0x62
				.byte 0x1C
				.byte 0x11
				.byte 0xFE

			Passo_Tuono_1_1_mov3:
				.byte 0x3 
				.byte 0x1B
				.byte 0x55
				.byte 0x55
				.byte 0x20
				.byte 0x20
				.byte 0x20
				.byte 0xFE

			Passo_Tuono_1_1_mov4:
				.byte 0x10
				.byte 0xFE

			Passo_Tuono_1_1_mov5:
				.byte 0x63
				.byte 0x1A
				.byte 0x2 
				.byte 0x1B
				.byte 0x1 
				.byte 0x1B
				.byte 0x0 
				.byte 0xFE

			Passo_Tuono_1_1_mov6:
				.byte 0x1B
				.byte 0x2 
				.byte 0x1B
				.byte 0x1 
				.byte 0x1A
				.byte 0x3 
				.byte 0x1A
				.byte 0x0 
				.byte 0xFE

	
//SIGNS____
.global EventScript_Passo_Tuono_1_1_Sign0
EventScript_Passo_Tuono_1_1_Sign0:
	msgbox Passo_Tuono_1_1_Sign0_text1 0x7
	end

.global EventScript_Passo_Tuono_1_1_Sign1
EventScript_Passo_Tuono_1_1_Sign1:
	msgbox Passo_Tuono_1_1_Sign1_text1 0x7
	end

.global EventScript_Passo_Tuono_1_1_Sign2
EventScript_Passo_Tuono_1_1_Sign2:
	msgbox Passo_Tuono_1_1_Sign2_text1 0x7
	end

.global EventScript_Passo_Tuono_1_1_Sign3
EventScript_Passo_Tuono_1_1_Sign3:
	msgbox Passo_Tuono_1_1_Sign3_text1 0x7
	end

.global EventScript_Passo_Tuono_1_1_Sign11
EventScript_Passo_Tuono_1_1_Sign11:
	msgbox Passo_Tuono_1_1_Sign11_text1 0x7
	end

//ROCKS_SIGNS

EventScript_Passo_Tuono_1_1_SignR:
	msgbox Passo_Tuono_1_1_SignR_text1 MSG_NORMAL
	end

.global EventScript_Passo_Tuono_1_1_Sign4
EventScript_Passo_Tuono_1_1_Sign4:
	checkflag 0x35
	if 0x1 _goto EventScript_Passo_Tuono_1_1_SignR
	msgbox Passo_Tuono_1_1_Sign4_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign4_P1
	closeonkeypress
	end

	EventScript_Passo_Tuono_1_1_Sign4_P1:
		msgbox Passo_Tuono_1_1_Sign4_text2 MSG_NORMAL
		setflag 0x35
		setmaptile 0x4 0x3 0x3F5 0x1
		setmaptile 0x4 0x4 0x3F4 0x1
		special 0x8E
		sound 0xC
		checkflag 0x35
		if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL
		end

.global EventScript_Passo_Tuono_1_1_Sign5
EventScript_Passo_Tuono_1_1_Sign5:
	checkflag 0x36
	if 0x1 _goto EventScript_Passo_Tuono_1_1_SignR
	msgbox Passo_Tuono_1_1_Sign4_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign5_P1
	closeonkeypress
	end

	EventScript_Passo_Tuono_1_1_Sign5_P1:
		msgbox Passo_Tuono_1_1_Sign4_text2 MSG_NORMAL
		setflag 0x36
		setmaptile 0xC 0xC 0x3F6 0x1
		setmaptile 0xC 0xD 0x3F4 0x1
		special 0x8E
		sound 0xC
		checkflag 0x36
		if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL
		end

.global EventScript_Passo_Tuono_1_1_Sign6
EventScript_Passo_Tuono_1_1_Sign6:
	checkflag 0x37
	if 0x1 _goto EventScript_Passo_Tuono_1_1_SignR
	msgbox Passo_Tuono_1_1_Sign4_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign6_P1
	closeonkeypress
	end

	EventScript_Passo_Tuono_1_1_Sign6_P1:
		msgbox Passo_Tuono_1_1_Sign4_text2 MSG_NORMAL
		setflag 0x37
		setmaptile 0x14 0x2 0x3FA 0x1
		special 0x8E
		sound 0xC
		checkflag 0x37
		if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL
		end

.global EventScript_Passo_Tuono_1_1_Sign7
EventScript_Passo_Tuono_1_1_Sign7:
	checkflag 0x38
	if 0x1 _goto EventScript_Passo_Tuono_1_1_SignR
	msgbox Passo_Tuono_1_1_Sign4_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign7_P1
	closeonkeypress
	end

	EventScript_Passo_Tuono_1_1_Sign7_P1:
		msgbox Passo_Tuono_1_1_Sign4_text2 MSG_NORMAL
		setflag 0x38
		setmaptile 0x26 0x13 0x3F5 0x1
		setmaptile 0x26 0x14 0x3F4 0x1
		special 0x8E
		sound 0xC
		checkflag 0x38
		if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL
		end

.global EventScript_Passo_Tuono_1_1_Sign8
EventScript_Passo_Tuono_1_1_Sign8:
	checkflag 0x39
	if 0x1 _goto EventScript_Passo_Tuono_1_1_SignR
	msgbox Passo_Tuono_1_1_Sign4_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign8_P1
	closeonkeypress
	end

	EventScript_Passo_Tuono_1_1_Sign8_P1:
		msgbox Passo_Tuono_1_1_Sign4_text2 MSG_NORMAL
		setflag 0x39
		setmaptile 0x20 0x14 0x3F8 0x1
		setmaptile 0x20 0x15 0x3F4 0x1
		special 0x8E
		sound 0xC
		checkflag 0x39
		if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL
		end

.global EventScript_Passo_Tuono_1_1_Sign9
EventScript_Passo_Tuono_1_1_Sign9:
	checkflag 0x3A
	if 0x1 _goto EventScript_Passo_Tuono_1_1_SignR
	msgbox Passo_Tuono_1_1_Sign4_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign9_P1
	closeonkeypress
	end

	EventScript_Passo_Tuono_1_1_Sign9_P1:
		msgbox Passo_Tuono_1_1_Sign4_text2 MSG_NORMAL
		setflag 0x3A
		setmaptile 0x0F 0x18 0x3F5 0x1
		setmaptile 0x0F 0x19 0x3F4 0x1
		special 0x8E
		sound 0xC
		checkflag 0x3A
		if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL
		end

.global EventScript_Passo_Tuono_1_1_Sign10
EventScript_Passo_Tuono_1_1_Sign10:
	checkflag 0x3B
	if 0x1 _goto EventScript_Passo_Tuono_1_1_SignR
	msgbox Passo_Tuono_1_1_Sign4_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign10_P1
	closeonkeypress
	end

	EventScript_Passo_Tuono_1_1_Sign10_P1:
		msgbox Passo_Tuono_1_1_Sign4_text2 MSG_NORMAL
		setflag 0x3B
		setmaptile 0x01 0x19 0x3F7 0x1
		special 0x8E
		sound 0xC
		checkflag 0x3B
		if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL
		end

EventScript_Passo_Tuono_1_1_Sign_SOL:
	checkflag 0x35
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL_35
	end

	EventScript_Passo_Tuono_1_1_Sign_SOL_35:
	checkflag 0x36
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL_36
	end

	EventScript_Passo_Tuono_1_1_Sign_SOL_36:
	checkflag 0x37
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL_37
	end

	EventScript_Passo_Tuono_1_1_Sign_SOL_37:
	checkflag 0x38
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL_38
	end

	EventScript_Passo_Tuono_1_1_Sign_SOL_38:
	checkflag 0x39
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL_39
	end

	EventScript_Passo_Tuono_1_1_Sign_SOL_39:
	checkflag 0x3A
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL_3A
	end

	EventScript_Passo_Tuono_1_1_Sign_SOL_3A:
	checkflag 0x3B
	if 0x1 _goto EventScript_Passo_Tuono_1_1_Sign_SOL_3B
	end

	EventScript_Passo_Tuono_1_1_Sign_SOL_3B:
		pause 0x1E		
		sound 0xC
		pause 0x1E
		setvar 0x8004 0xF  
		setvar 0x8005 0xF  
		setvar 0x8006 0xF  
		setvar 0x8007 0xF
		special 0x136
		sound 0xC
		waitstate
		applymovement 0xFF Passo_Tuono_1_1_Sign_SOL_3B_mov1
		waitmovement 0xFF
		pause 0x1E
		msgbox Passo_Tuono_1_1_Sign4_text3 MSG_NORMAL
		setflag 0x3C
		setmaptile 0x15 0x11 0x38A 0x1
		setmaptile 0x16 0x11 0x38B 0x1 
		setmaptile 0x15 0x12 0x38C 0x0
		setmaptile 0x16 0x12 0x38D 0x0
		setmaptile 0x15 0x13 0x29F 0x0
		setmaptile 0x16 0x13 0x171 0x0
		setmaptile 0x15 0x14 0x205 0x0
		setmaptile 0x16 0x14 0x171 0x0
		setmaptile 0x17 0x14 0x224 0x0
		special 0x8E
		end


		Passo_Tuono_1_1_Sign_SOL_3B_mov1:
			.byte 0x62
			.byte 0xFE

//DUSK_NPCS

	.global EventScript_Passo_Tuono_1_1_NPC2
	EventScript_Passo_Tuono_1_1_NPC2:
		trainerbattle0 0x0 0x42 0x0 Passo_Tuono_1_1_NPC2_text1 Passo_Tuono_1_1_NPC2_text2
		msgbox Passo_Tuono_1_1_NPC2_text3 MSG_NORMAL
		end

	.global EventScript_Passo_Tuono_1_1_NPC3
	EventScript_Passo_Tuono_1_1_NPC3:
		trainerbattle0 0x0 0x43 0x0 Passo_Tuono_1_1_NPC3_text1 Passo_Tuono_1_1_NPC3_text2
		msgbox Passo_Tuono_1_1_NPC3_text3 MSG_NORMAL
		end

	.global EventScript_Passo_Tuono_1_1_NPC4
	EventScript_Passo_Tuono_1_1_NPC4:
		trainerbattle0 0x0 0x44 0x0 Passo_Tuono_1_1_NPC4_text1 Passo_Tuono_1_1_NPC4_text2
		msgbox Passo_Tuono_1_1_NPC4_text3 MSG_NORMAL
		end

	.global EventScript_Passo_Tuono_1_1_NPC5
	EventScript_Passo_Tuono_1_1_NPC5:
		trainerbattle0 0x0 0x45 0x0 Passo_Tuono_1_1_NPC5_text1 Passo_Tuono_1_1_NPC5_text2
		msgbox Passo_Tuono_1_1_NPC5_text3 MSG_NORMAL
		end

	.global EventScript_Passo_Tuono_1_1_NPC6
	EventScript_Passo_Tuono_1_1_NPC6:
		trainerbattle0 0x0 0x46 0x0 Passo_Tuono_1_1_NPC6_text1 Passo_Tuono_1_1_NPC6_text2
		msgbox Passo_Tuono_1_1_NPC5_text3 MSG_NORMAL
		end

//NORMAL NPCss___

.global EventScript_Passo_Tuono_1_1_NPC13
EventScript_Passo_Tuono_1_1_NPC13:
	lock
	faceplayer 
	msgbox Passo_Tuono_1_1_NPC13_text1 MSG_NORMAL
	release
	end

.global EventScript_Passo_Tuono_1_1_NPC14
EventScript_Passo_Tuono_1_1_NPC14:
	lock
	faceplayer 
	msgbox Passo_Tuono_1_1_NPC14_text1 MSG_NORMAL
	release
	end

.global EventScript_Passo_Tuono_1_1_NPC15
EventScript_Passo_Tuono_1_1_NPC15:
	lock
	faceplayer 
	msgbox Passo_Tuono_1_1_NPC15_text1 MSG_NORMAL
	release
	end

.global EventScript_Passo_Tuono_1_1_NPC16
EventScript_Passo_Tuono_1_1_NPC16:
	lock
	faceplayer 
	msgbox Passo_Tuono_1_1_NPC16_text1 MSG_NORMAL
	release
	end