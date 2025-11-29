.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___TILES____

.global EventScript_GrtVentiSuss_1_36_tile0
EventScript_GrtVentiSuss_1_36_tile0:
	lockall
	pause 0x1E
	sound 0x5
	applymovement 0x1 GrtVentiSuss_1_36_tile0_mov0
	waitmovement 0x1
	cry 0xB2 0x0
	msgbox Percorso3_3_21_tile0_text1 MSG_NORMAL
	pause 0x1E
	applymovement 0x1 GrtVentiSuss_1_36_tile0_mov1
	waitmovement 0x1
	movesprite2 0x1 0x0 0x0	
	movesprite 0x1 0x0 0x0
	setvar 0x4051 0x39
	releaseall
	end
	
	GrtVentiSuss_1_36_tile0_mov0:
		.byte 0x0
		.byte 0x1C
		.byte 0x62
		.byte 0xFE

	GrtVentiSuss_1_36_tile0_mov1:
		.byte 0x1E
		.byte 0x1F
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x1D
		.byte 0x20
		.byte 0x1D
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0x1E
		.byte 0x1E
		.byte 0x60
		.byte 0xFE


//___MAP_SCRIPT___

.global gMapScripts_GrtVentiSuss_1_36
gMapScripts_GrtVentiSuss_1_36:
	mapscript MAP_SCRIPT_ON_LOAD gMapScripts_GrtVentiSuss_1_36_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

		gMapScripts_GrtVentiSuss_1_36_MapScriptOnLoad:
			setvar 0x5007 0x7
			compare 0x4052 0x5
			if 0x1 _call GrtVentiSuss_1_36_MapScriptOnLoad_CloseGrotta
			compare 0x4051 0x38
			if 0x1 _call GrtVentiSuss_1_36_MapScriptOnLoad_Xatu1
			end

			GrtVentiSuss_1_36_MapScriptOnLoad_CloseGrotta:
				setmaptile 0x22 0x15 0x011 0x1
				setmaptile 0x23 0x15 0x011 0x1
				setmaptile 0x24 0x15 0x011 0x1
				setmaptile 0x22 0x16 0x019 0x1
				setmaptile 0x23 0x16 0x019 0x1
				setmaptile 0x24 0x16 0x019 0x1
				setmaptile 0x22 0x17 0x00C 0x0
				setmaptile 0x24 0x17 0x001 0x0
				return

			GrtVentiSuss_1_36_MapScriptOnLoad_Xatu1:
				movesprite2 0x1 0x0E 0x1B
				return


.global EventScript_GrtVentiSuss_1_36_NPC1
EventScript_GrtVentiSuss_1_36_NPC1:
	lock
	faceplayer
	special2 0x800D 0x2B
	//waitkeypress
	//special 0x2B
	compare 0x800D 0x1
	if 0x1 _goto EventScript_GrtVentiSuss_1_36_NPC1_A
	compare 0x800D 0x2
	if 0x1 _goto EventScript_GrtVentiSuss_1_36_NPC1_B
	if 0x0 _goto EventScript_GrtVentiSuss_1_36_NPC1
	release
	end

	EventScript_GrtVentiSuss_1_36_NPC1_A:
		msgbox Percorso3_3_21_NPC1_A MSG_NORMAL
		release
		end

	EventScript_GrtVentiSuss_1_36_NPC1_B:
		msgbox Percorso3_3_21_NPC1_B MSG_NORMAL
		release
		end



.global EventScript_GrtVentiSuss_1_36_NPC2
EventScript_GrtVentiSuss_1_36_NPC2:
	lock
	faceplayer
	special2 0x800D 0x2C
	compare 0x800D 0x3
	if 0x1 _goto EventScript_GrtVentiSuss_1_36_NPC2_DOWN
	compare 0x800D 0x1
	if 0x1 _goto EventScript_GrtVentiSuss_1_36_NPC2_UP
	if 0x0 _goto EventScript_GrtVentiSuss_1_36_NPC2
	release
	end

	EventScript_GrtVentiSuss_1_36_NPC2_DOWN:
		msgbox Percorso3_3_21_NPC2_DOWN MSG_NORMAL
		release
		end

	EventScript_GrtVentiSuss_1_36_NPC2_UP:
		msgbox Percorso3_3_21_NPC2_UP MSG_NORMAL
		release
		end