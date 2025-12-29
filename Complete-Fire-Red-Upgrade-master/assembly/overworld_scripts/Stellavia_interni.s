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
			warpmuted 0xA 0x2 0xFF 0x06 0x0A
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