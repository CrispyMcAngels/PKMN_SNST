.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"
.include "../asm_defines.s"

@Trainer IDs (84-88): each monk has its own flag
.equ MONK_1, 0x54 @Fratello Tramontana
.equ MONK_2, 0x55 @Sorella Levante
.equ MONK_3, 0x56 @Fratello Libeccio
.equ MONK_4, 0x57 @Sorella Ponente
.equ MONK_5, 0x58 @Fratello Maestrale
.equ FLAG_WIND_STATUE_OPEN, 0x9A1
.equ VAR_WIND_STATUE, 0x406D @1 = the last monk was just beaten, the statue opens after the warp; 2 = done

//___LEVEL___

.global gMapScripts_Santuario_del_Vento_1_60
gMapScripts_Santuario_del_Vento_1_60:
	mapscript MAP_SCRIPT_ON_LOAD Santuario_del_Vento_1_60_OnLoad
	mapscript MAP_SCRIPT_ON_FRAME_TABLE Santuario_del_Vento_1_60_OnFrameTable
	.byte MAP_SCRIPT_TERMIN

@setmaptile isn't saved: once opened, the statue is redrawn open every time the map loads
Santuario_del_Vento_1_60_OnLoad:
	setvar 0x5041 0x0
	setvar 0x5007 0x18
	checkflag FLAG_WIND_STATUE_OPEN
	if 0x1 _call Santuario_del_Vento_1_60_OpenStatueTiles
	end

Santuario_del_Vento_1_60_OnFrameTable:
	levelscript VAR_WIND_STATUE, 0x1, Santuario_del_Vento_1_60_StatueOpens
	.hword MAP_SCRIPT_TERMIN

@After the warp from the last monk (see CheckMonks): the invisible player is the camera in front of the statue.
@Once the hands are open, the player gets their sprite back and returns where they beat the last monk
Santuario_del_Vento_1_60_StatueOpens:
	lockall
	pause 0x1E
	sound 0xE3 @SE_EARTHQUAKE: the statue moves
	setvar 0x8004 0x0
	setvar 0x8005 0x4
	setvar 0x8006 0xC
	setvar 0x8007 0x3
	special 0x136
	pause 0x30
	call Santuario_del_Vento_1_60_OpenStatueTiles
	special 0x8E @Redraw the map: the hands open on screen
	setflag FLAG_WIND_STATUE_OPEN
	setvar VAR_WIND_STATUE 0x2
	sound 0x7D @A gust from the stairs
	pause 0x30
	msgbox Santuario_del_Vento_1_60_Statue_text MSG_NORMAL
	closeonkeypress
	setvar 0x501F 0x100 @Back to the player's own sprite; the outfit colour comes from var 0x4068
	warpmuted 0x1 0x3C 0xFF 0x8008 0x8009 @Back where the player was (saved in CheckMonks)
	waitstate
	releaseall
	end

@The hands of the statue open on the staircase up: (18,14) is warp W1 to 1.61
Santuario_del_Vento_1_60_OpenStatueTiles:
	setmaptile 0x11 0xd 0x26a 0x1 @(17,13) 618
	setmaptile 0x12 0xd 0x273 0x1 @(18,13) 627
	setmaptile 0x13 0xd 0x26b 0x1 @(19,13) 619
	setmaptile 0x11 0xe 0x268 0x1 @(17,14) 616
	setmaptile 0x12 0xe 0x27b 0x0 @(18,14) 635, walkable
	setmaptile 0x13 0xe 0x274 0x1 @(19,14) 628
	setmaptile 0x10 0xf 0x270 0x1 @(16,15) 624
	setmaptile 0x11 0xf 0x272 0x1 @(17,15) 626
	setmaptile 0x12 0xf 0x27b 0x0 @(18,15) 620, walkable
	setmaptile 0x13 0xf 0x27c 0x1 @(19,15) 636
	setmaptile 0x14 0xf 0x276 0x1 @(20,15) 630
	setmaptile 0x10 0x10 0x278 0x0 @(16,16) 632, walkable
	setmaptile 0x11 0x10 0x279 0x0 @(17,16) 633, walkable
	setmaptile 0x12 0x10 0x27a 0x0 @(18,16) 634, walkable
	setmaptile 0x13 0x10 0x27d 0x0 @(19,16) 637, walkable
	setmaptile 0x14 0x10 0x27e 0x0 @(20,16) 638, walkable
	return

//___NPCs___

@The Monaci del Vento: once all five are beaten, in any order, the statue opens.
@trainerbattle2, not 1: type 1 is the Gym Leader one (no spotting music, and it mixes up two monks spotting the player at once)

@Fratello Tramontana
.global EventScript_Santuario_del_Vento_1_60_Monk1
EventScript_Santuario_del_Vento_1_60_Monk1:
	trainerbattle2 0x2 MONK_1 0x0 Santuario_del_Vento_1_60_Monk1_text1 Santuario_del_Vento_1_60_Monk1_text2 Santuario_del_Vento_1_60_CheckMonks
	msgbox Santuario_del_Vento_1_60_Monk1_text3 MSG_NORMAL
	end

@Sorella Levante
.global EventScript_Santuario_del_Vento_1_60_Monk2
EventScript_Santuario_del_Vento_1_60_Monk2:
	trainerbattle2 0x2 MONK_2 0x0 Santuario_del_Vento_1_60_Monk2_text1 Santuario_del_Vento_1_60_Monk2_text2 Santuario_del_Vento_1_60_CheckMonks
	msgbox Santuario_del_Vento_1_60_Monk2_text3 MSG_NORMAL
	end

@Fratello Libeccio
.global EventScript_Santuario_del_Vento_1_60_Monk3
EventScript_Santuario_del_Vento_1_60_Monk3:
	trainerbattle2 0x2 MONK_3 0x0 Santuario_del_Vento_1_60_Monk3_text1 Santuario_del_Vento_1_60_Monk3_text2 Santuario_del_Vento_1_60_CheckMonks
	msgbox Santuario_del_Vento_1_60_Monk3_text3 MSG_NORMAL
	end

@Sorella Ponente
.global EventScript_Santuario_del_Vento_1_60_Monk4
EventScript_Santuario_del_Vento_1_60_Monk4:
	trainerbattle2 0x2 MONK_4 0x0 Santuario_del_Vento_1_60_Monk4_text1 Santuario_del_Vento_1_60_Monk4_text2 Santuario_del_Vento_1_60_CheckMonks
	msgbox Santuario_del_Vento_1_60_Monk4_text3 MSG_NORMAL
	end

@Fratello Maestrale
.global EventScript_Santuario_del_Vento_1_60_Monk5
EventScript_Santuario_del_Vento_1_60_Monk5:
	trainerbattle2 0x2 MONK_5 0x0 Santuario_del_Vento_1_60_Monk5_text1 Santuario_del_Vento_1_60_Monk5_text2 Santuario_del_Vento_1_60_CheckMonks
	msgbox Santuario_del_Vento_1_60_Monk5_text3 MSG_NORMAL
	end

@After each win. When the last monk falls, the shrine rumbles and the player, made invisible, is warped in front of
@the statue, where the map's frame script opens it: nothing heavy runs inside the battle's own script
Santuario_del_Vento_1_60_CheckMonks:
	checktrainerflag MONK_1
	if 0x0 _goto Santuario_del_Vento_1_60_NotYet
	checktrainerflag MONK_2
	if 0x0 _goto Santuario_del_Vento_1_60_NotYet
	checktrainerflag MONK_3
	if 0x0 _goto Santuario_del_Vento_1_60_NotYet
	checktrainerflag MONK_4
	if 0x0 _goto Santuario_del_Vento_1_60_NotYet
	checktrainerflag MONK_5
	if 0x0 _goto Santuario_del_Vento_1_60_NotYet
	pause 0x1E
	sound 0xE3 @SE_EARTHQUAKE: something moves in the shrine
	pause 0x40
	getplayerpos 0x8008 0x8009 @Where to come back after the statue opens: special vars survive a warp
	setvar VAR_WIND_STATUE 0x1
	setvar 0x501F 0x12E @Invisible player: after the warp it only acts as the camera
	warpmuted 0x1 0x3C 0xFF 0x12 0x11 @In front of the statue, (18,17)
	waitstate
	releaseall
	end

Santuario_del_Vento_1_60_NotYet:
	releaseall
	end
