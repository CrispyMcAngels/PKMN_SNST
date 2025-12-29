.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//LEVELS__________________

.global gMapScripts_Ardesiopoli_6_11
gMapScripts_Ardesiopoli_6_11:
	mapscript MAP_SCRIPT_ON_LOAD Ardesiopoli_6_11_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Ardesiopoli_6_11_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Ardesiopoli_6_11_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Ardesiopoli_6_11_MapScriptOnLoad:
		setworldmapflag 0x892
		sethealingplace 0x3
		compare 0x405F 0x7
		if 0x1 _call Ardesiopoli_6_11_MapScriptOnLoad_move_shinx2		
		compare 0x405F 0x8
		if 0x1 _call Ardesiopoli_6_11_MapScriptOnLoad_move_shinx2
		end		

		Ardesiopoli_6_11_MapScriptOnLoad_move_shinx2:
			movesprite2 0x1 0x08 0x06
			spritebehave 0x1 0x8
			movesprite2 0x2 0x09 0x06
			spritebehave 0x2 0x2
			movesprite2 0x4 0x0 0x0
			return

	Ardesiopoli_6_11_MapScriptOnWarpIntoMapTable:
	levelscript 0x4050, 8, Ardesiopoli_6_11_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN

		Ardesiopoli_6_11_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end

		Ardesiopoli_6_11_MapScriptOnFrame:
		levelscript 0x4050, 8, Ardesiopoli_6_11_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Ardesiopoli_6_11_MapScriptOnFrameBegin:
			lockall
			compare 0x405F 0x7
			if 0x1 _call Ardesiopoli_6_11_MapScriptOnFrame_Part1
			compare 0x405F 0x8
			if 0x1 _call Ardesiopoli_6_11_MapScriptOnFrame_Part2
			releaseall
			end

		Ardesiopoli_6_11_MapScriptOnFrame_Part1:
			spritebehave 0x1 0x0 
			spritebehave 0x2 0x0 
			textcolor 0x1
			msgbox Ardesiopoli_6_11_MapScriptOnFrame_text1 MSG_NORMAL
			pause 0x1E
			spritebehave 0x1 0x0 
			spritebehave 0x2 0x0 
			textcolor 0x2
			spritebehave 0x1 0x0 
			spritebehave 0x2 0x0 
			giveitem 0x10D 0x1 MSG_OBTAIN
			setvar 0x405F 0x8
			warpmuted 0x6 0xB 0xFF 0x08 0x07
			releaseall
			end


		Ardesiopoli_6_11_MapScriptOnFrame_Part2:
			spritebehave 0x1 0x0 
			spritebehave 0x2 0x0 
			pause 0x1E
			textcolor 0x1
			msgbox Ardesiopoli_6_11_MapScriptOnFrame_text2 MSG_NORMAL
			pause 0x1E
			spritebehave 0x1 0x0 
			spritebehave 0x2 0x0 
			fanfare 0x0103
			textcolor 0x2
			msgbox Mission_Completed_text1 MSG_NORMAL
			setflag 0x96A
			setflag 0x02E
			setvar 0x4050 0x2
			setvar 0x4053 0x5
			releaseall
			end
			

//NPCS____________________

.global EventScript_Ardesiopoli_6_11_NPC0
EventScript_Ardesiopoli_6_11_NPC0:
	lock
	faceplayer
	checkflag 0x96A
	if 0x1 _goto EventScript_Ardesiopoli_6_11_NPC0_P2
	checkflag 0x969
	if 0x1 _goto EventScript_Ardesiopoli_6_11_NPC0_P1
	msgbox Ardesiopoli_6_11_NPC0_text1 MSG_NORMAL
	faceplayer
	setvar 0x405F 0x1 
	setvar 0x4053 0x4
	setflag 0x969
	clearflag 0x02E
	fanfare 0x0102
	textcolor 0x2
	msgbox Mission_Received_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_11_NPC0_P1:
		faceplayer
		msgbox Ardesiopoli_6_11_NPC0_text2 MSG_NORMAL
		release
		end

	EventScript_Ardesiopoli_6_11_NPC0_P2:
		faceplayer
		msgbox Ardesiopoli_6_11_NPC0_text3 MSG_NORMAL
		release
		end

.global EventScript_Ardesiopoli_6_11_NPC1
EventScript_Ardesiopoli_6_11_NPC1:
	lock
	faceplayer
	cry 0x1c8 0x0
	msgbox Ardesiopoli_6_11_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_11_NPC2
EventScript_Ardesiopoli_6_11_NPC2:
	lock
	faceplayer
	msgbox Ardesiopoli_6_11_NPC2_text1 MSG_NORMAL
	release
	end


.global EventScript_Ardesiopoli_6_11_Sign0
EventScript_Ardesiopoli_6_11_Sign0:
	msgbox Ardesiopoli_6_11_Sign0_text1 0x7
	end