.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Percorso4_16_2
gMapScripts_Percorso4_16_2:
	mapscript MAP_SCRIPT_ON_LOAD Percorso4_16_2_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

		Percorso4_16_2_MapScriptOnLoad:
			setvar 0x5007 0x7
			end



//___NPCs___

.global EventScript_Percorso_4_16_2_NPC0
EventScript_Percorso_4_16_2_NPC0:
	lock
	faceplayer
	checkflag 0x977
	if 0x1 _goto EventScript_Percorso_4_16_2_NPC0_P1
	msgbox Percorso_4_16_2_NPC0_text1 MSG_NORMAL
	pause 0x1E
	msgbox Percorso_4_16_2_NPC0_text2 MSG_NORMAL
	pause 0x1E
	giveitem 0x21 0x1 MSG_OBTAIN
	setflag 0x977
	release
	end

	EventScript_Percorso_4_16_2_NPC0_P1:
		msgbox Percorso_4_16_2_NPC0_text2 MSG_NORMAL
		release
		end


.global EventScript_Percorso_4_16_2_NPC1
EventScript_Percorso_4_16_2_NPC1:
	//avventuriero
	trainerbattle0 0x0 0x38 0x0 Percorso_4_16_2_NPC1_text1 Percorso_4_16_2_NPC1_text2
	msgbox Percorso_4_16_2_NPC1_text3 MSG_NORMAL
	release
	end