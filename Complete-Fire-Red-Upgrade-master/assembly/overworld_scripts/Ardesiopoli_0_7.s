.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"



//NPCS____________________

//__1_cuoco2
.global EventScript_Ardesiopoli_0_7_NPC1
EventScript_Ardesiopoli_0_7_NPC1:
	lock
	faceplayer
	checkflag 0x96E
	if 0x1 _goto EventScript_Ardesiopoli_0_7_NPC1_P3
	checkflag 0x96D
	if 0x1 _goto EventScript_Ardesiopoli_0_7_NPC1_P1
	applymovement 0x2 EventScript_Ardesiopoli_0_7_NPC1_mov1
	waitmovement 0x0 
	msgbox Ardesiopoli_0_7_NPC1_text1 MSG_NORMAL
	pause 0x1E
	fanfare 0x0102
	textcolor 0x2
	msgbox Mission_Received_text1 MSG_NORMAL
	setflag 0x96D
	release
	end

	EventScript_Ardesiopoli_0_7_NPC1_mov1:
		.byte 0x1C
		.byte 0x62
		.byte 0x1B
		.byte 0xFE

	EventScript_Ardesiopoli_0_7_NPC1_P1:
		checkitem 0x68 0x1
		compare 0x800D 0x4
		if 0x1 _goto EventScript_Ardesiopoli_0_7_NPC1_P2
		msgbox Ardesiopoli_0_7_NPC1_text2 MSG_NORMAL
		release
		end

	EventScript_Ardesiopoli_0_7_NPC1_P2:
		msgbox Ardesiopoli_0_7_NPC1_text3 MSG_NORMAL
		pause 0x1E
		fanfare 0x0103
		textcolor 0x2
		msgbox Mission_Completed_text1 MSG_NORMAL
		setflag 0x96E
		pause 0x1E
		msgbox Ardesiopoli_0_7_NPC1_text4 MSG_NORMAL
		giveitem 0x60 0x1 MSG_OBTAIN
		pause 0x1E
		warpmuted 0x0 0x7 0xFF 0x0B 0x07
		release
		end

	EventScript_Ardesiopoli_0_7_NPC1_P3:
		msgbox Ardesiopoli_0_7_NPC1_text5 MSG_NORMAL
		release
		end


//__2_cameriere
.global EventScript_Ardesiopoli_0_7_NPC2
EventScript_Ardesiopoli_0_7_NPC2:
	lock
	faceplayer
	msgbox Ardesiopoli_0_7_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_0_7_NPC3
EventScript_Ardesiopoli_0_7_NPC3:
	lock
	faceplayer
	msgbox Ardesiopoli_0_7_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_0_7_NPC4
EventScript_Ardesiopoli_0_7_NPC4:
	lock
	faceplayer
	msgbox Ardesiopoli_0_7_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_0_7_NPC5
EventScript_Ardesiopoli_0_7_NPC5:
	lock
	faceplayer
	msgbox Ardesiopoli_0_7_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_0_7_NPC6
EventScript_Ardesiopoli_0_7_NPC6:
	lock
	faceplayer
	msgbox Ardesiopoli_0_7_NPC6_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_0_7_NPC7
EventScript_Ardesiopoli_0_7_NPC7:
	lock
	faceplayer
	msgbox Ardesiopoli_0_7_NPC7_text1 MSG_NORMAL
	release
	end