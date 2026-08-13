.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//NPCS____________________

.global EventScript_Ardesiopoli_6_10_NPC0
EventScript_Ardesiopoli_6_10_NPC0:
	lock
	faceplayer
	msgbox Ardesiopoli_6_10_NPC0_text1 MSG_NORMAL
	release
	end


.global EventScript_Ardesiopoli_6_10_NPC1
EventScript_Ardesiopoli_6_10_NPC1:
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


.global EventScript_Ardesiopoli_6_10_NPC2
EventScript_Ardesiopoli_6_10_NPC2:
	lock
	faceplayer
	cry 0x1c8 0x0
	msgbox Ardesiopoli_6_11_NPC1_text1 MSG_NORMAL
	release
	end


//LEVELS__________________

.global gMapScripts_Ardesiopoli_6_10
gMapScripts_Ardesiopoli_6_10:
	mapscript MAP_SCRIPT_ON_LOAD Ardesiopoli_6_10_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Ardesiopoli_6_10_MapScriptOnWarpIntoMapTable
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Ardesiopoli_6_10_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Ardesiopoli_6_10_MapScriptOnLoad:
		setworldmapflag 0x892
		sethealingplace 0x3
		compare 0x405F 0x7
		if 0x1 _call Ardesiopoli_6_10_MapScriptOnLoad_move_shinx2		
		compare 0x405F 0x8
		if 0x1 _call Ardesiopoli_6_10_MapScriptOnLoad_move_shinx3
		end		

		Ardesiopoli_6_10_MapScriptOnLoad_move_shinx2:
			movesprite2 0x2 0x07 0x0B
			spritebehave 0x2 0x8
			movesprite2 0x3 0x08 0x0B
			spritebehave 0x3 0x8
			return	

		Ardesiopoli_6_10_MapScriptOnLoad_move_shinx3:
			movesprite2 0x3 0x03 0x09
			spritebehave 0x3 0x3
			return


	Ardesiopoli_6_10_MapScriptOnWarpIntoMapTable:
	levelscript 0x4050, 8, Ardesiopoli_6_10_MapScriptOnWarpIntoMapTableBegin
	.hword MAP_SCRIPT_TERMIN

		Ardesiopoli_6_10_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x2
			end

		Ardesiopoli_6_10_MapScriptOnFrame:
		levelscript 0x4050, 8, Ardesiopoli_6_10_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Ardesiopoli_6_10_MapScriptOnFrameBegin:
			lockall
			compare 0x405F 0x7
			if 0x1 _call Ardesiopoli_6_10_MapScriptOnFrame_Part1
			releaseall
			end

		Ardesiopoli_6_10_MapScriptOnFrame_Part1:
			spritebehave 0x2 0x0 
			spritebehave 0x3 0x0 
			
			msgbox Ardesiopoli_6_11_MapScriptOnFrame_text1 MSG_NORMAL
			pause 0x1E
			spritebehave 0x2 0x0 
			spritebehave 0x3 0x0 
			giveitem 0x10D 0x1 MSG_OBTAIN
			spritebehave 0x2 0x0 
			spritebehave 0x3 0x0  
			pause 0x1E
			
			msgbox Ardesiopoli_6_11_MapScriptOnFrame_text2 MSG_NORMAL
			pause 0x1E
			spritebehave 0x2 0x0 
			spritebehave 0x3 0x0  
			fanfare 0x0103
			
			msgbox Mission_Completed_text1 MSG_NORMAL
			setflag 0x02E
			setvar 0x4050 0x2
			setvar 0x4053 0x5
			setvar 0x405F 0x8
			releaseall
			end