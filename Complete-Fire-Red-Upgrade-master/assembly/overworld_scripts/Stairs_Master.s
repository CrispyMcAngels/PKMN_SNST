.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//______Stairs with more than one block____

.global EventScript_Stair1_Master
EventScript_Stair1_Master:
	lockall
	setvar 0x5200 0x1
	special2 0x8006 0x2b
	compare 0x8006 0x2
	if 0x1 _goto Stairs1_Corsa1
	comparefarbytetobyte 0x2036E58 0x1
	if 0x1 _goto Stairs1_Giu1
	comparefarbytetobyte 0x2036E58 0x2
	if 0x1 _goto Stairs1_Su1
	comparefarbytetobyte 0x2036E58 0x3
	if 0x1 _goto Stairs1_Sx1
	comparefarbytetobyte 0x2036E58 0x4
	if 0x1 _goto Stairs1_Dx1
	releaseall
	end

	Stairs1_Corsa1:
		comparefarbytetobyte 0x2036E58 0x1
		if 0x1 _goto Stairs1_Giuv1
		comparefarbytetobyte 0x2036E58 0x2
		if 0x1 _goto Stairs1_Suv1
		comparefarbytetobyte 0x2036E58 0x3
		if 0x1 _goto Stairs1_Sxv1
		comparefarbytetobyte 0x2036E58 0x4
		if 0x1 _goto Stairs1_Dxv1
		releaseall
	end


	Stairs1_Giu1:
		special 0x113
		applymovement 0xFF Stairs1_mov1
		applymovement 0x7F Stairs1_mov1.1
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs1_Su1:
		special 0x113
		applymovement 0xFF Stairs1_mov2
		applymovement 0x7F Stairs1_mov2.1
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs1_Sx1:
		special 0x113
		applymovement 0xFF Stairs1_mov3
		applymovement 0x7F Stairs1_mov3.1
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs1_Dx1:
		special 0x113
		applymovement 0xFF Stairs1_mov4
		applymovement 0x7F Stairs1_mov4.1
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs1_Giuv1:
		special 0x113
		applymovement 0xFF Stairs1_mov1v
		applymovement 0x7F Stairs1_mov1.1v
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs1_Suv1:
		special 0x113
		applymovement 0xFF Stairs1_mov2v
		applymovement 0x7F Stairs1_mov2.1v
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs1_Sxv1:
		special 0x113
		applymovement 0xFF Stairs1_mov3v
		applymovement 0x7F Stairs1_mov3.1v
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs1_Dxv1:
		special 0x113
		applymovement 0xFF Stairs1_mov4v
		applymovement 0x7F Stairs1_mov4.1v
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs1_mov1:
		.byte 0x10
		.byte 0x10
		.byte 0xFE

	Stairs1_mov1.1:
		.byte 0x10
		.byte 0x10
		.byte 0x10
		.byte 0xFE

	Stairs1_mov2:
		.byte 0x11
		.byte 0x11
		.byte 0xFE

	Stairs1_mov2.1:
		.byte 0x11
		.byte 0x11
		.byte 0x11
		.byte 0xFE

	Stairs1_mov3:
		.byte 0x12
		.byte 0x12
		.byte 0xFE

	Stairs1_mov3.1:
		.byte 0x12
		.byte 0x12
		.byte 0x12
		.byte 0xFE

	Stairs1_mov4:
		.byte 0x13
		.byte 0x13
		.byte 0xFE

	Stairs1_mov4.1:
		.byte 0x13
		.byte 0x13
		.byte 0x13
		.byte 0xFE

	Stairs1_mov1v:
		.byte 0x1D
		.byte 0x1D
		.byte 0xFE

	Stairs1_mov1.1v:
		.byte 0x1D
		.byte 0x1D
		.byte 0x1D
		.byte 0xFE

	Stairs1_mov2v:
		.byte 0x1E
		.byte 0x1E
		.byte 0xFE

	Stairs1_mov2.1v:
		.byte 0x1E
		.byte 0x1E
		.byte 0x1E
		.byte 0xFE

	Stairs1_mov3v:
		.byte 0x1F
		.byte 0x1F
		.byte 0xFE

	Stairs1_mov3.1v:
		.byte 0x1F
		.byte 0x1F
		.byte 0x1F
		.byte 0xFE

	Stairs1_mov4v:
		.byte 0x20
		.byte 0x20
		.byte 0xFE

	Stairs1_mov4.1v:
		.byte 0x20
		.byte 0x20
		.byte 0x20
		.byte 0xFE

	

//______Stairs with only one block____

.global EventScript_Stair0_Master
EventScript_Stair0_Master:
	lockall
	setvar 0x5200 0x1
	special2 0x8006 0x2b
	compare 0x8006 0x2
	if 0x1 _goto Stairs0_Corsa0
	comparefarbytetobyte 0x2036E58 0x1
	if 0x1 _goto Stairs0_Giu1
	comparefarbytetobyte 0x2036E58 0x2
	if 0x1 _goto Stairs0_Su1
	comparefarbytetobyte 0x2036E58 0x3
	if 0x1 _goto Stairs0_Sx1
	comparefarbytetobyte 0x2036E58 0x4
	if 0x1 _goto Stairs0_Dx1
	releaseall
	end

	Stairs0_Corsa0:
		comparefarbytetobyte 0x2036E58 0x1
		if 0x1 _goto Stairs0_Giuv1
		comparefarbytetobyte 0x2036E58 0x2
		if 0x1 _goto Stairs0_Suv1
		comparefarbytetobyte 0x2036E58 0x3
		if 0x1 _goto Stairs0_Sxv1
		comparefarbytetobyte 0x2036E58 0x4
		if 0x1 _goto Stairs0_Dxv1
		releaseall
	end


	Stairs0_Giu1:
		special 0x113
		applymovement 0xFF Stairs0_mov1
		applymovement 0x7F Stairs0_mov1.1
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs0_Su1:
		special 0x113
		applymovement 0xFF Stairs0_mov2
		applymovement 0x7F Stairs0_mov2.1
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs0_Sx1:
		special 0x113
		applymovement 0xFF Stairs0_mov3
		applymovement 0x7F Stairs0_mov3.1
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs0_Dx1:
		special 0x113
		applymovement 0xFF Stairs0_mov4
		applymovement 0x7F Stairs0_mov4.1
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs0_Giuv1:
		special 0x113
		applymovement 0xFF Stairs0_mov1v
		applymovement 0x7F Stairs0_mov1.1v
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs0_Suv1:
		special 0x113
		applymovement 0xFF Stairs0_mov2v
		applymovement 0x7F Stairs0_mov2.1v
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs0_Sxv1:
		special 0x113
		applymovement 0xFF Stairs0_mov3v
		applymovement 0x7F Stairs0_mov3.1v
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs0_Dxv1:
		special 0x113
		applymovement 0xFF Stairs0_mov4v
		applymovement 0x7F Stairs0_mov4.1v
		waitmovement 0x0
		special 0x114
		releaseall
	end


	Stairs0_mov1:
		.byte 0x10
		.byte 0xFE

	Stairs0_mov1.1:
		.byte 0x10
		.byte 0x10
		.byte 0xFE

	Stairs0_mov2:
		.byte 0x11
		.byte 0xFE

	Stairs0_mov2.1:
		.byte 0x11
		.byte 0x11
		.byte 0xFE

	Stairs0_mov3:
		.byte 0x12
		.byte 0xFE

	Stairs0_mov3.1:
		.byte 0x12
		.byte 0x12
		.byte 0xFE

	Stairs0_mov4:
		.byte 0x13
		.byte 0xFE

	Stairs0_mov4.1:
		.byte 0x13
		.byte 0x13
		.byte 0xFE

	Stairs0_mov1v:
		.byte 0x1D
		.byte 0xFE

	Stairs0_mov1.1v:
		.byte 0x1D
		.byte 0x1D
		.byte 0xFE

	Stairs0_mov2v:
		.byte 0x1E
		.byte 0xFE

	Stairs0_mov2.1v:
		.byte 0x1E
		.byte 0x1E
		.byte 0xFE

	Stairs0_mov3v:
		.byte 0x1F
		.byte 0xFE

	Stairs0_mov3.1v:
		.byte 0x1F
		.byte 0x1F
		.byte 0xFE

	Stairs0_mov4v:
		.byte 0x20
		.byte 0xFE

	Stairs0_mov4.1v:
		.byte 0x20
		.byte 0x20
		.byte 0xFE








	