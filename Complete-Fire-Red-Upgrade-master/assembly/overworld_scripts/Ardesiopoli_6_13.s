.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//SIGNS___________________

	.global EventScript_Ardesiopoli_6_13_Sign0
	EventScript_Ardesiopoli_6_13_Sign0:
		msgbox Ardesiopoli_6_13_Sign0_text1 0x7
		end

	.global EventScript_Ardesiopoli_6_13_Sign1
	EventScript_Ardesiopoli_6_13_Sign1:
		msgbox Ardesiopoli_6_13_Sign1_text1 0x7
		end

//NPCS____________________

.global EventScript_Ardesiopoli_6_13_NPC0
EventScript_Ardesiopoli_6_13_NPC0:
	lock
	faceplayer
	msgbox Ardesiopoli_6_13_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_13_NPC1
EventScript_Ardesiopoli_6_13_NPC1:
	lock
	faceplayer
	msgbox Ardesiopoli_6_13_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_13_NPC2
EventScript_Ardesiopoli_6_13_NPC2:
	lock
	faceplayer
	msgbox Ardesiopoli_6_13_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_13_NPC3
EventScript_Ardesiopoli_6_13_NPC3:
	lock
	faceplayer
	msgbox Ardesiopoli_6_13_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_13_NPC4
EventScript_Ardesiopoli_6_13_NPC4:
	lock
	faceplayer
	msgbox Ardesiopoli_6_13_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_13_NPC5
EventScript_Ardesiopoli_6_13_NPC5:
	lock
	faceplayer
	msgbox Ardesiopoli_6_13_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_13_NPC6
EventScript_Ardesiopoli_6_13_NPC6:
	lock
	faceplayer
	msgbox Ardesiopoli_6_13_NPC6_text1 MSG_NORMAL
	pause 0x1E
	checkflag 0x96F
	if 0x1 _goto EventScript_Ardesiopoli_6_13_NPC6_P2
	msgbox Ardesiopoli_6_13_NPC6_text2 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Ardesiopoli_6_13_NPC6_P1
	msgbox Ardesiopoli_6_13_NPC6_text3 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_13_NPC6_P2:
		release
		end

	EventScript_Ardesiopoli_6_13_NPC6_P1:
		msgbox Ardesiopoli_6_13_NPC6_text4 MSG_NORMAL
		giveitem 0xDD 0x1 MSG_OBTAIN
		setflag 0x96F
		release
		end

.global EventScript_Ardesiopoli_6_13_NPC7
EventScript_Ardesiopoli_6_13_NPC7:
	lock
	faceplayer
	msgbox Ardesiopoli_6_13_NPC7_text1 MSG_NORMAL
	release
	end