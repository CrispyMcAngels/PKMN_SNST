.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global gMapScripts_Rovine_Ancestrali_1_33
gMapScripts_Rovine_Ancestrali_1_33:
	mapscript MAP_SCRIPT_ON_LOAD Rovine_Ancestrali_1_33_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_RESUME Rovine_Ancestrali_1_33_MapScriptOnResume
    .byte MAP_SCRIPT_TERMIN

		Rovine_Ancestrali_1_33_MapScriptOnLoad:
			setvar 0x5007 0x1
			compare 0x4051 0x1C
			if 0x1 _goto Rovine_Ancestrali_1_33_MapScriptOnLoad_P1
			end

			Rovine_Ancestrali_1_33_MapScriptOnLoad_P1:
				movesprite2 0x1 0x05 0x13
				end
		
		Rovine_Ancestrali_1_33_MapScriptOnResume:
			checkflag 0x959
			if 0x1 _goto Rovine_Ancestrali_1_33_MapScriptOnResume_P1
			end

			Rovine_Ancestrali_1_33_MapScriptOnResume_P1:
				//setflag FLAG_DOUBLE_WILD_BATTLE
				setflag 0x910
				//setflag FLAG_TAG_BATTLE
				setflag 0x908
				//setvar VAR_PARTNER_BACKSPRITE 0x2
				setvar 0x5011 0x00D
				setvar 0x5012 0x2
				setvar 0x8000 0x1 
				setvar 0x8001 0x1 
				special 0xD1
				end



.global EventScript_Rovine_Ancestrali_1_33_tile0
EventScript_Rovine_Ancestrali_1_33_tile0:
	compare 0x4051 0x1C
	if 0x1 _call EventScript_Rovine_Ancestrali_1_33_tile0_P3	
	compare 0x4051 0x1B
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_33_tile0_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_33_tile0_P1
	end

	EventScript_Rovine_Ancestrali_1_33_tile0_P3:
		lockall
		applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile0_P3_mov1
		waitmovement 0x1
		pause 0x1E
		showpokepic 0x3B5 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile0_text5 MSG_NORMAL
		special 0x15A		
		setvar 0x8000 0x1 
		setvar 0x8001 0x1 
		special 0xD1
		setvar 0x4051 0x1B
		setflag 0x959
		applymovement 0xFF EventScript_Rovine_Ancestrali_1_33_tile0_P2_mov1
		applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile0_P2_mov1
		waitmovement 0x0
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile0_P3_mov1:
			.byte 0x62
			.byte 0x10
			.byte 0xFE


	
	EventScript_Rovine_Ancestrali_1_33_tile0_P2:
		lockall
		spriteface 0xFF 0x2
		showpokepic 0x3B5 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile0_text4 MSG_NORMAL
		special 0x15A
		applymovement 0xFF EventScript_Rovine_Ancestrali_1_33_tile0_P2_mov1
		applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile0_P2_mov1
		waitmovement 0x0
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile0_P2_mov1:
			.byte 0x11
			.byte 0xFE


	EventScript_Rovine_Ancestrali_1_33_tile0_P1:
		lockall
		spriteface 0x1 0x2
		movesprite 0x1 0x05 0x17
		sound 0x09
		applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile0_mov1
		waitmovement 0x0
		spriteface 0xFF 0x1
		pause 0x1E
		showpokepic 0x3B5 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile0_text1 MSG_NORMAL
		special 0x15A
		fadescreen 0x1 
		fanfare 0x0100
		waitfanfare
		special 0x0
		fadescreen 0x0
		msgbox EventScript_Rovine_Ancestrali_1_33_tile0_text2 MSG_NORMAL
		pause 0x1E
		showpokepic 0x3B5 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile0_text3 MSG_NORMAL
		special 0x15A
		setvar 0x8000 0x1 
		setvar 0x8001 0x1 
		special 0xD1
		setvar 0x4051 0x1B
		setflag 0x959
		applymovement 0xFF EventScript_Rovine_Ancestrali_1_33_tile0_P2_mov1
		applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile0_P2_mov1
		waitmovement 0x0
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile0_mov1:
			.byte 0x1C
			.byte 0x62
			.byte 0x11
			.byte 0xFE

.global EventScript_Rovine_Ancestrali_1_33_NPC0
EventScript_Rovine_Ancestrali_1_33_NPC0:
	lock
	faceplayer
	showpokepic 0x3B5 0x0 0x6
    msgbox Rovine_Ancestrali_1_33_NPC0_text1 MSG_NORMAL
    special 0x15A
	release
	end



.global EventScript_Rovine_Ancestrali_1_33_tile1
EventScript_Rovine_Ancestrali_1_33_tile1:
	checkflag 0x956
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_33_tile1_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_33_tile1_P1
	end

	EventScript_Rovine_Ancestrali_1_33_tile1_P2:
		releaseall
		end

	EventScript_Rovine_Ancestrali_1_33_tile1_P1:
		lockall
		playsong 0x112 0x0
		applymovement 0x2 EventScript_Rovine_Ancestrali_1_33_tile1_mov1
		waitmovement 0x2
		showpokepic 0x3BB 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile1_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x3 EventScript_Rovine_Ancestrali_1_33_tile1_mov2
		waitmovement 0x3
		showpokepic 0x3BB 0x15 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile1_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		trainerbattle10 0xA 0x0E 0x0F 0x0D 0x2 0x0 EventScript_Rovine_Ancestrali_1_33_tile1_text3 EventScript_Rovine_Ancestrali_1_33_tile1_text4
		fadedefault
		setflag 0x956		
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile1_mov1:
			.byte 0x62
			.byte 0x19
			.byte 0x1D
			.byte 0x1D
			.byte 0xFE

		EventScript_Rovine_Ancestrali_1_33_tile1_mov2:
			.byte 0x62
			.byte 0x19
			.byte 0x1D
			.byte 0x1D
			.byte 0x1D
			.byte 0x1F
			.byte 0xFE


.global EventScript_Rovine_Ancestrali_1_33_tile2
EventScript_Rovine_Ancestrali_1_33_tile2:
	checkflag 0x956
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_33_tile2_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_33_tile2_P1
	end

	EventScript_Rovine_Ancestrali_1_33_tile2_P2:
		releaseall
		end

	EventScript_Rovine_Ancestrali_1_33_tile2_P1:
		lockall
		playsong 0x112 0x0
		applymovement 0x2 EventScript_Rovine_Ancestrali_1_33_tile2_mov1
		waitmovement 0x2
		showpokepic 0x3BB 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile1_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x3 EventScript_Rovine_Ancestrali_1_33_tile2_mov2
		waitmovement 0x3
		showpokepic 0x3BB 0x15 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile1_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		trainerbattle10 0xA 0x0E 0x0F 0x0D 0x2 0x0 EventScript_Rovine_Ancestrali_1_33_tile1_text3 EventScript_Rovine_Ancestrali_1_33_tile1_text4
		fadedefault
		setflag 0x956
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile2_mov1:
			.byte 0x62
			.byte 0x19
			.byte 0x1D
			.byte 0x1D
			.byte 0x1D
			.byte 0x3 
			.byte 0xFE


		EventScript_Rovine_Ancestrali_1_33_tile2_mov2:
			.byte 0x62
			.byte 0x19
			.byte 0x1D
			.byte 0x1D
			.byte 0x1D
			.byte 0x2 
			.byte 0xFE

.global EventScript_Rovine_Ancestrali_1_33_tile3
EventScript_Rovine_Ancestrali_1_33_tile3:
	checkflag 0x956
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_33_tile3_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_33_tile3_P1
	end

	EventScript_Rovine_Ancestrali_1_33_tile3_P2:
		releaseall
		end

	EventScript_Rovine_Ancestrali_1_33_tile3_P1:
		lockall
		playsong 0x112 0x0
		applymovement 0x2 EventScript_Rovine_Ancestrali_1_33_tile3_mov1
		waitmovement 0x2
		showpokepic 0x3BB 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile1_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x3 EventScript_Rovine_Ancestrali_1_33_tile3_mov2
		waitmovement 0x3
		showpokepic 0x3BB 0x15 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile1_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		trainerbattle10 0xA 0x0E 0x0F 0x0D 0x2 0x0 EventScript_Rovine_Ancestrali_1_33_tile1_text3 EventScript_Rovine_Ancestrali_1_33_tile1_text4
		fadedefault
		setflag 0x956
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile3_mov1:
			.byte 0x62
			.byte 0x19
			.byte 0x1D
			.byte 0x1D
			.byte 0x1D
			.byte 0x20
			.byte 0xFE

		EventScript_Rovine_Ancestrali_1_33_tile3_mov2:
			.byte 0x62
			.byte 0x19
			.byte 0x1D
			.byte 0x1D
			.byte 0xFE


.global EventScript_Rovine_Ancestrali_1_33_tile4
EventScript_Rovine_Ancestrali_1_33_tile4:
	checkflag 0x957
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_33_tile4_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_33_tile4_P1
	end

	EventScript_Rovine_Ancestrali_1_33_tile4_P2:
		releaseall
		end

	EventScript_Rovine_Ancestrali_1_33_tile4_P1:
		lockall
		playsong 0x112 0x0
		applymovement 0x4 EventScript_Rovine_Ancestrali_1_33_tile4_mov1
		waitmovement 0x4
		showpokepic 0x3BC 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile4_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x5 EventScript_Rovine_Ancestrali_1_33_tile4_mov2
		waitmovement 0x5
		showpokepic 0x3BB 0x15 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile4_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		trainerbattle10 0xA 0x10 0x11 0x0D 0x2 0x0 EventScript_Rovine_Ancestrali_1_33_tile4_text3 EventScript_Rovine_Ancestrali_1_33_tile4_text4
		fadedefault
		setflag 0x957
		applymovement 0x4 EventScript_Rovine_Ancestrali_1_33_tile4_mov3
		waitmovement 0x4
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile4_mov1:
			.byte 0x62
			.byte 0x19
			.byte 0x1D
			.byte 0x1D
			.byte 0x1D
			.byte 0xFE


		EventScript_Rovine_Ancestrali_1_33_tile4_mov2:
			.byte 0x62
			.byte 0x19
			.byte 0x20
			.byte 0x1D
			.byte 0x3 
			.byte 0xFE

		EventScript_Rovine_Ancestrali_1_33_tile4_mov3:
			.byte 0x11
			.byte 0x0 
			.byte 0xFE


.global EventScript_Rovine_Ancestrali_1_33_tile5
EventScript_Rovine_Ancestrali_1_33_tile5:
	checkflag 0x958
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_33_tile5_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_33_tile5_P1
	end

	EventScript_Rovine_Ancestrali_1_33_tile5_P2:
		releaseall
		end

	EventScript_Rovine_Ancestrali_1_33_tile5_P1:
		lockall
		playsong 0x112 0x0
		applymovement 0x6 EventScript_Rovine_Ancestrali_1_33_tile5_mov1
		waitmovement 0x0
		showpokepic 0x3BB 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile5_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x7 EventScript_Rovine_Ancestrali_1_33_tile5_mov2
		waitmovement 0x0
		showpokepic 0x3BC 0x15 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile5_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		trainerbattle10 0xA 0x12 0x13 0x0D 0x2 0x0 EventScript_Rovine_Ancestrali_1_33_tile5_text3 EventScript_Rovine_Ancestrali_1_33_tile5_text4
		fadedefault
		applymovement 0x6 EventScript_Rovine_Ancestrali_1_33_tile5_mov3
		waitmovement 0x0
		setflag 0x958
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile5_mov1:
			.byte 0x62
			.byte 0x19
			.byte 0x20
			.byte 0xFE

		EventScript_Rovine_Ancestrali_1_33_tile5_mov2:
			.byte 0x62
			.byte 0x19
			.byte 0x1E
			.byte 0x1E
			.byte 0xFE

		EventScript_Rovine_Ancestrali_1_33_tile5_mov3:
			.byte 0x12
			.byte 0x3 
			.byte 0xFE


.global EventScript_Rovine_Ancestrali_1_33_tile6
EventScript_Rovine_Ancestrali_1_33_tile6:
	checkflag 0x958
	if 0x1 _goto EventScript_Rovine_Ancestrali_1_33_tile6_P2
	if 0x0 _goto EventScript_Rovine_Ancestrali_1_33_tile6_P1
	end

	EventScript_Rovine_Ancestrali_1_33_tile6_P2:
		releaseall
		end

	EventScript_Rovine_Ancestrali_1_33_tile6_P1:
		lockall
		playsong 0x112 0x0
		applymovement 0x6 EventScript_Rovine_Ancestrali_1_33_tile6_mov1
		waitmovement 0x0
		showpokepic 0x3BB 0x0 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile5_text1 MSG_NORMAL
		special 0x15A
		pause 0x1E
		applymovement 0x7 EventScript_Rovine_Ancestrali_1_33_tile6_mov2
		waitmovement 0x0
		showpokepic 0x3BC 0x15 0x6
		msgbox EventScript_Rovine_Ancestrali_1_33_tile5_text2 MSG_NORMAL
		special 0x15A
		pause 0x1E
		trainerbattle10 0xA 0x12 0x13 0x0D 0x2 0x0 EventScript_Rovine_Ancestrali_1_33_tile5_text3 EventScript_Rovine_Ancestrali_1_33_tile5_text4
		fadedefault
		setflag 0x958
		releaseall
		end

		EventScript_Rovine_Ancestrali_1_33_tile6_mov1:
			.byte 0x62
			.byte 0x19
			.byte 0x1D
			.byte 0x20
			.byte 0xFE

		EventScript_Rovine_Ancestrali_1_33_tile6_mov2:
			.byte 0x62
			.byte 0x19
			.byte 0x1E
			.byte 0xFE


.global EventScript_Rovine_Ancestrali_1_33_NPC1
EventScript_Rovine_Ancestrali_1_33_NPC1:
	lock
	faceplayer
	showpokepic 0x3BB 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_NPC1_text1 MSG_NORMAL
	special 0x15A	
	release
	end

.global EventScript_Rovine_Ancestrali_1_33_NPC2
EventScript_Rovine_Ancestrali_1_33_NPC2:
	lock
	faceplayer
	showpokepic 0x3BB 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_NPC2_text1 MSG_NORMAL
	special 0x15A	
	release
	end

.global EventScript_Rovine_Ancestrali_1_33_NPC3
EventScript_Rovine_Ancestrali_1_33_NPC3:
	lock
	faceplayer
	showpokepic 0x3BC 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_NPC3_text1 MSG_NORMAL
	special 0x15A	
	release
	end

.global EventScript_Rovine_Ancestrali_1_33_NPC4
EventScript_Rovine_Ancestrali_1_33_NPC4:
	lock
	faceplayer
	showpokepic 0x3BB 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_NPC4_text1 MSG_NORMAL
	special 0x15A	
	release
	end

.global EventScript_Rovine_Ancestrali_1_33_NPC5
EventScript_Rovine_Ancestrali_1_33_NPC5:
	lock
	faceplayer
	showpokepic 0x3BC 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_NPC5_text1 MSG_NORMAL
	special 0x15A	
	release
	end

.global EventScript_Rovine_Ancestrali_1_33_NPC6
EventScript_Rovine_Ancestrali_1_33_NPC6:
	lock
	faceplayer
	showpokepic 0x3BB 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_NPC6_text1 MSG_NORMAL
	special 0x15A	
	release
	end


.global EventScript_Rovine_Ancestrali_1_33_tile7
EventScript_Rovine_Ancestrali_1_33_tile7:
	lockall
	applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile7_mov1
	waitmovement 0x0
	showpokepic 0x3B5 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_tile7_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B5 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_tile7_text2 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile7_mov2
	applymovement 0xFF EventScript_Rovine_Ancestrali_1_33_tile7_mov3
	waitmovement 0x0
	hidesprite 0x1
	sound 0x09
	special 0xD2
	setflag 0x956
	setflag 0x957	
	setflag 0x958
	clearflag 0x959
	setvar 0x4052 0x2
	setvar 0x4051 0x1D
	setvar 0x4050 0x4
	warp 0x01 0x22 0xFF 0x0B 0x11
	releaseall
	end

	EventScript_Rovine_Ancestrali_1_33_tile7_mov1:
		.byte 0x10
		.byte 0x12
		.byte 0x12
		.byte 0x11
		.byte 0x3 
		.byte 0xFE

	EventScript_Rovine_Ancestrali_1_33_tile7_mov2:
		.byte 0x11
		.byte 0x60
		.byte 0x11
		.byte 0xFE

	EventScript_Rovine_Ancestrali_1_33_tile7_mov3:
		.byte 0x12
		.byte 0x11
		.byte 0x60
		.byte 0xFE


.global EventScript_Rovine_Ancestrali_1_33_tile8
EventScript_Rovine_Ancestrali_1_33_tile8:
	lockall
	applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile7_mov1
	waitmovement 0x0
	showpokepic 0x3B5 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_tile7_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B5 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_tile7_text2 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile8_mov2
	applymovement 0xFF EventScript_Rovine_Ancestrali_1_33_tile8_mov3
	waitmovement 0x0
	hidesprite 0x1
	sound 0x09
	special 0xD2
	setflag 0x956
	setflag 0x957	
	setflag 0x958
	clearflag 0x959
	setvar 0x4052 0x2
	setvar 0x4051 0x1D
	setvar 0x4050 0x4
	warp 0x01 0x22 0xFF 0x0B 0x11
	releaseall
	end


	EventScript_Rovine_Ancestrali_1_33_tile8_mov2:
		.byte 0x11
		.byte 0x11
		.byte 0x60
		.byte 0x11
		.byte 0xFE

	EventScript_Rovine_Ancestrali_1_33_tile8_mov3:
		.byte 0x12
		.byte 0x11
		.byte 0x11
		.byte 0x60
		.byte 0xFE


.global EventScript_Rovine_Ancestrali_1_33_tile9
EventScript_Rovine_Ancestrali_1_33_tile9:
	lockall
	applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile9_mov1
	waitmovement 0x0
	showpokepic 0x3B5 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_tile7_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B5 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_tile7_text2 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile9_mov2
	applymovement 0xFF EventScript_Rovine_Ancestrali_1_33_tile9_mov3
	waitmovement 0x0	
	hidesprite 0x1
	sound 0x09
	special 0xD2
	setflag 0x956
	setflag 0x957	
	setflag 0x958
	clearflag 0x959
	setvar 0x4052 0x2
	setvar 0x4051 0x1D
	setvar 0x4050 0x4
	warp 0x01 0x22 0xFF 0x0B 0x11
	releaseall
	end

	EventScript_Rovine_Ancestrali_1_33_tile9_mov1:
		.byte 0x11
		.byte 0x12
		.byte 0x12
		.byte 0x10
		.byte 0x3 
		.byte 0xFE

	EventScript_Rovine_Ancestrali_1_33_tile9_mov2:
		.byte 0x11
		.byte 0x11
		.byte 0x11
		.byte 0x60
		.byte 0x11
		.byte 0xFE

	EventScript_Rovine_Ancestrali_1_33_tile9_mov3:
		.byte 0x12
		.byte 0x11
		.byte 0x11
		.byte 0x11
		.byte 0x60
		.byte 0xFE


.global EventScript_Rovine_Ancestrali_1_33_tile10
EventScript_Rovine_Ancestrali_1_33_tile10:
	lockall
	applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile10_mov1
	waitmovement 0x0
	spriteface 0xFF 0x2
	showpokepic 0x3B5 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_tile7_text1 MSG_NORMAL
	special 0x15A
	pause 0x1E
	showpokepic 0x3B5 0x0 0x6
	msgbox EventScript_Rovine_Ancestrali_1_33_tile7_text2 MSG_NORMAL
	special 0x15A	
	pause 0x1E
	applymovement 0x1 EventScript_Rovine_Ancestrali_1_33_tile10_mov2
	applymovement 0xFF EventScript_Rovine_Ancestrali_1_33_tile10_mov3
	waitmovement 0x0
	hidesprite 0x1
	sound 0x09
	special 0xD2
	setflag 0x956
	setflag 0x957	
	setflag 0x958
	clearflag 0x959
	setvar 0x4052 0x2
	setvar 0x4051 0x1D
	setvar 0x4050 0x4
	warp 0x01 0x22 0xFF 0x0B 0x11
	releaseall
	end

	EventScript_Rovine_Ancestrali_1_33_tile10_mov1:
		.byte 0x11
		.byte 0x12
		.byte 0x0 
		.byte 0xFE

	EventScript_Rovine_Ancestrali_1_33_tile10_mov2:
		.byte 0x11
		.byte 0x12
		.byte 0x11
		.byte 0x11
		.byte 0x60
		.byte 0x11
		.byte 0xFE

	EventScript_Rovine_Ancestrali_1_33_tile10_mov3:
		.byte 0x11
		.byte 0x11
		.byte 0x12
		.byte 0x11
		.byte 0x11
		.byte 0x60
		.byte 0x11
		.byte 0xFE