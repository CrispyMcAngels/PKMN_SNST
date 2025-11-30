.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//MAP___________

.global gMapScripts_Ardesiopoli_6_7
gMapScripts_Ardesiopoli_6_7:
	mapscript MAP_SCRIPT_ON_LOAD Ardesiopoli_6_7_MapScriptOnLoad
    .byte MAP_SCRIPT_TERMIN

	Ardesiopoli_6_7_MapScriptOnLoad:
		compare 0x4051 0x35
		if 0x2 _call Ardesiopoli_6_7_MapScriptOnLoad_P1
		end

		Ardesiopoli_6_7_MapScriptOnLoad_P1:
			setmaptile 0x05 0x0B 0x2A9 0x1
			setmaptile 0x06 0x0B 0x35A 0x1
			setmaptile 0x07 0x0B 0x2AB 0x1
			setmaptile 0x05 0x0C 0x28F 0x0
			setmaptile 0x06 0x0C 0x28F 0x0
			setmaptile 0x07 0x0C 0x28F 0x0
			setmaptile 0x05 0x0A 0x307 0x0
			setmaptile 0x06 0x0A 0x30F 0x0
			setmaptile 0x07 0x0A 0x317 0x0
			movesprite2 0x2 0x03 0x05
			return


//SIGNS___________________

	.global EventScript_Ardesiopoli_6_7_Sign0
	EventScript_Ardesiopoli_6_7_Sign0:
		lock
		checkflag 0x96B
		if 0x1 _goto EventScript_Ardesiopoli_6_7_Sign0_P1
		msgbox Ardesiopoli_6_7_Sign0_text1 MSG_NORMAL
		release
		end

		EventScript_Ardesiopoli_6_7_Sign0_P1:
			msgbox Ardesiopoli_6_7_Sign0_text2 MSG_YESNO
			compare 0x800D 0x1
			if 0x1 _goto EventScript_Ardesiopoli_6_7_Sign0_P2
			if 0x0 _goto EventScript_Ardesiopoli_6_7_Sign0_END
			closeonkeypress
			release
			end

			EventScript_Ardesiopoli_6_7_Sign0_END:
			release
			end

			EventScript_Ardesiopoli_6_7_Sign0_P2:
				msgbox Ardesiopoli_6_7_Sign0_text3 MSG_NORMAL
				applymovement 0xFF Ardesiopoli_6_7_Sign0_mov1
				waitmovement 0x0
				warp 0x6 0x8 0xFF 0x3 0x9
				release
				end

				Ardesiopoli_6_7_Sign0_mov1:
					.byte 0x11
					.byte 0x60
					.byte 0xFE

	.global EventScript_Ardesiopoli_6_7_Sign1
	EventScript_Ardesiopoli_6_7_Sign1:
		msgbox Ardesiopoli_6_7_Sign1_text1 0x7
		end

	.global EventScript_Ardesiopoli_6_7_Sign23
	EventScript_Ardesiopoli_6_7_Sign23:
		msgbox Ardesiopoli_6_7_Sign23_text1 0x7
		end

	.global EventScript_Ardesiopoli_6_7_Sign4
	EventScript_Ardesiopoli_6_7_Sign4:
		msgbox Ardesiopoli_6_7_Sign4_text1 0x7
		end

	.global EventScript_Ardesiopoli_6_7_Sign56
	EventScript_Ardesiopoli_6_7_Sign56:
		lock
		msgbox Ardesiopoli_6_7_NPC0_text1 MSG_YESNO
		compare 0x800D 0x1
		if 0x1 _call EventScript_Ardesiopoli_6_7_NPC0_YES
		if 0x0 _call EventScript_Ardesiopoli_6_7_NPC0_NO
		release
		end

		EventScript_Ardesiopoli_6_7_NPC0_NO:
			release
			end

		EventScript_Ardesiopoli_6_7_NPC0_YES:
			checkitem 0x10D 0x1
			compare 0x800D 0x1
			if 0x1 _goto EventScript_Ardesiopoli_6_7_NPC0_YES2
			msgbox Ardesiopoli_6_7_NPC0_text2 MSG_NORMAL
			release
			end

		EventScript_Ardesiopoli_6_7_NPC0_YES2:
			applymovement 0xFF Ardesiopoli_6_7_NPC0_mov1
			waitmovement 0x0
			pause 0x1e
			msgbox Ardesiopoli_6_7_NPC0_text3 0x7
			pause 0x1E
			sound 0x42
			applymovement 0x1 Ardesiopoli_6_7_NPC0_mov2
			applymovement 0xB Ardesiopoli_6_7_NPC0_mov2
			waitmovement 0x0
			//dichiarare var che stiamo andando ad Ardesiopoli Nord
			setvar 0x4063 0x1
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

		Ardesiopoli_6_7_NPC0_mov1:
			.byte 0x11
			.byte 0x60
			.byte 0xFE

		Ardesiopoli_6_7_NPC0_mov2:
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


	.global EventScript_Ardesiopoli_6_7_Sign7
	EventScript_Ardesiopoli_6_7_Sign7:
	lock
	msgbox Ardesiopoli_6_7_sign7_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _call EventScript_Ardesiopoli_6_7_sign7_YES
	if 0x0 _call EventScript_Ardesiopoli_6_7_sign7_NO
	release
	end

	EventScript_Ardesiopoli_6_7_sign7_NO:
		release
		end

	EventScript_Ardesiopoli_6_7_sign7_YES:
		applymovement 0xFF Ardesiopoli_6_7_NPC0_mov1
		waitmovement 0xFF
		pause 0x1e
		msgbox Ardesiopoli_6_7_NPC0_text3 0x7
		pause 0x1E
		sound 0x42
		applymovement 0xA Ardesiopoli_6_9_sign7_mov2
		applymovement 0xC Ardesiopoli_6_9_sign7_mov2
		waitmovement 0xC
		//dichiarare var che stiamo andando ad Ardesiopoli Sud
		setvar 0x4063 0x2
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

		Ardesiopoli_6_9_sign7_mov2:
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0x12
			.byte 0xFE

//TILES

.global EventScript_Ardesiopoli_6_7_tile5
EventScript_Ardesiopoli_6_7_tile5:
	lockall
	checkflag 0x13
	if 0x1 _goto EventScript_Ardesiopoli_6_7_tile5_P2
	checkitem 0x10D 0x1
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Ardesiopoli_6_7_tile5_P1
	sound 0x16
	msgbox Ardesiopoli_6_7_NPC0_text2 0x7
	releaseall
	end

	EventScript_Ardesiopoli_6_7_tile5_P1:
		setmaptile 0x05 0x0B 0x35E 0x1
		setmaptile 0x06 0x0B 0x2AA 0x0
		setmaptile 0x07 0x0B 0x35F 0x1
		special 0x8e
		sound 0x12
		msgbox Ardesiopoli_6_7_NPC0_text2a 0x7
		setflag 0x13
		releaseall
		end

	EventScript_Ardesiopoli_6_7_tile5_P2:
		setmaptile 0x05 0x0B 0x2A9 0x1
		setmaptile 0x06 0x0B 0x35A 0x1
		setmaptile 0x07 0x0B 0x2AB 0x1
		special 0x8e
		sound 0x12
		clearflag 0x13
		releaseall
		end

.global EventScript_Ardesiopoli_6_7_tile6
EventScript_Ardesiopoli_6_7_tile6:
	lockall
	checkflag 0x13
	if 0x1 _goto EventScript_Ardesiopoli_6_7_tile6_P1
	setmaptile 0x05 0x0B 0x35E 0x1
	setmaptile 0x06 0x0B 0x2AA 0x0
	setmaptile 0x07 0x0B 0x35F 0x1
	special 0x8e
	setflag 0x13
	sound 0x12
	releaseall
	end

	EventScript_Ardesiopoli_6_7_tile6_P1:
		setmaptile 0x05 0x0B 0x2A9 0x1
		setmaptile 0x06 0x0B 0x35A 0x1
		setmaptile 0x07 0x0B 0x2AB 0x1
		special 0x8e
		sound 0x12
		clearflag 0x13
		releaseall
		end	


.global EventScript_Ardesiopoli_6_7_tile0a
EventScript_Ardesiopoli_6_7_tile0a:
	lockall
	checkflag 0x12
	if 0x1 _goto EventScript_Ardesiopoli_6_7_tile0a_P2
	checkitem 0x10D 0x1
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Ardesiopoli_6_7_tile0a_P1
	sound 0x16
	msgbox Ardesiopoli_6_7_NPC0_text2 0x7
	releaseall
	end

	EventScript_Ardesiopoli_6_7_tile0a_P1:
		setmaptile 0x19 0x0C 0x35E 0x1
		setmaptile 0x1A 0x0C 0x2AA 0x0
		setmaptile 0x1B 0x0C 0x35F 0x1
		special 0x8e
		sound 0x12
		msgbox Ardesiopoli_6_7_NPC0_text2a 0x7
		setflag 0x12
		releaseall
		end

	EventScript_Ardesiopoli_6_7_tile0a_P2:
		setmaptile 0x19 0x0C 0x2A9 0x1
		setmaptile 0x1A 0x0C 0x35A 0x1
		setmaptile 0x1B 0x0C 0x2AB 0x1
		special 0x8e
		sound 0x12
		clearflag 0x12
		releaseall
		end

.global EventScript_Ardesiopoli_6_7_tile4
EventScript_Ardesiopoli_6_7_tile4:
	lockall
	checkflag 0x12
	if 0x1 _goto EventScript_Ardesiopoli_6_7_tile4_P1
	setmaptile 0x19 0x0C 0x35E 0x1
	setmaptile 0x1A 0x0C 0x2AA 0x0
	setmaptile 0x1B 0x0C 0x35F 0x1
	special 0x8e
	setflag 0x12
	sound 0x12
	releaseall
	end

	EventScript_Ardesiopoli_6_7_tile4_P1:
		setmaptile 0x19 0x0C 0x2A9 0x1
		setmaptile 0x1A 0x0C 0x35A 0x1
		setmaptile 0x1B 0x0C 0x2AB 0x1
		special 0x8e
		sound 0x12
		clearflag 0x12
		releaseall
		end	


.global EventScript_Ardesiopoli_6_7_tile0
EventScript_Ardesiopoli_6_7_tile0:
	lockall
	setanimation 0x0 0x10
	setanimation 0x1 0x0F
	setanimation 0x2 0x0
	doanimation 0x36	
	//applymovement 0x3 Ardesiopoli_6_7_tile0_mov1
	//waitmovement 0x0
	releaseall
	end

	Ardesiopoli_6_7_tile0_mov1:
		.byte 0x3 
		.byte 0x19
		.byte 0x1 
		.byte 0x19
		.byte 0x2 
		.byte 0x1A
		.byte 0x0 
		.byte 0xFE


//NPCS____________________

.global EventScript_Ardesiopoli_6_7_NPC0
EventScript_Ardesiopoli_6_7_NPC0:
	lock
	msgbox Ardesiopoli_6_7_NPC0_text0a MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_7_NPC1
EventScript_Ardesiopoli_6_7_NPC1:
	lock
	faceplayer
	checkflag 0x821
	if 0x1 _goto EventScript_Ardesiopoli_6_7_NPC1_P2
	msgbox Ardesiopoli_6_7_NPC1_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_7_NPC1_P2:
		msgbox Ardesiopoli_6_7_NPC1_text2 MSG_NORMAL
		release
		end


.global EventScript_Ardesiopoli_6_7_NPC2
EventScript_Ardesiopoli_6_7_NPC2:
	lock
	faceplayer
	msgbox Ardesiopoli_6_7_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_7_NPC3
EventScript_Ardesiopoli_6_7_NPC3:
	lock
	faceplayer
	checkflag 0x821
	if 0x1 _goto EventScript_Ardesiopoli_6_7_NPC3_P2
	msgbox Ardesiopoli_6_7_NPC3_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_7_NPC3_P2:
		msgbox Ardesiopoli_6_7_NPC3_text2 MSG_NORMAL
		release
		end

.global EventScript_Ardesiopoli_6_7_NPC4
EventScript_Ardesiopoli_6_7_NPC4:
	lock
	faceplayer
	msgbox Ardesiopoli_6_7_NPC4_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_7_NPC5
EventScript_Ardesiopoli_6_7_NPC5:
	lock
	faceplayer
	msgbox Ardesiopoli_6_7_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Ardesiopoli_6_7_NPC6
EventScript_Ardesiopoli_6_7_NPC6:
	lock
	faceplayer
	msgbox Ardesiopoli_6_7_NPC6_text1 MSG_NORMAL
	release
	end
	
.global EventScript_Ardesiopoli_6_7_NPC7
EventScript_Ardesiopoli_6_7_NPC7:
	lock
	faceplayer
	checkflag 0x821
	if 0x1 _goto EventScript_Ardesiopoli_6_7_NPC7_P2
	msgbox Ardesiopoli_6_7_NPC7_text1 MSG_NORMAL
	release
	end

	EventScript_Ardesiopoli_6_7_NPC7_P2:
		msgbox Ardesiopoli_6_7_NPC7_text2 MSG_NORMAL
		release
		end

.global EventScript_Ardesiopoli_6_7_NPC8
EventScript_Ardesiopoli_6_7_NPC8:
	lock
	faceplayer
	msgbox Ardesiopoli_6_7_NPC8_text1 MSG_NORMAL
	release
	end

//NPC9_TRENO