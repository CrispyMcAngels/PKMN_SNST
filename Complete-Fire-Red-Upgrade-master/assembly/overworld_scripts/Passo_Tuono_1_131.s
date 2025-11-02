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
		levelscript 0x4052, 6, Passo_Tuono_1_131_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_131_MapScriptOnFrameBegin:
			compare 0x4051 0x43
			if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_P1
			releaseall
			end

			Passo_Tuono_1_131_MapScriptOnFrameBegin_P1:
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
				setvar 0x4055 0x1
				//V2
				setvar 0x4056 0x1
				//V3
				setvar 0x4057 0x1
				//V4
				setvar 0x4058 0x1

				compare 0x4051 0x43
				if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H0
				releaseall
				end

				Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP:
					//TROVARE SUONO
					sound 0xD
					compare 0x4054 0x0
					if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H0
					compare 0x4054 0x1
					if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H1
					compare 0x4054 0x2
					if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H2
					compare 0x4054 0x3
					if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H3
					releaseall
					end

//____SOL_____

Passo_Tuono_1_131_SOL_1:
	compare 0x4056 0x0
	if 0x1 _call Passo_Tuono_1_131_SOL_2
	return

	Passo_Tuono_1_131_SOL_2:
		compare 0x4057 0x4
		if 0x1 _call Passo_Tuono_1_131_SOL_3
		return

		Passo_Tuono_1_131_SOL_3:
			compare 0x4058 0x1
			if 0x1 _call Passo_Tuono_1_131_SOLVED
			return

Passo_Tuono_1_131_SOLVED:
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
	fadescreen 0x3
	//put correct OW sprite
	compare 0x5026 0x0
	if 0x1 _goto OW_Player_Blue
	compare 0x5026 0x88
	if 0x1 _goto OW_Player_Orange
	compare 0x5026 0x85
	if 0x1 _goto OW_Player_Green	
	warpmuted 0x1 0x7C 0xFF 0x6 0x4
	releaseall
	end



//________________________H0_____________________________

				Passo_Tuono_1_131_MapScriptOnFrameBegin_H0:
					movesprite 0x14 0x4 0x5
					setvar 0x4054 0x0
					msgbox Passo_Tuono_1_131_textH0 MSG_NORMAL	
					//special2 0x800D 0x2C
					
					special 0x2F		
					//check if UP is pressed
					//compare 0x800D 0x1
					compare 0x800D 0x40
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H0_UP
					//check if DOWN is pressed
					//compare 0x800D 0x3
					compare 0x800D 0x80
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H0_DOWN
					//check if RIGHT is pressed
					//compare 0x800D 0x4
					compare 0x800D 0x10
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H1	
					//check if LEFT is pressed
					//compare 0x800D 0x2
					compare 0x800D 0x20
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
					

					//calling the solution check
					compare 0x4055 0x3
					if 0x1 _call Passo_Tuono_1_131_SOL_1
					//loopback
					setvar 0x800D 0x0
					compare 0x4054 0x0
					if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H0
					releaseall
					end

					Passo_Tuono_1_131_MapScriptOnFrameBegin_H0_UP:
						compare 0x4055 0x4
						if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
						addvar 0x4055 0x1
						//sound strenght 
						sound 0xC
						msgbox Passo_Tuono_1_131_textH0_UP MSG_NORMAL	
						compare 0x4055 0x0
						if 0x1 _call Passo_Tuono_1_131_V1_0
						compare 0x4055 0x1
						if 0x1 _call Passo_Tuono_1_131_V1_1
						compare 0x4055 0x2
						if 0x1 _call Passo_Tuono_1_131_V1_2
						compare 0x4055 0x3
						if 0x1 _call Passo_Tuono_1_131_V1_3
						compare 0x4055 0x4
						if 0x1 _call Passo_Tuono_1_131_V1_4
						return

					Passo_Tuono_1_131_MapScriptOnFrameBegin_H0_DOWN:
						compare 0x4055 0x0
						if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
						subvar 0x4055 0x1
						//sound strenght 
						sound 0xC
						msgbox Passo_Tuono_1_131_textH0_DOWN MSG_NORMAL	
						compare 0x4055 0x0
						if 0x1 _call Passo_Tuono_1_131_V1_0
						compare 0x4055 0x1
						if 0x1 _call Passo_Tuono_1_131_V1_1
						compare 0x4055 0x2
						if 0x1 _call Passo_Tuono_1_131_V1_2
						compare 0x4055 0x3
						if 0x1 _call Passo_Tuono_1_131_V1_3
						compare 0x4055 0x4
						if 0x1 _call Passo_Tuono_1_131_V1_4
						return


						Passo_Tuono_1_131_V1_0:
							movesprite 0x0 0x4 0x5
							movesprite 0x1 0x4 0x3
							movesprite 0x2 0x4 0x3
							movesprite 0x3 0x4 0x3
							movesprite 0x4 0x4 0x3
							return

						Passo_Tuono_1_131_V1_1:
							movesprite 0x0 0x4 0x3
							movesprite 0x1 0x4 0x5
							movesprite 0x2 0x4 0x3
							movesprite 0x3 0x4 0x3
							movesprite 0x4 0x4 0x3
							return

						Passo_Tuono_1_131_V1_2:
							movesprite 0x0 0x4 0x3
							movesprite 0x1 0x4 0x3
							movesprite 0x2 0x4 0x5
							movesprite 0x3 0x4 0x3
							movesprite 0x4 0x4 0x3
							return

						Passo_Tuono_1_131_V1_3:
							movesprite 0x0 0x4 0x3
							movesprite 0x1 0x4 0x3
							movesprite 0x2 0x4 0x3
							movesprite 0x3 0x4 0x5
							movesprite 0x4 0x4 0x3
							return

						Passo_Tuono_1_131_V1_4:
							movesprite 0x0 0x4 0x3
							movesprite 0x1 0x4 0x3
							movesprite 0x2 0x4 0x3
							movesprite 0x3 0x4 0x3
							movesprite 0x4 0x4 0x5
							return

//________________________H1______________________________

				Passo_Tuono_1_131_MapScriptOnFrameBegin_H1:
					movesprite 0x14 0x6 0x5
					setvar 0x4054 0x1
					special2 0x800D 0x2C
					msgbox Passo_Tuono_1_131_textH1 MSG_NORMAL	
					
					//check if UP is pressed
					compare 0x800D 0x1
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H1_UP
					//check if DOWN is pressed
					compare 0x800D 0x3
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H1_DOWN
					//check if RIGHT is pressed
					compare 0x800D 0x4
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H2	
					//check if LEFT is pressed
					compare 0x800D 0x2
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H0
					//calling the solution check
					compare 0x4055 0x3
					if 0x1 _call Passo_Tuono_1_131_SOL_1
					//loopback
					setvar 0x800D 0x0
					compare 0x4054 0x1
					if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H1
					releaseall
					end

					Passo_Tuono_1_131_MapScriptOnFrameBegin_H1_UP:
						compare 0x4056 0x4
						if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
						addvar 0x4056 0x1
						//sound strenght 
						sound 0xC
						msgbox Passo_Tuono_1_131_textH1_UP MSG_NORMAL	
						compare 0x4056 0x0
						if 0x1 _call Passo_Tuono_1_131_V2_0
						compare 0x4056 0x1
						if 0x1 _call Passo_Tuono_1_131_V2_1
						compare 0x4056 0x2
						if 0x1 _call Passo_Tuono_1_131_V2_2
						compare 0x4056 0x3
						if 0x1 _call Passo_Tuono_1_131_V2_3
						compare 0x4056 0x4
						if 0x1 _call Passo_Tuono_1_131_V2_4
						return

					Passo_Tuono_1_131_MapScriptOnFrameBegin_H1_DOWN:
						compare 0x4056 0x0
						if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
						subvar 0x4056 0x1
						//sound strenght 
						sound 0xC
						msgbox Passo_Tuono_1_131_textH1_DOWN MSG_NORMAL	
						compare 0x4056 0x0
						if 0x1 _call Passo_Tuono_1_131_V2_0
						compare 0x4056 0x1
						if 0x1 _call Passo_Tuono_1_131_V2_1
						compare 0x4056 0x2
						if 0x1 _call Passo_Tuono_1_131_V2_2
						compare 0x4056 0x3
						if 0x1 _call Passo_Tuono_1_131_V2_3
						compare 0x4056 0x4
						if 0x1 _call Passo_Tuono_1_131_V2_4
						return


						Passo_Tuono_1_131_V2_0:
							movesprite 0x5 0x6 0x5
							movesprite 0x6 0x6 0x3
							movesprite 0x7 0x6 0x3
							movesprite 0x8 0x6 0x3
							movesprite 0x9 0x6 0x3
							return

						Passo_Tuono_1_131_V2_1:
							movesprite 0x5 0x6 0x3
							movesprite 0x6 0x6 0x5
							movesprite 0x7 0x6 0x3
							movesprite 0x8 0x6 0x3
							movesprite 0x9 0x6 0x3
							return

						Passo_Tuono_1_131_V2_2:
							movesprite 0x5 0x6 0x3
							movesprite 0x6 0x6 0x3
							movesprite 0x7 0x6 0x5
							movesprite 0x8 0x6 0x3
							movesprite 0x9 0x6 0x3
							return

						Passo_Tuono_1_131_V2_3:
							movesprite 0x5 0x6 0x3
							movesprite 0x6 0x6 0x3
							movesprite 0x7 0x6 0x3
							movesprite 0x8 0x6 0x5
							movesprite 0x9 0x6 0x3
							return

						Passo_Tuono_1_131_V2_4:
							movesprite 0x5 0x6 0x3
							movesprite 0x6 0x6 0x3
							movesprite 0x7 0x6 0x3
							movesprite 0x8 0x6 0x3
							movesprite 0x9 0x6 0x5
							return

//________________________H2______________________________

				Passo_Tuono_1_131_MapScriptOnFrameBegin_H2:
					movesprite 0x14 0x8 0x5
					setvar 0x4054 0x2
					msgbox Passo_Tuono_1_131_textH2 MSG_NORMAL	
					special2 0x800D 0x2C
					
					//check if UP is pressed
					compare 0x800D 0x1
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H2_UP
					//check if DOWN is pressed
					compare 0x800D 0x3
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H2_DOWN
					//check if RIGHT is pressed
					compare 0x800D 0x4
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H3	
					//check if LEFT is pressed
					compare 0x800D 0x2
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H1
					//calling the solution check
					compare 0x4055 0x3
					if 0x1 _call Passo_Tuono_1_131_SOL_1
					//loopback
					setvar 0x800D 0x0
					compare 0x4054 0x1
					if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H2
					releaseall
					end

					Passo_Tuono_1_131_MapScriptOnFrameBegin_H2_UP:
						compare 0x4057 0x4
						if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
						addvar 0x4057 0x1
						//sound strenght 
						sound 0xC
						msgbox Passo_Tuono_1_131_textH2_UP MSG_NORMAL	
						compare 0x4057 0x0
						if 0x1 _call Passo_Tuono_1_131_V3_0
						compare 0x4057 0x1
						if 0x1 _call Passo_Tuono_1_131_V3_1
						compare 0x4057 0x2
						if 0x1 _call Passo_Tuono_1_131_V3_2
						compare 0x4057 0x3
						if 0x1 _call Passo_Tuono_1_131_V3_3
						compare 0x4057 0x4
						if 0x1 _call Passo_Tuono_1_131_V3_4
						return

					Passo_Tuono_1_131_MapScriptOnFrameBegin_H2_DOWN:
						compare 0x4057 0x0
						if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
						subvar 0x4057 0x1
						//sound strenght 
						sound 0xC
						msgbox Passo_Tuono_1_131_textH2_DOWN MSG_NORMAL	
						compare 0x4057 0x0
						if 0x1 _call Passo_Tuono_1_131_V3_0
						compare 0x4057 0x1
						if 0x1 _call Passo_Tuono_1_131_V3_1
						compare 0x4057 0x2
						if 0x1 _call Passo_Tuono_1_131_V3_2
						compare 0x4057 0x3
						if 0x1 _call Passo_Tuono_1_131_V3_3
						compare 0x4057 0x4
						if 0x1 _call Passo_Tuono_1_131_V3_4
						return


						Passo_Tuono_1_131_V3_0:
							movesprite 0xA 0x8 0x5
							movesprite 0xB 0x8 0x3
							movesprite 0xC 0x8 0x3
							movesprite 0xD 0x8 0x3
							movesprite 0xE 0x8 0x3
							return

						Passo_Tuono_1_131_V3_1:
							movesprite 0xA 0x8 0x3
							movesprite 0xB 0x8 0x5
							movesprite 0xC 0x8 0x3
							movesprite 0xD 0x8 0x3
							movesprite 0xE 0x8 0x3
							return

						Passo_Tuono_1_131_V3_2:
							movesprite 0xA 0x8 0x3
							movesprite 0xB 0x8 0x3
							movesprite 0xC 0x8 0x5
							movesprite 0xD 0x8 0x3
							movesprite 0xE 0x8 0x3
							return

						Passo_Tuono_1_131_V3_3:
							movesprite 0xA 0x8 0x3
							movesprite 0xB 0x8 0x3
							movesprite 0xC 0x8 0x3
							movesprite 0xD 0x8 0x5
							movesprite 0xE 0x8 0x3
							return

						Passo_Tuono_1_131_V3_4:
							movesprite 0xA 0x8 0x3
							movesprite 0xB 0x8 0x3
							movesprite 0xC 0x8 0x3
							movesprite 0xD 0x8 0x3
							movesprite 0xE 0x8 0x5
							return				
		
//________________________H3______________________________

				Passo_Tuono_1_131_MapScriptOnFrameBegin_H3:
					movesprite 0x14 0xA 0x5
					setvar 0x4054 0x3
					msgbox Passo_Tuono_1_131_textH3 MSG_NORMAL	
					
					special2 0x800D 0x2C
					//check if UP is pressed
					compare 0x800D 0x1
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H3_UP
					//check if DOWN is pressed
					compare 0x800D 0x3
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H3_DOWN
					//check if RIGHT is pressed
					compare 0x800D 0x4
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP	
					//check if LEFT is pressed
					compare 0x800D 0x2
					if 0x1 _call Passo_Tuono_1_131_MapScriptOnFrameBegin_H2
					//calling the solution check
					compare 0x4055 0x3
					if 0x1 _call Passo_Tuono_1_131_SOL_1
					//loopback
					setvar 0x800D 0x0
					compare 0x4054 0x3
					if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_H3
					releaseall
					end

					Passo_Tuono_1_131_MapScriptOnFrameBegin_H3_UP:
						compare 0x4058 0x4
						if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
						addvar 0x4058 0x1
						//sound strenght 
						sound 0xC
						msgbox Passo_Tuono_1_131_textH3_UP MSG_NORMAL	
						compare 0x4058 0x0
						if 0x1 _call Passo_Tuono_1_131_V4_0
						compare 0x4058 0x1
						if 0x1 _call Passo_Tuono_1_131_V4_1
						compare 0x4058 0x2
						if 0x1 _call Passo_Tuono_1_131_V4_2
						compare 0x4058 0x3
						if 0x1 _call Passo_Tuono_1_131_V4_3
						compare 0x4058 0x4
						if 0x1 _call Passo_Tuono_1_131_V4_4
						return

					Passo_Tuono_1_131_MapScriptOnFrameBegin_H3_DOWN:
						compare 0x4058 0x0
						if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_STOP
						subvar 0x4058 0x1
						//sound strenght 
						sound 0xC
						msgbox Passo_Tuono_1_131_textH3_DOWN MSG_NORMAL	
						compare 0x4058 0x0
						if 0x1 _call Passo_Tuono_1_131_V4_0
						compare 0x4058 0x1
						if 0x1 _call Passo_Tuono_1_131_V4_1
						compare 0x4058 0x2
						if 0x1 _call Passo_Tuono_1_131_V4_2
						compare 0x4058 0x3
						if 0x1 _call Passo_Tuono_1_131_V4_3
						compare 0x4058 0x4
						if 0x1 _call Passo_Tuono_1_131_V4_4
						return


						Passo_Tuono_1_131_V4_0:
							movesprite 0xF 0xA 0x5
							movesprite 0x10 0xA 0x3
							movesprite 0x11 0xA 0x3
							movesprite 0x12 0xA 0x3
							movesprite 0x13 0xA 0x3
							return

						Passo_Tuono_1_131_V4_1:
							movesprite 0xF 0xA 0x3
							movesprite 0x10 0xA 0x5
							movesprite 0x11 0xA 0x3
							movesprite 0x12 0xA 0x3
							movesprite 0x13 0xA 0x3
							return

						Passo_Tuono_1_131_V4_2:
							movesprite 0xF 0xA 0x3
							movesprite 0x10 0xA 0x3
							movesprite 0x11 0xA 0x5
							movesprite 0x12 0xA 0x3
							movesprite 0x13 0xA 0x3
							return

						Passo_Tuono_1_131_V4_3:
							movesprite 0xF 0xA 0x3
							movesprite 0x10 0xA 0x3
							movesprite 0x11 0xA 0x3
							movesprite 0x12 0xA 0x5
							movesprite 0x13 0xA 0x3
							return

						Passo_Tuono_1_131_V4_4:
							movesprite 0xF 0xA 0x3
							movesprite 0x10 0xA 0x3
							movesprite 0x11 0xA 0x3
							movesprite 0x12 0xA 0x3
							movesprite 0x13 0xA 0x5
							return					


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