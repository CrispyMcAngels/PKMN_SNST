.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//NPCS____________________


.global EventScript_Ardesiopoli_6_9_NPC1
EventScript_Ardesiopoli_6_9_NPC1:
	lock
	faceplayer
	msgbox Ardesiopoli_6_9_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_9_NPC2
EventScript_Ardesiopoli_6_9_NPC2:
	lock
	faceplayer
	msgbox Ardesiopoli_6_9_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_9_NPC4
EventScript_Ardesiopoli_6_9_NPC4:
	lock
	faceplayer
	msgbox Ardesiopoli_6_9_NPC4_text1 MSG_NORMAL
	release
	end

//SIGNS___________________

	.global EventScript_Ardesiopoli_6_9_Sign0
	EventScript_Ardesiopoli_6_9_Sign0:
		msgbox Ardesiopoli_6_9_Sign0_text1 0x7
		end

	.global EventScript_Ardesiopoli_6_9_Sign12
	EventScript_Ardesiopoli_6_9_Sign12:
		msgbox Ardesiopoli_6_9_Sign12_text1 0x7
		end

	.global EventScript_Ardesiopoli_6_9_Sign3
	EventScript_Ardesiopoli_6_9_Sign3:
	lock
	msgbox Ardesiopoli_6_9_NPC0_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _call EventScript_Ardesiopoli_6_9_NPC0_YES
	if 0x0 _call EventScript_Ardesiopoli_6_9_NPC0_NO
	release
	end

	EventScript_Ardesiopoli_6_9_NPC0_NO:
		release
		end

	EventScript_Ardesiopoli_6_9_NPC0_YES:
		applymovement 0xFF Ardesiopoli_6_9_NPC0_mov1
		waitmovement 0x0
		pause 0x1e
		msgbox Ardesiopoli_6_9_NPC0_text3 0x7
		pause 0x1E
		sound 0x42
		applymovement 0x1 Ardesiopoli_6_9_NPC0_mov2
		applymovement 0x4 Ardesiopoli_6_9_NPC0_mov2
		waitmovement 0x0
		//dichiarare var che stiamo andando ad Ardesiopoli Sud
		setvar 0x4063 0x0
		setvar 0x405F 0x9
		//assegnazione casuale del posto
		random 0x6
		compare 0x800D 0x0
		if 0x1 _goto M6_20_P_H_SX
		compare 0x800D 0x1
		if 0x1 _goto M6_20_P_H_DX
		compare 0x800D 0x2
		if 0x1 _goto M6_20_P_M_SX
		compare 0x800D 0x3
		if 0x1 _goto M6_20_P_M_DX
		compare 0x800D 0x4
		if 0x1 _goto M6_20_P_L_SX
		compare 0x800D 0x5
		if 0x1 _goto M6_20_P_L_DX
		release
		end

			M6_20_P_H_SX:
				setvar 0x4064 0x0
				warp 0x6 0x14 0xFF 0x5 0x4
				release
				end

			M6_20_P_H_DX:
				setvar 0x4064 0x1
				warp 0x6 0x14 0xFF 0x7 0x4
				release
				end

			M6_20_P_M_SX:
				setvar 0x4064 0x2
				warp 0x6 0x14 0xFF 0x5 0x5
				release
				end

			M6_20_P_M_DX:
				setvar 0x4064 0x3
				warp 0x6 0x14 0xFF 0x7 0x5
				release
				end

			M6_20_P_L_SX:
				setvar 0x4064 0x4
				warp 0x6 0x14 0xFF 0x5 0x7
				release
				end

			M6_20_P_L_DX:
				setvar 0x4064 0x5
				warp 0x6 0x14 0xFF 0x7 0x7
				release
				end


	Ardesiopoli_6_9_NPC0_mov1:
		.byte 0x11
		.byte 0x60
		.byte 0xFE

	Ardesiopoli_6_9_NPC0_mov2:
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0xFE

//TILES

.global EventScript_Ardesiopoli_6_9_tile0
EventScript_Ardesiopoli_6_9_tile0:
	lockall
	checkflag 0x12
	if 0x1 _goto EventScript_Ardesiopoli_6_9_tile0_P2
	setmaptile 0x3 0x0C 0x35E 0x1
	setmaptile 0x4 0x0C 0x2AA 0x0
	setmaptile 0x5 0x0C 0x35F 0x1
	special 0x8e
	sound 0x12
	msgbox Ardesiopoli_6_7_NPC0_text2a 0x7
	setflag 0x12
	releaseall
	end

	EventScript_Ardesiopoli_6_9_tile0_P2:
		setmaptile 0x3 0x0C 0x2A9 0x1
		setmaptile 0x4 0x0C 0x35A 0x1
		setmaptile 0x5 0x0C 0x2AB 0x1
		special 0x8e
		sound 0x12
		clearflag 0x12
		releaseall
		end


.global EventScript_Ardesiopoli_6_9_tile1
EventScript_Ardesiopoli_6_9_tile1:
	lockall
	checkflag 0x12
	if 0x1 _goto EventScript_Ardesiopoli_6_9_tile1_P1
	setmaptile 0x3 0x0C 0x35E 0x1
	setmaptile 0x4 0x0C 0x2AA 0x0
	setmaptile 0x5 0x0C 0x35F 0x1
	special 0x8e
	setflag 0x12
	sound 0x12
	releaseall
	end

	EventScript_Ardesiopoli_6_9_tile1_P1:
		setmaptile 0x3 0x0C 0x2A9 0x1
		setmaptile 0x4 0x0C 0x35A 0x1
		setmaptile 0x5 0x0C 0x2AB 0x1
		special 0x8e
		sound 0x12
		clearflag 0x12
		releaseall
		end	
