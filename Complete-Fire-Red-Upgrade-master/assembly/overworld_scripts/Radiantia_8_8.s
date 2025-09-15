.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___LEVEL___

.global gMapScripts_Radiantia_8_8
gMapScripts_Radiantia_8_8:
	mapscript MAP_SCRIPT_ON_LOAD Radiantia_8_8_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Radiantia_8_8_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Radiantia_8_8_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Radiantia_8_8_MapScriptOnLoad:
		setvar 0x5007 0x6
		checkflag 0x972
		if 0x1 _call Radiantia_8_8_MapScriptOnLoad_move_ele
		end

		Radiantia_8_8_MapScriptOnLoad_move_ele:
			spritebehave 0x7 0x8
			return

	Radiantia_8_8_MapScriptOnWarpIntoMapTable:
	levelscript 0x4061, 0, Radiantia_8_8_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN


	Radiantia_8_8_MapScriptOnWarpIntoMapTableBegin:
		spriteface 0xFF 0x2
		end

	Radiantia_8_8_MapScriptOnFrame:
		levelscript 0x4061, 0, Radiantia_8_8_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Radiantia_8_8_MapScriptOnFrameBegin:
			lockall
			pause 0x1E
			showpokepic 0x3C0 0x0 0x6
			msgbox Radiantia_8_8_NPC6_text10 MSG_NORMAL
			special 0x15A
			setvar 0x4061 0x2
			releaseall
			end		


//___SIGNs___

.global EventScript_Radiantia_8_8_Sign0
EventScript_Radiantia_8_8_Sign0:
	msgbox Radiantia_8_8_Sign0_text1 0x7
	end

//___NPCs___

.global EventScript_Radiantia_8_8_NPC0
EventScript_Radiantia_8_8_NPC0:
	lock
	faceplayer
	checkflag 0x821
	if 0x1 _goto EventScript_Radiantia_8_8_NPC0_P1
	msgbox Radiantia_8_8_NPC0_text1 MSG_NORMAL
	release
	end

	EventScript_Radiantia_8_8_NPC0_P1:
		msgbox Radiantia_8_8_NPC0_text2 MSG_NORMAL
		release
		end	

.global EventScript_Radiantia_8_8_NPC1
EventScript_Radiantia_8_8_NPC1:
	trainerbattle0 0x0 0x31 0x0 Radiantia_8_8_NPC1_text1 Radiantia_8_8_NPC1_text2
	msgbox Radiantia_8_8_NPC1_text3 MSG_NORMAL
	end

.global EventScript_Radiantia_8_8_NPC2
EventScript_Radiantia_8_8_NPC2:
	trainerbattle0 0x0 0x32 0x0 Radiantia_8_8_NPC2_text1 Radiantia_8_8_NPC2_text2
	msgbox Radiantia_8_8_NPC2_text3 MSG_NORMAL
	end

.global EventScript_Radiantia_8_8_NPC3
EventScript_Radiantia_8_8_NPC3:
	trainerbattle0 0x0 0x33 0x0 Radiantia_8_8_NPC3_text1 Radiantia_8_8_NPC3_text2
	msgbox Radiantia_8_8_NPC3_text3 MSG_NORMAL
	end

.global EventScript_Radiantia_8_8_NPC4
EventScript_Radiantia_8_8_NPC4:
	trainerbattle0 0x0 0x34 0x0 Radiantia_8_8_NPC4_text1 Radiantia_8_8_NPC4_text2
	msgbox Radiantia_8_8_NPC4_text3 MSG_NORMAL
	end

.global EventScript_Radiantia_8_8_NPC5
EventScript_Radiantia_8_8_NPC5:
	trainerbattle0 0x0 0x35 0x0 Radiantia_8_8_NPC5_text1 Radiantia_8_8_NPC5_text2
	msgbox Radiantia_8_8_NPC5_text3 MSG_NORMAL
	end
	
.global EventScript_Radiantia_8_8_NPC6
EventScript_Radiantia_8_8_NPC6:
	lock
	checkflag 0x821
	if 0x1 _goto EventScript_Radiantia_8_8_NPC6_P3
	checkflag 0x972
	if 0x1 _goto EventScript_Radiantia_8_8_NPC6_P0
	showpokepic 0x3C0 0x0 0x6
	msgbox Radiantia_8_8_NPC6_text1 MSG_NORMAL
	special 0x15A
	pause 0x2E
	faceplayer
	showpokepic 0x3C0 0x0 0x6
	msgbox Radiantia_8_8_NPC6_text2 MSG_NORMAL
	special 0x15A
	setflag 0x972
	pause 0x1E
	msgbox Radiantia_8_8_NPC6_text3 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Radiantia_8_8_NPC6_P2
	if 0x0 _goto EventScript_Radiantia_8_8_NPC6_P1
	release
	end

	EventScript_Radiantia_8_8_NPC6_P0:
		msgbox Radiantia_8_8_NPC6_text3 MSG_YESNO
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Radiantia_8_8_NPC6_P2
		if 0x0 _goto EventScript_Radiantia_8_8_NPC6_P1
		release
		end

	EventScript_Radiantia_8_8_NPC6_P1:
		showpokepic 0x3C0 0x0 0x6
		msgbox Radiantia_8_8_NPC6_text8 MSG_NORMAL
		special 0x15A	
		release
		end

	EventScript_Radiantia_8_8_NPC6_P2:
		pause 0x1E
		showpokepic 0x3C0 0x0 0x6
		msgbox Radiantia_8_8_NPC6_text4 MSG_NORMAL
		special 0x15A
		setvar 0x503A 0x2 
		setvar 0x503B 0x0
		//trainer ID missing
		trainerbattle3 0x3 0x36 0x100 Radiantia_8_8_NPC6_text5
		fadedefault
		pause 0x1E
		showpokepic 0x3C0 0x0 0x6
		msgbox Radiantia_8_8_NPC6_text6 MSG_NORMAL
		special 0x15A
		pause 0x1E
		showpokepic 0x3C0 0x0 0x6
		msgbox Radiantia_8_8_NPC6_text7 MSG_NORMAL
		special 0x15A
		setflag 0x821
		settrainerflag 0x30
		settrainerflag 0x31
		settrainerflag 0x32
		settrainerflag 0x33
		settrainerflag 0x34
		settrainerflag 0x35
		setvar 0x8008 0x2
		setvar 0x4060 0x6
		setvar 0x4061 0x0
		setvar 0x4051 0x35
		giveitem 0x148 0x1 MSG_OBTAIN
		warpmuted 0x8 0x8 0xFF 0x0C 0x0F
		release
		end

	EventScript_Radiantia_8_8_NPC6_P3:
		showpokepic 0x3C0 0x0 0x6
		msgbox Radiantia_8_8_NPC6_text9 MSG_NORMAL
		special 0x15A
		release
		end