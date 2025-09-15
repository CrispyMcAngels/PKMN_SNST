.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//SIGNS___________________

	.global EventScript_Stellavia_10_19_Sign0
	EventScript_Stellavia_10_19_Sign0:
	lock
	msgbox Ardesiopoli_6_9_NPC0_text1 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _call EventScript_Stellavia_10_19_Sign0_YES
	if 0x0 _call EventScript_Stellavia_10_19_Sign0_NO
	release
	end

	EventScript_Stellavia_10_19_Sign0_NO:
		release
		end

	EventScript_Stellavia_10_19_Sign0_YES:
		applymovement 0xFF Stellavia_10_19_Sign0_mov1
		waitmovement 0x0
		pause 0x1e
		msgbox Ardesiopoli_6_9_NPC0_text3 0x7
		pause 0x1E
		sound 0x42
		applymovement 0x1 Stellavia_10_19_Sign0_mov2
		applymovement 0x4 Stellavia_10_19_Sign0_mov2
		waitmovement 0x0
		//dichiarare var che stiamo andando ad Ardesiopoli Sud 2
		setvar 0x4063 0x3
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


	Stellavia_10_19_Sign0_mov1:
		.byte 0x11
		.byte 0x60
		.byte 0xFE

	Stellavia_10_19_Sign0_mov2:
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
