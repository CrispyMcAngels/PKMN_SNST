.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___10_0___

.global gMapScripts_Stellavia_10_0
gMapScripts_Stellavia_10_0:
	mapscript MAP_SCRIPT_ON_LOAD Stellavia_10_0_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

	Stellavia_10_0_MapScriptOnLoad:	
		setvar 0x5007 0x4
		end


.global EventScript_Stellavia_10_0_NPC0
EventScript_Stellavia_10_0_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_0_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_0_NPC1
EventScript_Stellavia_10_0_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_0_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_0_NPC2
EventScript_Stellavia_10_0_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_0_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_0_NPC3
EventScript_Stellavia_10_0_NPC3:
	trainerbattle0 0x0 0x4f 0x0 Stellavia_10_0_NPC3_text1 Stellavia_10_0_NPC3_text2
	msgbox Stellavia_10_0_NPC3_text3 MSG_NORMAL
	setflag 0x982
	checkflag 0x982
	if 0x1 _goto Stellavia_10_0_NPC345_1
	end

.global EventScript_Stellavia_10_0_NPC4
EventScript_Stellavia_10_0_NPC4:
	trainerbattle0 0x0 0x50 0x0 Stellavia_10_0_NPC4_text1 Stellavia_10_0_NPC4_text2
	msgbox Stellavia_10_0_NPC4_text3 MSG_NORMAL
	setflag 0x983
	checkflag 0x982
	if 0x1 _goto Stellavia_10_0_NPC345_1
	end
 
.global EventScript_Stellavia_10_0_NPC5
EventScript_Stellavia_10_0_NPC5:
	trainerbattle0 0x0 0x51 0x0 Stellavia_10_0_NPC5_text1 Stellavia_10_0_NPC5_text2
	msgbox Stellavia_10_0_NPC5_text3 MSG_NORMAL
	setflag 0x984
	checkflag 0x982
	if 0x1 _goto Stellavia_10_0_NPC345_1
	end

Stellavia_10_0_NPC345_1:
	checkflag 0x985
	if 0x1 _goto Stellavia_10_0_NPC345_0
	checkflag 0x983
	if 0x1 _goto Stellavia_10_0_NPC345_2
	release 
	end

Stellavia_10_0_NPC345_2:
	checkflag 0x984
	if 0x1 _goto Stellavia_10_0_NPC345_3
	release 
	end	

Stellavia_10_0_NPC345_3:
	msgbox Stellavia_10_0_NPC345_text1 MSG_NORMAL
	preparemsg Stellavia_10_0_NPC345_text2
	waitmsg
	multichoice 0x0 0x0 0x1C 0x0
	compare 0x800D 0x0
	if 0x1 _goto Stellavia_10_10_NPC345_GRASS
	compare 0x800D 0x1
	if 0x1 _goto Stellavia_10_10_NPC345_FIRE
	compare 0x800D 0x2
	if 0x1 _goto Stellavia_10_10_NPC345_WATER
	release 
	end

Stellavia_10_0_NPC345_0:
	release
	end

Stellavia_10_10_NPC345_GRASS:
	giveitem 0xCD 0x1 MSG_OBTAIN
	setflag 0x985
	release
	end

Stellavia_10_10_NPC345_FIRE:
	giveitem 0xD7 0x1 MSG_OBTAIN
	setflag 0x985
	release
	end

Stellavia_10_10_NPC345_WATER:
	giveitem 0xD1 0x1 MSG_OBTAIN
	setflag 0x985
	release
	end

//____10_1______

.global EventScript_Stellavia_10_1_Sign0
EventScript_Stellavia_10_1_Sign0:
    msgbox Stellavia_10_1_SIGN0 0x7
    end

.global EventScript_Stellavia_10_1_Sign1
EventScript_Stellavia_10_1_Sign1:
    msgbox Stellavia_10_1_SIGN1 0x7
    end

.global EventScript_Stellavia_10_1_Sign2
EventScript_Stellavia_10_1_Sign2:
    msgbox Stellavia_10_1_SIGN2 0x7
    end

.global EventScript_Stellavia_10_1_NPC0
EventScript_Stellavia_10_1_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_1_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_1_NPC1
EventScript_Stellavia_10_1_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_1_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_1_NPC2
EventScript_Stellavia_10_1_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_1_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_1_NPC3
EventScript_Stellavia_10_1_NPC3:
	lock
	faceplayer
	msgbox Stellavia_10_1_NPC3_text1 MSG_NORMAL
	release
	end

//____10_2______

.global EventScript_Stellavia_10_2_Sign2
EventScript_Stellavia_10_2_Sign2:
    msgbox Stellavia_10_2_SIGN2 0x7
    end

.global EventScript_Stellavia_10_2_NPC0
EventScript_Stellavia_10_2_NPC0:
	lock
	faceplayer
	checkflag 0x97F
	if 0x1 _goto EventScript_Stellavia_10_2_NPC0_P2
	checkflag 0x97E
	if 0x1 _goto EventScript_Stellavia_10_2_NPC0_P1
	msgbox Stellavia_10_2_NPC0_text1 MSG_NORMAL
	pause 0x1E
	msgbox Stellavia_10_2_NPC0_text2 MSG_NORMAL
	pause 0x1E
	fanfare 0x0102
	textcolor 0x2
	msgbox Mission_Received_text1 MSG_NORMAL
	setflag 0x97E
	release
	end

	EventScript_Stellavia_10_2_NPC0_P1:
		msgbox Stellavia_10_2_NPC0_text3 MSG_NORMAL
		release
		end

	EventScript_Stellavia_10_2_NPC0_P2:
		msgbox Stellavia_10_2_NPC0_text4 MSG_NORMAL
		release
		end

.global EventScript_Stellavia_10_2_NPC1
EventScript_Stellavia_10_2_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_2_NPC1_text1 MSG_NORMAL
	release
	end


.global gMapScripts_Stellavia_10_2
gMapScripts_Stellavia_10_2:
	mapscript MAP_SCRIPT_ON_LOAD Stellavia_10_2_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Stellavia_10_2_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Stellavia_10_2_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Stellavia_10_2_MapScriptOnLoad:	
		compare 0x4060 0x8
		if 0x1 _call Stellavia_10_2_MapScriptOnLoad_P1
		checkflag 0x980
		if 0x1 _call Stellavia_10_2_MapScriptOnLoad_P1a
		compare 0x4060 0x9
		if 0x4 _call Stellavia_10_2_MapScriptOnLoad_P2
		end

		Stellavia_10_2_MapScriptOnLoad_P1:
			movesprite2 0x1 0x7 0x9
			spritebehave 0x1 0x9
			movesprite2 0x2 0x6 0x9
			spritebehave 0x2 0xA
			movesprite2 0x3 0x0 0x0
			return

		Stellavia_10_2_MapScriptOnLoad_P1a:
			spritebehave 0x2 0x8
			return

		Stellavia_10_2_MapScriptOnLoad_P2:
			movesprite2 0x2 0x7 0x9
			spritebehave 0x2 0x1
			spritebehave 0x1 0x7
			return


	Stellavia_10_2_MapScriptOnWarpIntoMapTable:
		levelscript 0x4060, 8, Stellavia_10_2_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Stellavia_10_2_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end


	Stellavia_10_2_MapScriptOnFrame:
		levelscript 0x4060, 8, Stellavia_10_2_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Stellavia_10_2_MapScriptOnFrameBegin:
			lockall
			checkflag 0x97F
			if 0x1 _goto Stellavia_10_2_MapScriptOnFrameBegin_P1
			applymovement 0x1 Stellavia_10_2mov1
			waitmovement 0x1
			textcolor 0x1 
			msgbox Stellavia_10_2_level_text1 MSG_NORMAL
			pause 0x1E
			applymovement 0x2 Stellavia_10_2mov2
			waitmovement 0x2
			textcolor 0x1 
			msgbox Stellavia_10_2_level_text2 MSG_NORMAL
			pause 0x1E
			applymovement 0x2 Stellavia_10_2mov3
			waitmovement 0x2
			pause 0x1E
			msgbox Stellavia_10_2_level_text3 MSG_NORMAL
			pause 0x1E
			giveitem 0x156 0x1 MSG_OBTAIN
			setflag 0x97F
			releaseall
			end

			Stellavia_10_2_MapScriptOnFrameBegin_P1:
				fanfare 0x0103
				textcolor 0x2
				msgbox Mission_Completed_text1 MSG_NORMAL
				setvar 0x4060 0x9
				releaseall
				end


			Stellavia_10_2mov1:
				.byte 0x23
				.byte 0x23
				.byte 0x62
				.byte 0xFE

			Stellavia_10_2mov2:
				.byte 0x24
				.byte 0x24
				.byte 0x24
				.byte 0xFE

			Stellavia_10_2mov3:
				.byte 0x0 
				.byte 0x62
				.byte 0xFE

//____10_3______

.global EventScript_Stellavia_10_3_NPC0
EventScript_Stellavia_10_3_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_3_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_3_NPC1
EventScript_Stellavia_10_3_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_3_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_3_NPC2
EventScript_Stellavia_10_3_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_3_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_3_NPC3
EventScript_Stellavia_10_3_NPC3:
	lock
	faceplayer
	msgbox Stellavia_10_3_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_3_NPC4
EventScript_Stellavia_10_3_NPC4:
	lock
	faceplayer
	msgbox Stellavia_10_3_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_3_NPC5
EventScript_Stellavia_10_3_NPC5:
	lock
	faceplayer
	msgbox Stellavia_10_3_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_3_Sign0
EventScript_Stellavia_10_3_Sign0:
	msgbox Stellavia_10_3_SIGN0 0x7
	end

.global EventScript_Stellavia_10_3_Sign1
EventScript_Stellavia_10_3_Sign1:
	msgbox Stellavia_10_3_SIGN1 0x7
	pause 0x1E
	msgbox Stellavia_10_3_SIGN1_t1 MSG_NORMAL
	end

.global EventScript_Stellavia_10_3_Sign23
EventScript_Stellavia_10_3_Sign23:
	msgbox Stellavia_10_3_SIGN2_3 0x7
	end

.global EventScript_Stellavia_10_3_Sign4
EventScript_Stellavia_10_3_Sign4:
	msgbox Stellavia_10_3_SIGN4 0x7
	end

.global EventScript_Stellavia_10_3_Sign5
EventScript_Stellavia_10_3_Sign5:
	msgbox Stellavia_10_3_SIGN5 0x7
	end

.global EventScript_Stellavia_10_3_Sign6
EventScript_Stellavia_10_3_Sign6:
	msgbox Stellavia_10_3_SIGN6 0x7
	end

.global EventScript_Stellavia_10_3_Sign7
EventScript_Stellavia_10_3_Sign7:
	msgbox Stellavia_10_3_SIGN7 0x7
	end

.global EventScript_Stellavia_10_3_Sign8
EventScript_Stellavia_10_3_Sign8:
	msgbox Stellavia_10_3_SIGN8 0x7
	end

.global EventScript_Stellavia_10_3_Sign9
EventScript_Stellavia_10_3_Sign9:
	msgbox Stellavia_10_3_SIGN9 0x7
	end

//____10_4______

.global EventScript_Stellavia_10_4_NPC0
EventScript_Stellavia_10_4_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_NPC1
EventScript_Stellavia_10_4_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_NPC2
EventScript_Stellavia_10_4_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_NPC3
EventScript_Stellavia_10_4_NPC3:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_NPC4
EventScript_Stellavia_10_4_NPC4:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_NPC5
EventScript_Stellavia_10_4_NPC5:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC5_text1 MSG_NORMAL
	pause 0x1E
	msgbox Stellavia_10_4_NPC5_text2 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_NPC6
EventScript_Stellavia_10_4_NPC6:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC6_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_NPC7
EventScript_Stellavia_10_4_NPC7:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC7_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_NPC8
EventScript_Stellavia_10_4_NPC8:
	lock
	faceplayer
	msgbox Stellavia_10_4_NPC8_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_4_Sign0
EventScript_Stellavia_10_4_Sign0:
	msgbox Stellavia_10_4_SIGN0 0x7
	end

.global EventScript_Stellavia_10_4_Sign24
EventScript_Stellavia_10_4_Sign24:
	msgbox Stellavia_10_4_SIGN24 0x7
	end

.global EventScript_Stellavia_10_4_Sign28
EventScript_Stellavia_10_4_Sign28:
	msgbox Stellavia_10_4_SIGN28 0x7
	end

.global EventScript_Stellavia_10_4_Sign29
EventScript_Stellavia_10_4_Sign29:
	msgbox Stellavia_10_4_SIGN29 0x7
	end

.global EventScript_Stellavia_10_4_Sign31
EventScript_Stellavia_10_4_Sign31:
	msgbox Stellavia_10_4_SIGN31 0x7
	end

.global EventScript_Stellavia_10_4_Sign34
EventScript_Stellavia_10_4_Sign34:
	msgbox Stellavia_10_4_SIGN34 0x7
	end

.global EventScript_Stellavia_10_4_Sign35
EventScript_Stellavia_10_4_Sign35:
	msgbox Stellavia_10_4_SIGN35 0x7
	end

.global EventScript_Stellavia_10_4_Sign36
EventScript_Stellavia_10_4_Sign36:
	msgbox Stellavia_10_4_SIGN36 0x7
	end

.global EventScript_Stellavia_10_4_Sign38
EventScript_Stellavia_10_4_Sign38:
	msgbox Stellavia_10_4_SIGN38 0x7
	end

.global EventScript_Stellavia_10_4_Sign39
EventScript_Stellavia_10_4_Sign39:
	msgbox Stellavia_10_4_SIGN39 0x7
	end



//____10_5______

.global EventScript_Stellavia_10_5_NPC0
EventScript_Stellavia_10_5_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_5_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_5_NPC1
EventScript_Stellavia_10_5_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_5_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_5_NPC2
EventScript_Stellavia_10_5_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_5_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_5_NPC4
EventScript_Stellavia_10_5_NPC4:
	lock
	faceplayer
	msgbox Stellavia_10_5_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_5_NPC3
EventScript_Stellavia_10_5_NPC3:
	lock
	faceplayer
	checkflag 0x987
	if 0x1 _goto EventScript_Stellavia_10_5_NPC3_P4
	msgbox Stellavia_10_5_NPC3_text1 MSG_NORMAL
	pause 0x1E
	msgbox Stellavia_10_5_NPC3_text2 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Stellavia_10_5_NPC3_P1
	pause 0x1E
	msgbox Stellavia_10_5_NPC3_text3 MSG_NORMAL
	release
	end

	EventScript_Stellavia_10_5_NPC3_P1:
		special 0x113
		getplayerpos 0x4001 0x4002
		compare 0x4001 0x4 
		if 0x1 _call EventScript_Stellavia_10_5_NPC3_P1_04
		applymovement 0x7F Stellavia_10_5_NPC3_mov2
		waitmovement 0x7F
		pause 0x1E
		textcolor 0x0 
		msgbox Stellavia_10_5_NPC3_text4 MSG_NORMAL
		pause 0x1E
		preparemsg Stellavia_10_5_NPC3_text5
		waitmsg
		//tbd
		multichoice 0x0 0x0 0x2 0x0
		compare 0x800D 0x0
		if 0x1 _goto EventScript_Stellavia_10_5_NPC3_P0
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Stellavia_10_5_NPC3_P2
		compare 0x800D 0x2
		if 0x1 _goto EventScript_Stellavia_10_5_NPC3_P0
		release 
		end

		EventScript_Stellavia_10_5_NPC3_P0:
			fanfare 0x10F
			waitfanfare
			msgbox Stellavia_10_5_NPC3_text6 MSG_NORMAL
			applymovement 0x7F Stellavia_10_5_NPC3_mov3
			waitmovement 0x7F		
			getplayerpos 0x4001 0x4002
			compare 0x4001 0x4
			if 0x1 _call EventScript_Stellavia_10_5_NPC3_P1_04b
			special 0x114
			release
			end

		EventScript_Stellavia_10_5_NPC3_P1_04b:
			applymovement 0x7F Stellavia_10_5_NPC3_mov4
			waitmovement 0x7F
			return

			Stellavia_10_5_NPC3_mov3:
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0x10
				.byte 0xFE

			Stellavia_10_5_NPC3_mov4:
				.byte 0x14
				.byte 0x14
				.byte 0xFE

		EventScript_Stellavia_10_5_NPC3_P1_04:
			applymovement 0x7F Stellavia_10_5_NPC3_mov1
			waitmovement 0x7F
			return

			Stellavia_10_5_NPC3_mov1:
				.byte 0x13
				.byte 0x13
				.byte 0xFE

			Stellavia_10_5_NPC3_mov2:
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0xFE

	EventScript_Stellavia_10_5_NPC3_P2:
		msgbox Stellavia_10_5_NPC3_text6 MSG_NORMAL
		pause 0x1E
		msgbox Stellavia_10_5_NPC3_text7 MSG_NORMAL
		pause 0x1E
		preparemsg Stellavia_10_5_NPC3_text8
		waitmsg
		//tbd
		multichoice 0x0 0x0 0x3 0x0
		compare 0x800D 0x0
		if 0x1 _goto EventScript_Stellavia_10_5_NPC3_P0
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Stellavia_10_5_NPC3_P3
		compare 0x800D 0x2
		if 0x1 _goto EventScript_Stellavia_10_5_NPC3_P0
		release 
		end 

		EventScript_Stellavia_10_5_NPC3_P3:
			msgbox Stellavia_10_5_NPC3_text9 MSG_NORMAL
			pause 0x1E
			applymovement 0x3 Stellavia_10_5_NPC3_mov5
			waitmovement 0x3 
			msgbox Stellavia_10_5_NPC3_text10 MSG_NORMAL
			pause 0x1E
			applymovement 0x7F Stellavia_10_5_NPC3_mov3
			waitmovement 0x7F		
			getplayerpos 0x4001 0x4002
			compare 0x4001 0x4
			if 0x1 _call EventScript_Stellavia_10_5_NPC3_P1_04b
			special 0x114
			textcolor 0x1
			msgbox Stellavia_10_5_NPC3_text11 MSG_NORMAL
			giveitem 0x19 0x1 MSG_OBTAIN
			setflag 0x987
			release
			end

			Stellavia_10_5_NPC3_mov5:
				.byte 0x62
				.byte 0xFE

		EventScript_Stellavia_10_5_NPC3_P4:
			msgbox Stellavia_10_5_NPC3_text12 MSG_NORMAL

.global EventScript_Stellavia_10_5_Sign0
EventScript_Stellavia_10_5_Sign0:
	msgbox Stellavia_10_5_SIGN0 0x7
	end

.global EventScript_Stellavia_10_5_Sign1
EventScript_Stellavia_10_5_Sign1:
	msgbox Stellavia_10_5_SIGN1 0x7
	end


//____10_7______

.global EventScript_Stellavia_10_7_NPC0
EventScript_Stellavia_10_7_NPC0:
	lock
	faceplayer
	checkflag 0x988
	if 0x1 _goto EventScript_Stellavia_10_7_NPC0_P1
	playsong 0x18B 0x0
	msgbox Stellavia_10_7_NPC0_text1 MSG_NORMAL
	spriteface 0x1 0x1 
	pause 0x1E
	msgbox Stellavia_10_7_NPC0_text2 MSG_NORMAL
	pause 0x1E
	faceplayer
	msgbox Stellavia_10_7_NPC0_text3 MSG_NORMAL
	fadedefault
	pause 0x1E
	msgbox Stellavia_10_7_NPC0_text4 MSG_NORMAL
	pause 0x1E
	giveitem 0xB6 0x1 MSG_OBTAIN
	setflag 0x988
	release
	end

	EventScript_Stellavia_10_7_NPC0_P1:
		msgbox Stellavia_10_7_NPC0_text5 MSG_NORMAL
		release
		end

.global EventScript_Stellavia_10_7_NPC2
EventScript_Stellavia_10_7_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_7_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_7_NPC3
EventScript_Stellavia_10_7_NPC3:
	lock
	faceplayer
	checkflag 0x989
	if 0x1 _goto EventScript_Stellavia_10_7_NPC3_P1
	msgbox Stellavia_10_7_NPC3_text1 MSG_NORMAL
	pause 0x1E
	msgbox Stellavia_10_7_NPC3_text2 MSG_NORMAL
	pause 0x1E
	giveitem 0x45 0x1 MSG_OBTAIN
	setflag 0x989
	release
	end

	EventScript_Stellavia_10_7_NPC3_P1:
		msgbox Stellavia_10_7_NPC3_text3 MSG_NORMAL
		release
		end

//____10_8______

.global EventScript_Stellavia_10_8_NPC0
EventScript_Stellavia_10_8_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC1
EventScript_Stellavia_10_8_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC2
EventScript_Stellavia_10_8_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC3
EventScript_Stellavia_10_8_NPC3:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC4
EventScript_Stellavia_10_8_NPC4:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC5
EventScript_Stellavia_10_8_NPC5:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC6
EventScript_Stellavia_10_8_NPC6:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC6_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC7
EventScript_Stellavia_10_8_NPC7:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC7_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC8
EventScript_Stellavia_10_8_NPC8:
	lock
	faceplayer
	checkflag 0x98F
	if 0x1 _goto EventScript_Stellavia_10_8_NPC8_P1
	msgbox Stellavia_10_8_NPC8_text1 MSG_NORMAL
	pause 0x1E
	preparemsg Stellavia_10_8_NPC8_text2
	waitmsg
	multichoice 0x0 0x0 0x4 0x0
	compare 0x800D 0x0
	if 0x1 _goto EventScript_Stellavia_10_8_NPC8_1
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Stellavia_10_8_NPC8_2
	compare 0x800D 0x2
	if 0x1 _goto EventScript_Stellavia_10_8_NPC8_3
	release
	end

	EventScript_Stellavia_10_8_NPC8_P1:
		msgbox Stellavia_10_8_NPC8_text8 MSG_NORMAL
		release
		end		

	EventScript_Stellavia_10_8_NPC8_1:
		msgbox Stellavia_10_8_NPC8_text3 MSG_NORMAL
		release
		end

	EventScript_Stellavia_10_8_NPC8_2:
		msgbox Stellavia_10_8_NPC8_text4 MSG_NORMAL
		release
		end	

	EventScript_Stellavia_10_8_NPC8_3:
		msgbox Stellavia_10_8_NPC8_text5 MSG_NORMAL
		pause 0x1E
		msgbox Stellavia_10_8_NPC8_text6 MSG_NORMAL
		pause 0x1E
		msgbox Stellavia_10_8_NPC8_text7 MSG_NORMAL
		pause 0x1E
		giveitem 0x13B 0x1 MSG_OBTAIN
		special 0x8E
		setflag 0x98F
		release
		end

.global EventScript_Stellavia_10_8_NPC9
EventScript_Stellavia_10_8_NPC9:
	lock
	faceplayer
	msgbox Stellavia_10_8_NPC9_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_8_NPC10
EventScript_Stellavia_10_8_NPC10:
	lock
	faceplayer
	checkflag 0x98B
	if 0x1 _goto EventScript_Stellavia_10_8_NPC10_P3
	msgbox Stellavia_10_8_NPC10_text1 MSG_NORMAL
	pause 0x1E
	msgbox Stellavia_10_8_NPC10_text2 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Stellavia_10_8_NPC10_P1
	msgbox Stellavia_10_8_NPC10_text3 MSG_NORMAL
	release
	end

	EventScript_Stellavia_10_8_NPC10_P1:
		checkmoney 0x1388 0x0
		compare 0x800D 0x1
		if 0x4 _goto EventScript_Stellavia_10_8_NPC10_P2
		msgbox Stellavia_10_8_NPC10_text4 MSG_NORMAL
		release 
		end

		EventScript_Stellavia_10_8_NPC10_P2:
			sound 0x19
			removemoney 0x1388 0x0
			setflag 0x98B
			fanfare 0x10C
			waitfanfare
			msgbox Stellavia_10_8_NPC10_text5 MSG_NORMAL
			release 
			end

	EventScript_Stellavia_10_8_NPC10_P3:
		random 0x14
		compare 0x800D 0x0
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b50
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b45
		compare 0x800D 0x2
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b40
		compare 0x800D 0x3
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b35
		compare 0x800D 0x4
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b30
		compare 0x800D 0x5
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b25
		compare 0x800D 0x6
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b20
		compare 0x800D 0x7
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b15
		compare 0x800D 0x8
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b10
		compare 0x800D 0x9
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_b5
		compare 0x800D 0xA
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_0
		compare 0x800D 0xB
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_5
		compare 0x800D 0xC
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_10
		compare 0x800D 0xD
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_15
		compare 0x800D 0xE
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_20
		compare 0x800D 0xF
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_25
		compare 0x800D 0x10
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_30
		compare 0x800D 0x11
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_35
		compare 0x800D 0x12
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_40
		compare 0x800D 0x13
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_45
		compare 0x800D 0x14
		if 0x1 _goto EventScript_Stellavia_10_8_NPC10_50
		release
		end

		EventScript_Stellavia_10_8_NPC10_END:
			msgbox Stellavia_10_8_NPC10_text7 MSG_NORMAL
			release 
			end

		EventScript_Stellavia_10_8_NPC10_b50:
			msgbox Stellavia_10_8_NPC10_text_b50 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x9C4 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b45:
			msgbox Stellavia_10_8_NPC10_text_b45 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0xABE 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b40:
			msgbox Stellavia_10_8_NPC10_text_b40 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0xBB8 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b35:
			msgbox Stellavia_10_8_NPC10_text_b35 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0xCB2 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b30:
			msgbox Stellavia_10_8_NPC10_text_b30 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0xDAC 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b25:
			msgbox Stellavia_10_8_NPC10_text_b25 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0xEA6 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b20:
			msgbox Stellavia_10_8_NPC10_text_b20 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0xFA0 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b15:
			msgbox Stellavia_10_8_NPC10_text_b15 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x109A 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b10:
			msgbox Stellavia_10_8_NPC10_text_b10 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1194 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_b5:
			msgbox Stellavia_10_8_NPC10_text_b5 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x128E 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_0:
			msgbox Stellavia_10_8_NPC10_text_0 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1388 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_5:
			msgbox Stellavia_10_8_NPC10_text_5 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1482 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_10:
			msgbox Stellavia_10_8_NPC10_text_10 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x157C 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_15:
			msgbox Stellavia_10_8_NPC10_text_15 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1676 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_20:
			msgbox Stellavia_10_8_NPC10_text_20 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1770 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_25:
			msgbox Stellavia_10_8_NPC10_text_25 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x186A 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_30:
			msgbox Stellavia_10_8_NPC10_text_30 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1964 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_35:
			msgbox Stellavia_10_8_NPC10_text_35 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1A5E 0x0
			fanfare 0x10C
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_40:
			msgbox Stellavia_10_8_NPC10_text_40 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1B58 0x0
			fanfare 0x10D
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_45:
			msgbox Stellavia_10_8_NPC10_text_45 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1C52 0x0
			fanfare 0x10D
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end

		EventScript_Stellavia_10_8_NPC10_50:
			msgbox Stellavia_10_8_NPC10_text_50 MSG_YESNO
			compare 0x800D 0x1
			if 0x0 _goto EventScript_Stellavia_10_8_NPC10_END
			addmoney 0x1D4C 0x0
			fanfare 0x10D
			msgbox Stellavia_10_8_NPC10_text6 MSG_NORMAL
			clearflag 0x98B
			release
			end


.global EventScript_Stellavia_10_8_Sign0
EventScript_Stellavia_10_8_Sign0:
	msgbox Stellavia_10_8_SIGN0 0x7
	end

.global EventScript_Stellavia_10_8_Sign3
EventScript_Stellavia_10_8_Sign3:
	msgbox Stellavia_10_8_SIGN3 0x7
	end

.global EventScript_Stellavia_10_8_Sign8
EventScript_Stellavia_10_8_Sign8:
	msgbox Stellavia_10_8_SIGN8 0x7
	end

.global EventScript_Stellavia_10_8_Sign9
EventScript_Stellavia_10_8_Sign9:
	msgbox Stellavia_10_8_SIGN9 0x7
	end

//____10_9______

.global EventScript_Stellavia_10_9_NPC0
EventScript_Stellavia_10_9_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_9_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_9_NPC2
EventScript_Stellavia_10_9_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_9_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_9_NPC3
EventScript_Stellavia_10_9_NPC3:
	lock
	faceplayer
	cry 0x4 0x0
	msgbox Stellavia_10_9_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_9_NPC4
EventScript_Stellavia_10_9_NPC4:
	lock
	faceplayer
	checkflag 0x986
	if 0x1 _goto EventScript_Stellavia_10_9_NPC4_P1
	msgbox Stellavia_10_9_NPC4_text1 MSG_NORMAL
	pause 0x1E
	setflag 0x986
	giveitem 0x25 0x1 MSG_OBTAIN
	release
	end

	EventScript_Stellavia_10_9_NPC4_P1:
		msgbox Stellavia_10_9_NPC4_text2 MSG_NORMAL
		release
		end	

.global EventScript_Stellavia_10_9_NPC5
EventScript_Stellavia_10_9_NPC5:
	lock
	faceplayer
	msgbox Stellavia_10_9_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_9_Sign0
EventScript_Stellavia_10_9_Sign0:
	msgbox Stellavia_10_9_SIGN0 0x7
	end

.global EventScript_Stellavia_10_9_Sign4
EventScript_Stellavia_10_9_Sign4:
	msgbox Stellavia_10_9_SIGN4 0x7
	end

.global EventScript_Stellavia_10_9_Sign2
EventScript_Stellavia_10_9_Sign2:
	msgbox Stellavia_10_9_SIGN2 0x7
	end


//____10_10______

.global EventScript_Stellavia_10_10_Sign0
EventScript_Stellavia_10_10_Sign0:
	msgbox Stellavia_10_10_SIGN0 0x7
	end

.global EventScript_Stellavia_10_10_Sign1
EventScript_Stellavia_10_10_Sign1:
	msgbox Stellavia_10_10_SIGN1 0x7
	end

.global EventScript_Stellavia_10_10_NPC0
EventScript_Stellavia_10_10_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_10_NPC0_text1 MSG_NORMAL
	pause 0x1E
	applymovement 0x1 Stellavia_10_5_NPC3_mov5
	waitmovement 0x1
	pause 0x1E
	msgbox Stellavia_10_10_NPC0_text2 MSG_NORMAL
	pause 0x1E
	msgbox Stellavia_10_10_NPC0_text3 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_10_NPC1
EventScript_Stellavia_10_10_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_10_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_10_NPC2
EventScript_Stellavia_10_10_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_10_NPC2_text1 MSG_NORMAL
	release
	end

//____10_11______

.global EventScript_Stellavia_10_11_NPC0
EventScript_Stellavia_10_11_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_11_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_11_Sign1
EventScript_Stellavia_10_11_Sign1:
	msgbox Stellavia_10_11_SIGN1 0x7
	end

.global EventScript_Stellavia_10_11_NPC1
EventScript_Stellavia_10_11_NPC1:
	giveitem 0x40 0x1 MSG_FIND
	end

//____10_12______

.global EventScript_Stellavia_10_12_NPC1
EventScript_Stellavia_10_12_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_12_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_12_NPC2
EventScript_Stellavia_10_12_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_12_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_12_NPC3
EventScript_Stellavia_10_12_NPC3:
	lock
	faceplayer
	msgbox Stellavia_10_12_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_12_NPC4
EventScript_Stellavia_10_12_NPC4:
	lock
	faceplayer
	msgbox Stellavia_10_12_NPC4_text1 MSG_NORMAL
	release
	end

//____10_14______

.global EventScript_Stellavia_10_14_NPC0
EventScript_Stellavia_10_14_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_14_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_14_NPC1
EventScript_Stellavia_10_14_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_14_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_14_NPC2
EventScript_Stellavia_10_14_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_14_NPC2_text1 MSG_NORMAL
	checkflag 0x98A
	if 0x1 _goto EventScript_Stellavia_10_14_NPC2_P1
	msgbox Stellavia_10_14_NPC2_text2 MSG_NORMAL
	giveitem 0x2 0x5 MSG_OBTAIN
	setflag 0x98A
	release
	end

	EventScript_Stellavia_10_14_NPC2_P1:
		release
		end

.global EventScript_Stellavia_10_14_NPC3
EventScript_Stellavia_10_14_NPC3:
	lock
	faceplayer
	msgbox Stellavia_10_14_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_14_NPC4
EventScript_Stellavia_10_14_NPC4:
	lock
	faceplayer
	msgbox Stellavia_10_14_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_14_NPC5
EventScript_Stellavia_10_14_NPC5:
	lock
	faceplayer
	cry 0x1EE 0x0
	msgbox Stellavia_10_14_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_14_NPC6
EventScript_Stellavia_10_14_NPC6:
	lock
	faceplayer
	msgbox Stellavia_10_14_NPC6_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_14_Sign4
EventScript_Stellavia_10_14_Sign4:
	msgbox Stellavia_10_14_SIGN4 0x7
	end

.global EventScript_Stellavia_10_14_Sign5
EventScript_Stellavia_10_14_Sign5:
	msgbox Stellavia_10_14_SIGN5 0x7
	end

.global EventScript_Stellavia_10_14_Sign6
EventScript_Stellavia_10_14_Sign6:
	msgbox Stellavia_10_14_SIGN6 0x7
	end

.global EventScript_Stellavia_10_14_Sign7
EventScript_Stellavia_10_14_Sign7:
	msgbox Stellavia_10_14_SIGN7 0x7
	end

.global EventScript_Stellavia_10_14_Sign8
EventScript_Stellavia_10_14_Sign8:
	msgbox Stellavia_10_14_SIGN8 0x7
	end

//___10_17____

.global EventScript_Stellavia_10_17_NPC0
EventScript_Stellavia_10_17_NPC0:
	lock
	faceplayer
	msgbox Stellavia_10_17_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_17_NPC1
EventScript_Stellavia_10_17_NPC1:
	lock
	faceplayer
	msgbox Stellavia_10_17_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_10_17_Sign0
EventScript_Stellavia_10_17_Sign0:
	msgbox Stellavia_10_17_SIGN0 0x7
	end

//____10_19______

//SIGNS___________________

.global EventScript_Stellavia_10_19_Sign0
EventScript_Stellavia_10_19_Sign0:
	lock
	msgbox Ardesiopoli_6_9_NPC0_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _call EventScript_Stellavia_10_19_Sign0_YES
	if 0x0 _call EventScript_Stellavia_10_19_Sign0_NO
	release
	end

	EventScript_Stellavia_10_19_Sign0_NO:
		release
		end

	EventScript_Stellavia_10_19_Sign0_YES:
		applymovement 0xFF Stellavia_10_19_Sign0_mov1
		waitmovement 0x0
		pause 0x1e
		msgbox Ardesiopoli_6_9_NPC0_text3 0x7
		pause 0x1E
		sound 0x42
		applymovement 0x1 Stellavia_10_19_Sign0_mov2
		applymovement 0x2 Stellavia_10_19_Sign0_mov2
		waitmovement 0x0
		//dichiarare var che stiamo andando ad Ardesiopoli Sud 2
		setvar 0x4063 0x3
		setvar 0x405F 0x9
		//assegnazione casuale del posto
		random 0x6
		compare 0x800D 0x0
		if 0x1 _goto M6_20_P_H_SX
		compare 0x800D 0x1
		if 0x1 _goto M6_20_P_H_DX
		compare 0x800D 0x2
		if 0x1 _goto M6_20_P_M_SX
		compare 0x800D 0x3
		if 0x1 _goto M6_20_P_M_DX
		compare 0x800D 0x4
		if 0x1 _goto M6_20_P_L_SX
		compare 0x800D 0x5
		if 0x1 _goto M6_20_P_L_DX
		release
		end

			M6_20_P_H_SX:
				setvar 0x4064 0x0
				warp 0x6 0x14 0xFF 0x5 0x4
				release
				end

			M6_20_P_H_DX:
				setvar 0x4064 0x1
				warp 0x6 0x14 0xFF 0x7 0x4
				release
				end

			M6_20_P_M_SX:
				setvar 0x4064 0x2
				warp 0x6 0x14 0xFF 0x5 0x5
				release
				end

			M6_20_P_M_DX:
				setvar 0x4064 0x3
				warp 0x6 0x14 0xFF 0x7 0x5
				release
				end

			M6_20_P_L_SX:
				setvar 0x4064 0x4
				warp 0x6 0x14 0xFF 0x5 0x7
				release
				end

			M6_20_P_L_DX:
				setvar 0x4064 0x5
				warp 0x6 0x14 0xFF 0x7 0x7
				release
				end


	Stellavia_10_19_Sign0_mov1:
		.byte 0x11
		.byte 0x60
		.byte 0xFE

	Stellavia_10_19_Sign0_mov2:
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0xFE


	.global EventScript_Stellavia_10_19_Sign3
	EventScript_Stellavia_10_19_Sign3:
		msgbox Stellavia_10_19_Sign3_text1 0x7
		end

	.global EventScript_Stellavia_10_19_Sign4
	EventScript_Stellavia_10_19_Sign4:
		msgbox Stellavia_10_19_Sign4_text1 0x7
		end

//NPCS___________________

//Fantallen
.global EventScript_Stellavia_10_19_NPC2
EventScript_Stellavia_10_19_NPC2:
	lock
	faceplayer
	msgbox Stellavia_10_19_NPC2_text1 MSG_NORMAL
	release
	end

//tipa ai binari
.global EventScript_Stellavia_10_19_NPC3
EventScript_Stellavia_10_19_NPC3:
	lock
	faceplayer
	msgbox Stellavia_10_19_NPC3_text1 MSG_NORMAL
	release
	end

//vecchio
.global EventScript_Stellavia_10_19_NPC4
EventScript_Stellavia_10_19_NPC4:
	lock
	faceplayer
	msgbox Stellavia_10_19_NPC4_text1 MSG_NORMAL
	preparemsg Stellavia_10_19_NPC4_text2
	waitmsg
	multichoice 0x0 0x0 0x18 0x0
	compare 0x800D 0x0
	if 0x1 _goto Stellavia_10_19_NPC4_P1
	compare 0x800D 0x1
	if 0x1 _goto Stellavia_10_19_NPC4_P2
	compare 0x800D 0x2
	if 0x1 _goto Stellavia_10_19_NPC4_P3
	release
	end

	Stellavia_10_19_NPC4_P1:
		msgbox Stellavia_10_19_NPC4_text3 MSG_NORMAL
		release
		end

	Stellavia_10_19_NPC4_P2:
		msgbox Stellavia_10_19_NPC4_text4 MSG_NORMAL
		release
		end

	Stellavia_10_19_NPC4_P3:
		msgbox Stellavia_10_19_NPC4_text5 MSG_NORMAL
		release
		end

//Bancone
.global EventScript_Stellavia_10_19_NPC5
EventScript_Stellavia_10_19_NPC5:
	lock
	faceplayer
	msgbox Stellavia_10_19_NPC5_text1 MSG_NORMAL
	release
	end

//capotreno
.global EventScript_Stellavia_10_19_NPC6
EventScript_Stellavia_10_19_NPC6:
	lock
	faceplayer
	msgbox Stellavia_10_19_NPC6_text1 MSG_NORMAL
	release
	end