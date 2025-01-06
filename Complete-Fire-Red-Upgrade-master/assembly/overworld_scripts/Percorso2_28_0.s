.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Percorso_2_28_0_NPC0
EventScript_Percorso_2_28_0_NPC0:
	lock
	faceplayer
	msgbox Percorso_2_28_0_NPC0_text1 0x7
	release
	end

.global EventScript_Percorso_2_28_0_Sign0
EventScript_Percorso_2_28_0_Sign0:
	msgbox Percorso_2_28_0_Sign0_text1 MSG_SIGN
	end

.global EventScript_Percorso_2_28_0_Sign2
EventScript_Percorso_2_28_0_Sign2:
	lockall
	msgbox Percorso_2_28_0_Sign2_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Percorso_2_28_0_Sign2_yes
	if 0x0 _goto EventScript_Percorso_2_28_0_Sign2_no
	releaseall
	end

	EventScript_Percorso_2_28_0_Sign2_yes:
		checkitem 0x98 0x1 
		compare 0x800D 0x1 
		if 0x1 _call No_berries_28_0
		if 0x0 _call Give_berries_28_0
		releaseall
		end

		No_berries_28_0:
			msgbox Percorso_2_28_0_Sign2_text2 0x7
			releaseall
			end

		Give_berries_28_0:
			giveitem 0x98 0x1 MSG_OBTAIN
			releaseall
			end

	EventScript_Percorso_2_28_0_Sign2_no:
		releaseall
		end