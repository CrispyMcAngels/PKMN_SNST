.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//SIGNS___________________

	.global EventScript_Ardesiopoli_6_18_Sign0
	EventScript_Ardesiopoli_6_18_Sign0:
		msgbox Ardesiopoli_6_18_Sign0_text1 0x7
		end

//LEVELS__________________

.global gMapScripts_Ardesiopoli_6_18
gMapScripts_Ardesiopoli_6_18:
	mapscript MAP_SCRIPT_ON_LOAD Ardesiopoli_6_18_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

		Ardesiopoli_6_18_MapScriptOnLoad:
			compare 0x405F 0x4
			if 0x1 _call Ardesiopoli_6_18_MapScriptOnLoad_move_Shinx
			end

		Ardesiopoli_6_18_MapScriptOnLoad_move_Shinx:
			movesprite2 0x1 0x02 0x0F
			spritebehave 0x1 0x8
			return



//NPCS____________________

.global EventScript_Ardesiopoli_6_18_NPC0
EventScript_Ardesiopoli_6_18_NPC0:
	lock
	faceplayer
	cry 0x1c8 0x0
	msgbox Ardesiopoli_3_2_NPC19_text2 MSG_NORMAL
	compare 0x405F 0x5
	if 0x1 _goto EventScript_Ardesiopoli_6_18_NPC0_P1
	applymovement 0x1 Ardesiopoli_6_18_mov1
	waitmovement 0x1
	movesprite 0x1 0x09 0x08
	movesprite2 0x1 0x09 0x08
	spritebehave 0x1 0x0
	setvar 0x405F 0x5
	release
	end

	Ardesiopoli_6_18_mov1:
		.byte 0x52
		.byte 0x52
		.byte 0x62
		.byte 0x1E
		.byte 0x20
		.byte 0x1E
		.byte 0x1E
		.byte 0x20
		.byte 0x20
		.byte 0x1E
		.byte 0x1E
		.byte 0xFE

	EventScript_Ardesiopoli_6_18_NPC0_P1:
		applymovement 0x1 Ardesiopoli_6_18_mov2
		waitmovement 0x1
		movesprite 0x1 0x0E 0x0C
		movesprite2 0x1 0x0E 0x0C
		hidesprite 0x1 
		sound 0x09
		setvar 0x405F 0x6
		setflag 0x02E
		release
		end

		Ardesiopoli_6_18_mov2:
			.byte 0x62
			.byte 0x20
			.byte 0x20
			.byte 0x1D
			.byte 0x1D
			.byte 0x1D
			.byte 0xFE
