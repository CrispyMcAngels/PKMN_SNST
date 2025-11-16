.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//H = 4054
//V1 = 4055
//V2 = 4056
//V3 = 4057
//V4 = 4058

//___LEVEL___

.global gMapScripts_Passo_Tuono_1_131
gMapScripts_Passo_Tuono_1_131:
	mapscript MAP_SCRIPT_ON_FRAME_TABLE Passo_Tuono_1_131_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Passo_Tuono_1_131_MapScriptOnFrame:
		levelscript 0x4052, 7, Passo_Tuono_1_131_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_131_MapScriptOnFrameBegin:
			compare 0x4051 0x43
			if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_P1
			releaseall
			end

			Passo_Tuono_1_131_MapScriptOnFrameBegin_P1:
				movesprite 0x3 0x4 0xF
				movesprite 0x5 0x6 0xF	
				movesprite 0x7 0x8 0xF	
				movesprite 0x9 0xA 0xF		



				special 0x113
				applymovement 0xFF Passo_Tuono_1_131_mov0
				waitmovement 0xFF
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green					
				msgbox Passo_Tuono_1_131_text1 MSG_NORMAL	
				special 0x15A	
				pause 0x1E
				//H
				setvar 0x4054 0x0
				//V1
				setvar 0x4055 0x0
				//V2
				setvar 0x4056 0x0
				//V3
				setvar 0x4057 0x0
				//V4
				setvar 0x4058 0x0
				//block level
				setvar 0x4052 0x8
				releaseall
				end

				Passo_Tuono_1_131_mov0:
					.byte 0x20
					.byte 0x20
					.byte 0x20
					.byte 0x20
					.byte 0x20
					.byte 0x20
					.byte 0x20
					.byte 0x20
					.byte 0x20
					.byte 0xFE

//_____TILE_0____

.global EventScript_Passo_Tuono_1_131_tile0_00
EventScript_Passo_Tuono_1_131_tile0_00:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x0
	if 0x1 _goto Passo_Tuono_1_131_tile0_move00

	movesprite 0x1 0x4 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x0
	compare 0x4055 0x0
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4055 0x1
	if 0x1 _call Passo_Tuono_1_131_U1
	compare 0x4055 0x2
	if 0x1 _call Passo_Tuono_1_131_U2
	compare 0x4055 0x3
	if 0x1 _call Passo_Tuono_1_131_U3
	releaseall
	end

	Passo_Tuono_1_131_M0:
		return

	Passo_Tuono_1_131_U1:
		applymovement 0xFF Passo_Tuono_1_131_U1_mov
		waitmovement 0x0
		return

		Passo_Tuono_1_131_U1_mov:
			.byte 0x1E
			.byte 0xFE

	Passo_Tuono_1_131_U2:
		applymovement 0xFF Passo_Tuono_1_131_U2_mov
		waitmovement 0x0
		return

		Passo_Tuono_1_131_U2_mov:
			.byte 0x1E
			.byte 0x1E
			.byte 0xFE

	Passo_Tuono_1_131_U3:
		applymovement 0xFF Passo_Tuono_1_131_U3_mov
		waitmovement 0x0
		return

		Passo_Tuono_1_131_U3_mov:
			.byte 0x1E
			.byte 0x1E
			.byte 0x1E
			.byte 0xFE

	Passo_Tuono_1_131_D1:
		applymovement 0xFF Passo_Tuono_1_131_D1_mov
		waitmovement 0x0
		return

		Passo_Tuono_1_131_D1_mov:
			.byte 0x1D
			.byte 0xFE

	Passo_Tuono_1_131_D2:
		applymovement 0xFF Passo_Tuono_1_131_D2_mov
		waitmovement 0x0
		return

		Passo_Tuono_1_131_D2_mov:
			.byte 0x1D
			.byte 0x1D
			.byte 0xFE

	Passo_Tuono_1_131_D3:
		applymovement 0xFF Passo_Tuono_1_131_D3_mov
		waitmovement 0x0
		return

		Passo_Tuono_1_131_D3_mov:
			.byte 0x1D
			.byte 0x1D
			.byte 0x1D
			.byte 0xFE

	Passo_Tuono_1_131_tile0_move00:
		compare 0x4055 0x1
		if 0x1 _call Passo_Tuono_1_131_tile0_move_D
		setvar 0x4055 0x0
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

		Passo_Tuono_1_131_tile0_move_D:
			applymovement 0x2 Passo_Tuono_1_131_movD
			applymovement 0x3 Passo_Tuono_1_131_movD
			waitmovement 0x2
			sound 0xC
			return

			Passo_Tuono_1_131_movD:
				.byte 0x10
				.byte 0x10
				.byte 0xFE

		Passo_Tuono_1_131_tile0_move_U:
			applymovement 0x2 Passo_Tuono_1_131_movU
			applymovement 0x3 Passo_Tuono_1_131_movU
			waitmovement 0x2
			sound 0xC
			return

			Passo_Tuono_1_131_movU:
				.byte 0x11
				.byte 0x11
				.byte 0xFE


		Passo_Tuono_1_131_tile1_move_D:
			applymovement 0x4 Passo_Tuono_1_131_movD
			applymovement 0x5 Passo_Tuono_1_131_movD
			waitmovement 0x4
			sound 0xC
			return

		Passo_Tuono_1_131_tile1_move_U:
			applymovement 0x4 Passo_Tuono_1_131_movU
			applymovement 0x5 Passo_Tuono_1_131_movU
			waitmovement 0x4
			sound 0xC
			return


		Passo_Tuono_1_131_tile2_move_D:
			applymovement 0x6 Passo_Tuono_1_131_movD
			applymovement 0x7 Passo_Tuono_1_131_movD
			waitmovement 0x6
			sound 0xC
			return

		Passo_Tuono_1_131_tile2_move_U:
			applymovement 0x6 Passo_Tuono_1_131_movU
			applymovement 0x7 Passo_Tuono_1_131_movU
			waitmovement 0x6
			sound 0xC
			return


		Passo_Tuono_1_131_tile3_move_D:
			applymovement 0x8 Passo_Tuono_1_131_movD
			applymovement 0x9 Passo_Tuono_1_131_movD
			waitmovement 0x8
			sound 0xC
			return

		Passo_Tuono_1_131_tile3_move_U:
			applymovement 0x8 Passo_Tuono_1_131_movU
			applymovement 0x9 Passo_Tuono_1_131_movU
			waitmovement 0x8
			sound 0xC
			return


//_____TILE_1____

.global EventScript_Passo_Tuono_1_131_tile0_01
EventScript_Passo_Tuono_1_131_tile0_01:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x0
	if 0x1 _goto Passo_Tuono_1_131_tile0_move01

	movesprite 0x1 0x4 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x0
	compare 0x4055 0x1
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4055 0x1
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4055 0x2
	if 0x1 _call Passo_Tuono_1_131_U1
	compare 0x4055 0x3
	if 0x1 _call Passo_Tuono_1_131_U2
	releaseall
	end

	Passo_Tuono_1_131_tile0_move01:
		compare 0x4055 0x2
		if 0x1 _call Passo_Tuono_1_131_tile0_move_D
		compare 0x4055 0x0
		if 0x1 _call Passo_Tuono_1_131_tile0_move_U
		setvar 0x4055 0x1
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end


//_____TILE_2____

.global EventScript_Passo_Tuono_1_131_tile0_02
EventScript_Passo_Tuono_1_131_tile0_02:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x0
	if 0x1 _goto Passo_Tuono_1_131_tile0_move02

	movesprite 0x1 0x4 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x0
	compare 0x4055 0x0
	if 0x1 _call Passo_Tuono_1_131_D2
	compare 0x4055 0x1
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4055 0x2
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4055 0x3
	if 0x1 _call Passo_Tuono_1_131_U1
	releaseall
	end

	Passo_Tuono_1_131_tile0_move02:
		compare 0x4055 0x3
		if 0x1 _call Passo_Tuono_1_131_tile0_move_D
		compare 0x4055 0x1
		if 0x1 _call Passo_Tuono_1_131_tile0_move_U
		setvar 0x4055 0x2
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end


//_____TILE_3____

.global EventScript_Passo_Tuono_1_131_tile0_03
EventScript_Passo_Tuono_1_131_tile0_03:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x0
	if 0x1 _goto Passo_Tuono_1_131_tile0_move03

	movesprite 0x1 0x4 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x0
	compare 0x4055 0x1
	if 0x1 _call Passo_Tuono_1_131_D3
	compare 0x4055 0x1
	if 0x1 _call Passo_Tuono_1_131_D2
	compare 0x4055 0x2
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4055 0x3
	if 0x1 _call Passo_Tuono_1_131_M0
	releaseall
	end

	Passo_Tuono_1_131_tile0_move03:
		compare 0x4055 0x4
		if 0x1 _call Passo_Tuono_1_131_tile0_move_D
		compare 0x4055 0x2
		if 0x1 _call Passo_Tuono_1_131_tile0_move_U
		setvar 0x4055 0x3
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end


//_____TILE_4____

.global EventScript_Passo_Tuono_1_131_tile1_10
EventScript_Passo_Tuono_1_131_tile1_10:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x1
	if 0x1 _goto Passo_Tuono_1_131_tile1_move10

	movesprite 0x1 0x6 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x1
	compare 0x4056 0x0
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4056 0x1
	if 0x1 _call Passo_Tuono_1_131_U1
	compare 0x4056 0x2
	if 0x1 _call Passo_Tuono_1_131_U2
	compare 0x4056 0x3
	if 0x1 _call Passo_Tuono_1_131_U3
	releaseall
	end

	Passo_Tuono_1_131_tile1_move10:
		compare 0x4056 0x1
		if 0x1 _call Passo_Tuono_1_131_tile1_move_D
		setvar 0x4056 0x0
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_5____

.global EventScript_Passo_Tuono_1_131_tile1_11
EventScript_Passo_Tuono_1_131_tile1_11:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x1
	if 0x1 _goto Passo_Tuono_1_131_tile1_move11

	movesprite 0x1 0x6 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x1
	compare 0x4056 0x0
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4056 0x1
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4056 0x2
	if 0x1 _call Passo_Tuono_1_131_U1
	compare 0x4056 0x3
	if 0x1 _call Passo_Tuono_1_131_U2
	releaseall
	end

	Passo_Tuono_1_131_tile1_move11:
		compare 0x4056 0x2
		if 0x1 _call Passo_Tuono_1_131_tile1_move_D
		compare 0x4056 0x0
		if 0x1 _call Passo_Tuono_1_131_tile1_move_U
		setvar 0x4056 0x1
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_6____

.global EventScript_Passo_Tuono_1_131_tile1_12
EventScript_Passo_Tuono_1_131_tile1_12:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x1
	if 0x1 _goto Passo_Tuono_1_131_tile1_move12

	movesprite 0x1 0x6 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x1
	compare 0x4056 0x0
	if 0x1 _call Passo_Tuono_1_131_D2
	compare 0x4056 0x1
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4056 0x2
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4056 0x3
	if 0x1 _call Passo_Tuono_1_131_U1
	releaseall
	end

	Passo_Tuono_1_131_tile1_move12:
		compare 0x4056 0x3
		if 0x1 _call Passo_Tuono_1_131_tile1_move_D
		compare 0x4056 0x1
		if 0x1 _call Passo_Tuono_1_131_tile1_move_U
		setvar 0x4056 0x2
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_7____

.global EventScript_Passo_Tuono_1_131_tile1_13
EventScript_Passo_Tuono_1_131_tile1_13:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x1
	if 0x1 _goto Passo_Tuono_1_131_tile1_move13

	movesprite 0x1 0x6 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x1
	compare 0x4056 0x0
	if 0x1 _call Passo_Tuono_1_131_D3
	compare 0x4056 0x1
	if 0x1 _call Passo_Tuono_1_131_D2
	compare 0x4056 0x2
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4056 0x3
	if 0x1 _call Passo_Tuono_1_131_M0
	releaseall
	end

	Passo_Tuono_1_131_tile1_move13:
		compare 0x4056 0x4
		if 0x1 _call Passo_Tuono_1_131_tile1_move_D
		compare 0x4056 0x2
		if 0x1 _call Passo_Tuono_1_131_tile1_move_U
		setvar 0x4056 0x3
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end


//_____TILE_8____

.global EventScript_Passo_Tuono_1_131_tile2_20
EventScript_Passo_Tuono_1_131_tile2_20:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x2
	if 0x1 _goto Passo_Tuono_1_131_tile2_move20

	movesprite 0x1 0x8 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x2
	compare 0x4057 0x0
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4057 0x1
	if 0x1 _call Passo_Tuono_1_131_U1
	compare 0x4057 0x2
	if 0x1 _call Passo_Tuono_1_131_U2
	compare 0x4057 0x3
	if 0x1 _call Passo_Tuono_1_131_U3
	releaseall
	end

	Passo_Tuono_1_131_tile2_move20:
		compare 0x4057 0x1
		if 0x1 _call Passo_Tuono_1_131_tile2_move_D
		setvar 0x4057 0x0
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_9____

.global EventScript_Passo_Tuono_1_131_tile2_21
EventScript_Passo_Tuono_1_131_tile2_21:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x2
	if 0x1 _goto Passo_Tuono_1_131_tile2_move21

	movesprite 0x1 0x8 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x2
	compare 0x4057 0x0
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4057 0x1
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4057 0x2
	if 0x1 _call Passo_Tuono_1_131_U1
	compare 0x4057 0x3
	if 0x1 _call Passo_Tuono_1_131_U2
	releaseall
	end

	Passo_Tuono_1_131_tile2_move21:
		compare 0x4057 0x2
		if 0x1 _call Passo_Tuono_1_131_tile2_move_D
		compare 0x4057 0x0
		if 0x1 _call Passo_Tuono_1_131_tile2_move_U
		setvar 0x4057 0x1
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_10____

.global EventScript_Passo_Tuono_1_131_tile2_22
EventScript_Passo_Tuono_1_131_tile2_22:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x2
	if 0x1 _goto Passo_Tuono_1_131_tile2_move22

	movesprite 0x1 0x8 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x2
	compare 0x4057 0x0
	if 0x1 _call Passo_Tuono_1_131_D2
	compare 0x4057 0x1
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4057 0x2
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4057 0x3
	if 0x1 _call Passo_Tuono_1_131_U1
	releaseall
	end

	Passo_Tuono_1_131_tile2_move22:
		compare 0x4057 0x3
		if 0x1 _call Passo_Tuono_1_131_tile2_move_D
		compare 0x4057 0x1
		if 0x1 _call Passo_Tuono_1_131_tile2_move_U
		setvar 0x4057 0x2
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_11____

.global EventScript_Passo_Tuono_1_131_tile2_23
EventScript_Passo_Tuono_1_131_tile2_23:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x2
	if 0x1 _goto Passo_Tuono_1_131_tile2_move23

	movesprite 0x1 0x8 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x2
	compare 0x4057 0x0
	if 0x1 _call Passo_Tuono_1_131_D3
	compare 0x4057 0x1
	if 0x1 _call Passo_Tuono_1_131_D2
	compare 0x4057 0x2
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4057 0x3
	if 0x1 _call Passo_Tuono_1_131_M0
	releaseall
	end

	Passo_Tuono_1_131_tile2_move23:
		compare 0x4057 0x4
		if 0x1 _call Passo_Tuono_1_131_tile2_move_D
		compare 0x4057 0x2
		if 0x1 _call Passo_Tuono_1_131_tile2_move_U
		setvar 0x4057 0x3
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end



//_____TILE_12____

.global EventScript_Passo_Tuono_1_131_tile3_30
EventScript_Passo_Tuono_1_131_tile3_30:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x3
	if 0x1 _goto Passo_Tuono_1_131_tile3_move30

	movesprite 0x1 0xA 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x3
	compare 0x4058 0x0
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4058 0x1
	if 0x1 _call Passo_Tuono_1_131_U1
	compare 0x4058 0x2
	if 0x1 _call Passo_Tuono_1_131_U2
	compare 0x4058 0x3
	if 0x1 _call Passo_Tuono_1_131_U3
	releaseall
	end

	Passo_Tuono_1_131_tile3_move30:
		compare 0x4058 0x1
		if 0x1 _call Passo_Tuono_1_131_tile3_move_D
		setvar 0x4058 0x0
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_13____

.global EventScript_Passo_Tuono_1_131_tile3_31
EventScript_Passo_Tuono_1_131_tile3_31:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x3
	if 0x1 _goto Passo_Tuono_1_131_tile3_move31

	movesprite 0x1 0xA 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x3
	compare 0x4058 0x0
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4058 0x1
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4058 0x2
	if 0x1 _call Passo_Tuono_1_131_U1
	compare 0x4058 0x3
	if 0x1 _call Passo_Tuono_1_131_U2
	releaseall
	end

	Passo_Tuono_1_131_tile3_move31:
		compare 0x4058 0x2
		if 0x1 _call Passo_Tuono_1_131_tile3_move_D
		compare 0x4058 0x0
		if 0x1 _call Passo_Tuono_1_131_tile3_move_U
		setvar 0x4058 0x1
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_14____

.global EventScript_Passo_Tuono_1_131_tile3_32
EventScript_Passo_Tuono_1_131_tile3_32:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x3
	if 0x1 _goto Passo_Tuono_1_131_tile3_move32

	movesprite 0x1 0xA 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x3
	compare 0x4058 0x0
	if 0x1 _call Passo_Tuono_1_131_D2
	compare 0x4058 0x1
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4058 0x2
	if 0x1 _call Passo_Tuono_1_131_M0
	compare 0x4058 0x3
	if 0x1 _call Passo_Tuono_1_131_U1
	releaseall
	end

	Passo_Tuono_1_131_tile3_move32:
		compare 0x4058 0x3
		if 0x1 _call Passo_Tuono_1_131_tile3_move_D
		compare 0x4058 0x1
		if 0x1 _call Passo_Tuono_1_131_tile3_move_U
		setvar 0x4058 0x2
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end

//_____TILE_15____

.global EventScript_Passo_Tuono_1_131_tile3_33
EventScript_Passo_Tuono_1_131_tile3_33:
	lockall
	//check orizzontale se cambio colonna (se si, variabile verticale non cambia, la posizione viene aggiustata per essere riportati sulla rispettiva V)
	compare 0x4054 0x3
	if 0x1 _goto Passo_Tuono_1_131_tile3_move33

	movesprite 0x1 0xA 0x9
	
	//check per capire dove posizionarsi verticalmente (il valore V1/V2/V3/V4)
	setvar 0x4054 0x3
	compare 0x4058 0x0
	if 0x1 _call Passo_Tuono_1_131_D3
	compare 0x4058 0x1
	if 0x1 _call Passo_Tuono_1_131_D2
	compare 0x4058 0x2
	if 0x1 _call Passo_Tuono_1_131_D1
	compare 0x4058 0x3
	if 0x1 _call Passo_Tuono_1_131_M0
	releaseall
	end

	Passo_Tuono_1_131_tile3_move33:
		compare 0x4058 0x4
		if 0x1 _call Passo_Tuono_1_131_tile3_move_D
		compare 0x4058 0x2
		if 0x1 _call Passo_Tuono_1_131_tile3_move_U
		setvar 0x4058 0x3
		compare 0x4055 0x2
		if 0x1 _goto Passo_Tuono_1_131_SOL_1
		releaseall
		end



//____SOL_____

	Passo_Tuono_1_131_SOL_1:
		compare 0x4056 0x0
		if 0x1 _goto Passo_Tuono_1_131_SOL_2
		releaseall
		end

		Passo_Tuono_1_131_SOL_2:
			compare 0x4057 0x3
			if 0x1 _goto Passo_Tuono_1_131_SOL_3
			releaseall
			end

			Passo_Tuono_1_131_SOL_3:
				compare 0x4058 0x1
				if 0x1 _goto Passo_Tuono_1_131_SOLVED
				releaseall
				end

	Passo_Tuono_1_131_SOLVED:
		pause 0x1E
		spritebehave 0x2 0x43
		spritebehave 0x3 0x43
		spritebehave 0x4 0x43
		spritebehave 0x5 0x43
		spritebehave 0x6 0x43
		spritebehave 0x7 0x43
		spritebehave 0x8 0x43
		spritebehave 0x9 0x43
		pause 0x2E
		compare 0x5026 0x0
		if 0x1 _call Player_Blue
		compare 0x5026 0x88
		if 0x1 _call Player_Orange
		compare 0x5026 0x85
		if 0x1 _call Player_Green					
		msgbox Passo_Tuono_1_131_text2 MSG_NORMAL	
		special 0x15A
		setvar 0x4051 0x44
		pause 0x1E
		//reactivate level script var 
		setvar 0x4052 0x7
		fadescreen 0x3
		//put correct OW sprite
		compare 0x5026 0x0
		if 0x1 _call OW_Player_Blue
		compare 0x5026 0x88
		if 0x1 _call OW_Player_Orange
		compare 0x5026 0x85
		if 0x1 _call OW_Player_Green	
		fadescreen 0x2
		warpmuted 0x1 0x7C 0xFF 0x6 0x4
		releaseall
		end

		Player_Blue:
			showpokepic 0x3b6 0x0 0x6
			return

		Player_Orange:
			showpokepic 0x3bE 0x0 0x6
			return

		Player_Green:
			showpokepic 0x3bF 0x0 0x6
			return

OW_Player_Blue:
	setvar 0x501F 0x100
	return

OW_Player_Orange:
	setvar 0x501F 0x1A3
	return

OW_Player_Green:
	setvar 0x501F 0x1A4
	return