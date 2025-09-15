.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//NPCS____________________

.global EventScript_Ardesiopoli_6_5_NPC0
EventScript_Ardesiopoli_6_5_NPC0:
	lock
	faceplayer
	cry 0x186 0x0
	msgbox Ardesiopoli_6_5_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_5_NPC1
EventScript_Ardesiopoli_6_5_NPC1:
	lock
	faceplayer
	checkflag 0x820
	if 0x1 _goto EventScript_Ardesiopoli_6_5_NPC1_P1
	msgbox Ardesiopoli_6_5_NPC1_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_5_NPC1_P1:
		msgbox Ardesiopoli_6_5_NPC1_text2 MSG_NORMAL
		release
		end


.global EventScript_Ardesiopoli_6_5_NPC3
EventScript_Ardesiopoli_6_5_NPC3:
	lock
	faceplayer
	checkflag 0x820
	if 0x1 _goto EventScript_Ardesiopoli_6_5_NPC3_P1
	msgbox Ardesiopoli_6_5_NPC3_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_5_NPC3_P1:
		msgbox Ardesiopoli_6_5_NPC3_text2 MSG_NORMAL
		release
		end


.global EventScript_Ardesiopoli_6_5_NPC4
EventScript_Ardesiopoli_6_5_NPC4:
	lock
	faceplayer
	checkflag 0x820
	if 0x1 _goto EventScript_Ardesiopoli_6_5_NPC3_P1
	msgbox Ardesiopoli_6_5_NPC4_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_5_NPC4_P1:
		msgbox Ardesiopoli_6_5_NPC4_text2 MSG_NORMAL
		release
		end

.global EventScript_Ardesiopoli_6_5_NPC5
EventScript_Ardesiopoli_6_5_NPC5:
	lock
	faceplayer
	msgbox Ardesiopoli_6_5_NPC5_text1 MSG_NORMAL
	release
	end