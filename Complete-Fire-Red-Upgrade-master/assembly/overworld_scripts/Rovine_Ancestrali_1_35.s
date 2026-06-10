.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


.global gMapScripts_Rovine_Ancestrali_1_35
gMapScripts_Rovine_Ancestrali_1_35:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Rovine_Ancestrali_1_35_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

		Rovine_Ancestrali_1_35_MapScriptOnFrame:
		levelscript 0x4050, 4, Rovine_Ancestrali_1_35_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Rovine_Ancestrali_1_35_MapScriptOnFrameBegin:
			lockall
			fadescreen 0x3
			special 0x113
			applymovement 0xFF Rovine_Ancestrali_1_35_L_mov1
			waitmovement 0x0
			msgbox Rovine_Ancestrali_1_35_L_text1 0x7
			pause 0x1E
			fadescreen 0x2
			pause 0x1E
			msgbox Rovine_Ancestrali_1_35_L_text2 0x7
			setvar 0x4050 0x2
			setvar 0x4054 0x0
			releaseall
			end

			Rovine_Ancestrali_1_35_L_mov1:
				.byte 0x20
				.byte 0x20
				.byte 0x20
				.byte 0x20
				.byte 0x20
				.byte 0x20
				.byte 0x20
				.byte 0x20
				.byte 0x1E
				.byte 0xFE


//GETPLAYERPOS

.global EventScript_Rovine_Ancestrali_1_35_GPP	
EventScript_Rovine_Ancestrali_1_35_GPP:	
		lockall
		compare 0x4055 0x0
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign0
		compare 0x4055 0x1
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign1
		compare 0x4055 0x2
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign2
		compare 0x4055 0x3
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign3			
		compare 0x4055 0x4
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign4
		compare 0x4055 0x5
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign5
		compare 0x4055 0x6
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign6
		compare 0x4055 0x7
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign7		
		compare 0x4055 0x8
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign8			
		compare 0x4055 0x9
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign9
		compare 0x4055 0xA
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_SignA
		compare 0x4055 0xB
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_SignB
		compare 0x4055 0xC
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_SignC		
		compare 0x4055 0xD
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_SignD			
		compare 0x4055 0xE
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_SignE
		compare 0x4055 0xF
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_SignF
		compare 0x4055 0x10
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign10
		compare 0x4055 0x11
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign11		
		compare 0x4055 0x12
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign12
		compare 0x4055 0x13
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign13
		compare 0x4055 0x14
		if 0x1 _goto EventScript_Rovine_Ancestrali_1_35_Sign14
		releaseall
		end	

//SIGNS_____________

EventScript_Rovine_Ancestrali_1_35_Sign0:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign0
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign0
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign0
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign0
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign0
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign0
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign0
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign0
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign0
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign0
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x4056 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x4057 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x4058 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x4059 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x405A 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x405B 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x405C 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x405D 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign0:	
		setvar 0x405E 0x0
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign0:	
		
		compare 0x4056 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end
		
	//assign pieces to transport	
		
	Rovine_Ancestrali_1_35_piece1:	
		setvar 0x4054 0x1
		releaseall
		end
		
	Rovine_Ancestrali_1_35_piece2:	
		setvar 0x4054 0x2
		releaseall
		end
		
	Rovine_Ancestrali_1_35_piece3:	
		setvar 0x4054 0x3
		releaseall
		end
		
	Rovine_Ancestrali_1_35_piece4:	
		setvar 0x4054 0x4
		releaseall
		end
		
	Rovine_Ancestrali_1_35_piece5:	
		setvar 0x4054 0x5
		releaseall
		end
		
	Rovine_Ancestrali_1_35_piece6:	
		setvar 0x4054 0x6
		releaseall
		end
		
	Rovine_Ancestrali_1_35_piece7:	
		setvar 0x4054 0x7
		releaseall
		end
		
	Rovine_Ancestrali_1_35_piece8:	
		setvar 0x4054 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_piece9:	
		setvar 0x4054 0x9
		releaseall
		end
		
	//SOLUTION_______	
		
	Rovine_Ancestrali_1_35_SOL:	
		compare 0x4056 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL1
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL1:	
		compare 0x4057 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL2
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL2:	
		compare 0x4058 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL3
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL3:	
		compare 0x4059 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL4
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL4:	
		compare 0x405A 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL5
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL5:	
		compare 0x405B 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL6
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL6:	
		compare 0x405C 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL7
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL7:	
		compare 0x405D 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL8:	
		compare 0x405E 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_SOL9:	
		pause 0x1E
		pause 0x1E
		setvar 0x4051 0x21
		setvar 0x4050 0x4
		compare 0x5006 0x0 
		if 0x1 _call OW_Player_Blue
		compare 0x5006 0x1
		if 0x1 _call OW_Player_Orange
		compare 0x5006 0x2
		if 0x1 _call OW_Player_Green
		msgbox Rovine_Ancestrali_1_35_SOL_text1 0x7
		closeonkeypress
		pause 0x1E
		warpmuted 0x1 0x22 0xFF 0x05 0x04
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign1:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign1
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign1
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign1
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign1
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign1
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign1
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign1
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign1
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign1
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign1
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x4056 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x4057 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x4058 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x4059 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x405A 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x405B 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x405C 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x405D 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign1:	
		setvar 0x405E 0x1
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign1:	
		
		compare 0x4056 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x1
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign2:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign2
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign2
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign2
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign2
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign2
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign2
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign2
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign2
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign2
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign2
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x4056 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x4057 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x4058 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x4059 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x405A 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x405B 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x405C 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x405D 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign2:	
		setvar 0x405E 0x2
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign2:	
		
		compare 0x4056 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x2
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign3:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign3
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign3
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign3
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign3
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign3
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign3
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign3
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign3
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign3
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign3
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x4056 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x4057 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x4058 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x4059 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x405A 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x405B 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x405C 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x405D 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign3:	
		setvar 0x405E 0x3
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign3:	
		
		compare 0x4056 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign4:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign4
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign4
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign4
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign4
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign4
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign4
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign4
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign4
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign4
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign4
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x4056 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x4057 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x4058 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x4059 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x405A 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x405B 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x405C 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x405D 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign4:	
		setvar 0x405E 0x4
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign4:	
		
		compare 0x4056 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign5:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign5
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign5
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign5
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign5
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign5
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign5
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign5
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign5
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign5
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign5
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x4056 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x4057 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x4058 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x4059 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x405A 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x405B 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x405C 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x405D 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign5:	
		setvar 0x405E 0x5
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign5:	
		
		compare 0x4056 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign6:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign6
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign6
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign6
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign6
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign6
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign6
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign6
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign6
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign6
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign6
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x4056 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x4057 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x4058 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x4059 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x405A 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x405B 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x405C 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x405D 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign6:	
		setvar 0x405E 0x6
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign6:	
		
		compare 0x4056 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end

	
EventScript_Rovine_Ancestrali_1_35_Sign7:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign7
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign7
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign7
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign7
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign7
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign7
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign7
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign7
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign7
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign7
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x4056 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x4057 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x4058 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x4059 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x405A 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x405B 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x405C 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x405D 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign7:	
		setvar 0x405E 0x7
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign7:	
		
		compare 0x4056 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign8:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign8
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign8
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign8
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign8
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign8
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign8
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign8
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign8
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign8
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign8
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x4056 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x4057 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x4058 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x4059 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x405A 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x405B 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x405C 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x405D 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign8:	
		setvar 0x405E 0x8
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign8:	
		
		compare 0x4056 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end

	
EventScript_Rovine_Ancestrali_1_35_Sign9:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign9
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign9
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign9
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign9
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign9
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign9
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign9
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign9
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign9
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign9
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x4056 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x4057 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x4058 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x4059 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x405A 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x405B 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x405C 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x405D 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign9:	
		setvar 0x405E 0x9
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign9:	
		
		compare 0x4056 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_SignA:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_SignA
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_SignA
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_SignA
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_SignA
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_SignA
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_SignA
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_SignA
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_SignA
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_SignA
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_SignA
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x4056 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x4057 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x4058 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x4059 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x405A 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x405B 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x405C 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x405D 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_SignA:	
		setvar 0x405E 0xA
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_SignA:	
		
		compare 0x4056 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end

	
EventScript_Rovine_Ancestrali_1_35_SignB:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_SignB
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_SignB
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_SignB
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_SignB
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_SignB
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_SignB
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_SignB
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_SignB
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_SignB
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_SignB
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x4056 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x4057 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x4058 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x4059 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x405A 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x405B 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x405C 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x405D 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_SignB:	
		setvar 0x405E 0xB
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_SignB:	
		
		compare 0x4056 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end

	
EventScript_Rovine_Ancestrali_1_35_SignC:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_SignC
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_SignC
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_SignC
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_SignC
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_SignC
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_SignC
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_SignC
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_SignC
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_SignC
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_SignC
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x4056 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x4057 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x4058 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x4059 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x405A 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x405B 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x405C 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x405D 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_SignC:	
		setvar 0x405E 0xC
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_SignC:	
		
		compare 0x4056 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end

	
EventScript_Rovine_Ancestrali_1_35_SignD:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_SignD
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_SignD
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_SignD
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_SignD
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_SignD
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_SignD
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_SignD
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_SignD
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_SignD
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_SignD
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x4056 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x4057 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x4058 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x4059 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x405A 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x405B 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x405C 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x405D 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_SignD:	
		setvar 0x405E 0xD
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_SignD:	
		
		compare 0x4056 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end

	
EventScript_Rovine_Ancestrali_1_35_SignE:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_SignE
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_SignE
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_SignE
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_SignE
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_SignE
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_SignE
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_SignE
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_SignE
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_SignE
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_SignE
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x4056 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x4057 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x4058 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x4059 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x405A 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x405B 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x405C 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x405D 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_SignE:	
		setvar 0x405E 0xE
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_SignE:	
		
		compare 0x4056 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end

	
EventScript_Rovine_Ancestrali_1_35_SignF:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_SignF
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_SignF
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_SignF
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_SignF
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_SignF
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_SignF
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_SignF
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_SignF
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_SignF
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_SignF
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x4056 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x4057 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x4058 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x4059 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x405A 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x405B 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x405C 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x405D 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_SignF:	
		setvar 0x405E 0xF
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_SignF:	
		
		compare 0x4056 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign10:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign10
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign10
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign10
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign10
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign10
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign10
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign10
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign10
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign10
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign10
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x4056 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x4057 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x4058 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x4059 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x405A 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x405B 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x405C 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x405D 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign10:	
		setvar 0x405E 0x10
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign10:	
		
		compare 0x4056 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign11:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign11
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign11
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign11
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign11
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign11
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign11
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign11
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign11
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign11
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign11
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x4056 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x4057 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x4058 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x4059 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x405A 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x405B 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x405C 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x405D 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign11:	
		setvar 0x405E 0x11
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign11:	
		
		compare 0x4056 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end

	
EventScript_Rovine_Ancestrali_1_35_Sign12:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign12
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign12
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign12
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign12
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign12
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign12
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign12
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign12
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign12
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign12
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x4056 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x4057 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x4058 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x4059 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x405A 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x405B 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x405C 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x405D 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign12:	
		setvar 0x405E 0x12
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign12:	
		
		compare 0x4056 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign13:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign13
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign13
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign13
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign13
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign13
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign13
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign13
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign13
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign13
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign13
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x4056 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x4057 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x4058 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x4059 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x405A 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x405B 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x405C 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x405D 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign13:	
		setvar 0x405E 0x13
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign13:	
		
		compare 0x4056 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


EventScript_Rovine_Ancestrali_1_35_Sign14:	
		lockall
		//TRASPORTO VUOTO______________
		compare 0x4054 0x0
		if 0x1 _goto Pickup_Rovine_Ancestrali_1_35_Sign14
		//TRASPORTO NON VUOTO______________
		compare 0x4054 0x1
		if 0x1 _goto Dep_piece1_Rovine_Ancestrali_1_35_Sign14
		
		compare 0x4054 0x2
		if 0x1 _goto Dep_piece2_Rovine_Ancestrali_1_35_Sign14
		
		compare 0x4054 0x3
		if 0x1 _goto Dep_piece3_Rovine_Ancestrali_1_35_Sign14
		
		compare 0x4054 0x4
		if 0x1 _goto Dep_piece4_Rovine_Ancestrali_1_35_Sign14
		
		compare 0x4054 0x5
		if 0x1 _goto Dep_piece5_Rovine_Ancestrali_1_35_Sign14
		
		compare 0x4054 0x6
		if 0x1 _goto Dep_piece6_Rovine_Ancestrali_1_35_Sign14
		
		compare 0x4054 0x7
		if 0x1 _goto Dep_piece7_Rovine_Ancestrali_1_35_Sign14
		
		compare 0x4054 0x8
		if 0x1 _goto Dep_piece8_Rovine_Ancestrali_1_35_Sign14
		
		compare 0x4054 0x9
		if 0x1 _goto Dep_piece9_Rovine_Ancestrali_1_35_Sign14
		
		releaseall
		end
		
		
	Dep_piece1_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x4056 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece2_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x4057 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece3_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x4058 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece4_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x4059 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece5_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x405A 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece6_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x405B 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece7_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x405C 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece8_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x405D 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	Dep_piece9_Rovine_Ancestrali_1_35_Sign14:	
		setvar 0x405E 0x14
		setvar 0x4054 0x0
		compare 0x4054 0x0
		if 0x1 _goto Rovine_Ancestrali_1_35_SOL
		releaseall
		end
		
	//PICKUP_________________________	
		
	Pickup_Rovine_Ancestrali_1_35_Sign14:	
		
		compare 0x4056 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece1
		
		compare 0x4057 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece2
		
		compare 0x4058 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece3
		
		compare 0x4059 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece4
		
		compare 0x405A 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece5
		
		compare 0x405B 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece6
		
		compare 0x405C 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece7
		
		compare 0x405D 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece8
		
		compare 0x405E 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_piece9
		
		releaseall
		end


//TILES__________________


//________________TILE0_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile0	
EventScript_Rovine_Ancestrali_1_35_tile0:	
	lockall

	setvar 0x4055 0x0	
	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile0
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile0
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile0
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile0
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile0
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile0
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile0
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile0
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile0
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile0
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x1 0x5 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x2 0x5 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x3 0x5 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x4 0x5 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x5 0x5 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x6 0x5 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x7 0x5 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x8 0x5 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile0:	
	lockall
	
	movesprite 0xA 0x5 0x1
	movesprite 0x9 0x5 0x1
	sound 0xC
	
	releaseall
	end


//________________TILE1_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile1	
EventScript_Rovine_Ancestrali_1_35_tile1:	
	lockall
	
	setvar 0x4055 0x1		
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile1
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile1
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile1
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile1
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile1
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile1
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile1
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile1
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile1
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile1
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x1 0x7 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x2 0x7 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x3 0x7 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x4 0x7 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x5 0x7 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x6 0x7 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x7 0x7 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x8 0x7 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile1:	
	lockall
	
	movesprite 0xA 0x7 0x1
	movesprite 0x9 0x7 0x1
	sound 0xC
	
	releaseall
	end
			

//________________TILE2_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile2	
EventScript_Rovine_Ancestrali_1_35_tile2:	
	lockall
	
	setvar 0x4055 0x2	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile2
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile2
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile2
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile2
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile2
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile2
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile2
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile2
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile2
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile2
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x1 0x9 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x2 0x9 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x3 0x9 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x4 0x9 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x5 0x9 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x6 0x9 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x7 0x9 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x8 0x9 0x1
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile2:	
	lockall
	
	movesprite 0xA 0x9 0x1
	movesprite 0x9 0x9 0x1
	sound 0xC
	
	releaseall
	end



//________________TILE3_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile3	
EventScript_Rovine_Ancestrali_1_35_tile3:	
	lockall
	
	setvar 0x4055 0x3	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile3
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile3
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile3
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile3
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile3
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile3
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile3
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile3
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile3
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile3
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x1 0x3 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x2 0x3 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x3 0x3 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x4 0x3 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x5 0x3 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x6 0x3 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x7 0x3 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x8 0x3 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile3:	
	lockall
	
	movesprite 0xA 0x3 0x3
	movesprite 0x9 0x3 0x3
	sound 0xC
	
	releaseall
	end
	



//________________TILE4_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile4	
EventScript_Rovine_Ancestrali_1_35_tile4:	
	lockall
	
	setvar 0x4055 0x4
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile4
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile4
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile4
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile4
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile4
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile4
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile4
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile4
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile4
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile4
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x1 0x5 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x2 0x5 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x3 0x5 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x4 0x5 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x5 0x5 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x6 0x5 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x7 0x5 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x8 0x5 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile4:	
	lockall
	
	movesprite 0xA 0x5 0x3
	movesprite 0x9 0x5 0x3
	sound 0xC
	
	releaseall
	end



//________________TILE5_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile5	
EventScript_Rovine_Ancestrali_1_35_tile5:	
	lockall
	
	setvar 0x4055 0x5	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile5
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile5
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile5
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile5
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile5
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile5
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile5
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile5
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile5
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile5
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x1 0x7 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x2 0x7 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x3 0x7 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x4 0x7 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x5 0x7 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x6 0x7 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x7 0x7 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x8 0x7 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile5:	
	lockall
	
	movesprite 0xA 0x7 0x3
	movesprite 0x9 0x7 0x3
	sound 0xC
	
	releaseall
	end


//________________TILE6_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile6	
EventScript_Rovine_Ancestrali_1_35_tile6:	
	lockall
	
	setvar 0x4055 0x6	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile6
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile6
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile6
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile6
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile6
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile6
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile6
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile6
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile6
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile6
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x1 0x9 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x2 0x9 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x3 0x9 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x4 0x9 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x5 0x9 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x6 0x9 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x7 0x9 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x8 0x9 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile6:	
	lockall
	
	movesprite 0xA 0x9 0x3
	movesprite 0x9 0x9 0x3
	sound 0xC
	
	releaseall
	end



//________________TILE7_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile7	
EventScript_Rovine_Ancestrali_1_35_tile7:	
	lockall
	
	setvar 0x4055 0x7	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile7
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile7
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile7
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile7
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile7
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile7
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile7
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile7
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile7
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile7
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x1 0xB 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x2 0xB 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x3 0xB 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x4 0xB 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x5 0xB 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x6 0xB 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x7 0xB 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x8 0xB 0x3
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile7:	
	lockall
	
	movesprite 0xA 0xB 0x3
	movesprite 0x9 0xB 0x3
	sound 0xC
	
	releaseall
	end


//________________TILE8_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile8	
EventScript_Rovine_Ancestrali_1_35_tile8:	
	lockall
	
	setvar 0x4055 0x8	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile8
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile8
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile8
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile8
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile8
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile8
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile8
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile8
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile8
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile8
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x1 0x3 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x2 0x3 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x3 0x3 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x4 0x3 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x5 0x3 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x6 0x3 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x7 0x3 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x8 0x3 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile8:	
	lockall
	
	movesprite 0xA 0x3 0x5
	movesprite 0x9 0x3 0x5
	sound 0xC
	
	releaseall
	end


//________________TILE9_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile9	
EventScript_Rovine_Ancestrali_1_35_tile9:	
	lockall
	
	setvar 0x4055 0x9
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile9
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile9
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile9
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile9
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile9
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile9
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile9
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile9
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile9
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile9
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x1 0x5 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x2 0x5 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x3 0x5 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x4 0x5 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x5 0x5 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x6 0x5 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x7 0x5 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x8 0x5 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile9:	
	lockall
	
	movesprite 0xA 0x5 0x5
	movesprite 0x9 0x5 0x5
	sound 0xC
	
	releaseall
	end



//________________TILEA_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tileA	
EventScript_Rovine_Ancestrali_1_35_tileA:	
	lockall
	
	setvar 0x4055 0xA	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tileA
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tileA
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tileA
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tileA
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tileA
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tileA
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tileA
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tileA
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tileA
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tileA
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x1 0x7 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x2 0x7 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x3 0x7 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x4 0x7 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x5 0x7 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x6 0x7 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x7 0x7 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x8 0x7 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tileA:	
	lockall
	
	movesprite 0xA 0x7 0x5
	movesprite 0x9 0x7 0x5
	sound 0xC
	
	releaseall
	end



//________________TILEB_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tileB	
EventScript_Rovine_Ancestrali_1_35_tileB:	
	lockall
	
	setvar 0x4055 0xB	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tileB
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tileB
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tileB
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tileB
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tileB
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tileB
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tileB
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tileB
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tileB
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tileB
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x1 0x9 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x2 0x9 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x3 0x9 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x4 0x9 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x5 0x9 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x6 0x9 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x7 0x9 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x8 0x9 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tileB:	
	lockall
	
	movesprite 0xA 0x9 0x5
	movesprite 0x9 0x9 0x5
	sound 0xC
	
	releaseall
	end



//________________TILEC_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tileC	
EventScript_Rovine_Ancestrali_1_35_tileC:	
	lockall
	
	setvar 0x4055 0xC	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tileC
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tileC
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tileC
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tileC
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tileC
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tileC
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tileC
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tileC
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tileC
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tileC
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x1 0xB 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x2 0xB 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x3 0xB 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x4 0xB 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x5 0xB 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x6 0xB 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x7 0xB 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x8 0xB 0x5
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tileC:	
	lockall
	
	movesprite 0xA 0xB 0x5
	movesprite 0x9 0xB 0x5
	sound 0xC
	
	releaseall
	end




//________________TILED_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tileD	
EventScript_Rovine_Ancestrali_1_35_tileD:	
	lockall
	
	setvar 0x4055 0xD	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tileD
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tileD
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tileD
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tileD
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tileD
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tileD
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tileD
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tileD
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tileD
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tileD
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x1 0x3 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x2 0x3 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x3 0x3 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x4 0x3 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x5 0x3 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x6 0x3 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x7 0x3 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x8 0x3 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tileD:	
	lockall
	
	movesprite 0xA 0x3 0x7
	movesprite 0x9 0x3 0x7
	sound 0xC
	
	releaseall
	end


//________________TILEE_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tileE	
EventScript_Rovine_Ancestrali_1_35_tileE:	
	lockall
	
	setvar 0x4055 0xE
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tileE
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tileE
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tileE
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tileE
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tileE
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tileE
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tileE
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tileE
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tileE
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tileE
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x1 0x5 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x2 0x5 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x3 0x5 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x4 0x5 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x5 0x5 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x6 0x5 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x7 0x5 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x8 0x5 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tileE:	
	lockall
	
	movesprite 0xA 0x5 0x7
	movesprite 0x9 0x5 0x7
	sound 0xC
	
	releaseall
	end


//________________TILEF_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tileF	
EventScript_Rovine_Ancestrali_1_35_tileF:	
	lockall
	
	setvar 0x4055 0xF	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tileF
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tileF
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tileF
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tileF
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tileF
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tileF
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tileF
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tileF
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tileF
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tileF
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x1 0x7 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x2 0x7 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x3 0x7 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x4 0x7 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x5 0x7 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x6 0x7 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x7 0x7 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x8 0x7 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tileF:	
	lockall
	
	movesprite 0xA 0x7 0x7
	movesprite 0x9 0x7 0x7
	sound 0xC
	
	releaseall
	end


//________________TILE10_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile10	
EventScript_Rovine_Ancestrali_1_35_tile10:	
	lockall
	
	setvar 0x4055 0x10	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile10
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile10
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile10
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile10
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile10
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile10
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile10
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile10
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile10
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile10
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x1 0x9 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x2 0x9 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x3 0x9 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x4 0x9 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x5 0x9 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x6 0x9 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x7 0x9 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x8 0x9 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile10:	
	lockall
	
	movesprite 0xA 0x9 0x7
	movesprite 0x9 0x9 0x7
	sound 0xC
	
	releaseall
	end


//________________TILE11_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile11	
EventScript_Rovine_Ancestrali_1_35_tile11:	
	lockall
	
	setvar 0x4055 0x11	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile11
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile11
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile11
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile11
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile11
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile11
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile11
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile11
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile11
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile11
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x1 0xB 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x2 0xB 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x3 0xB 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x4 0xB 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x5 0xB 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x6 0xB 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x7 0xB 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x8 0xB 0x7
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile11:	
	lockall
	
	movesprite 0xA 0xB 0x7
	movesprite 0x9 0xB 0x7
	sound 0xC
	
	releaseall
	end


//________________TILE12_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile12	
EventScript_Rovine_Ancestrali_1_35_tile12:	
	lockall
	
	setvar 0x4055 0x12	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile12
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile12
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile12
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile12
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile12
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile12
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile12
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile12
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile12
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile12
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x1 0x5 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x2 0x5 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x3 0x5 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x4 0x5 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x5 0x5 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x6 0x5 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x7 0x5 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x8 0x5 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile12:	
	lockall
	
	movesprite 0xA 0x5 0x9
	movesprite 0x9 0x5 0x9
	sound 0xC
	
	releaseall
	end


//________________TILE13_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile13	
EventScript_Rovine_Ancestrali_1_35_tile13:	
	lockall
	
	setvar 0x4055 0x13	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile13
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile13
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile13
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile13
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile13
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile13
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile13
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile13
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile13
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile13
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x1 0x7 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x2 0x7 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x3 0x7 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x4 0x7 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x5 0x7 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x6 0x7 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x7 0x7 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x8 0x7 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile13:	
	lockall
	
	movesprite 0xA 0x7 0x9
	movesprite 0x9 0x7 0x9
	sound 0xC
	
	releaseall
	end


//________________TILE14_______________________________
.global EventScript_Rovine_Ancestrali_1_35_tile14	
EventScript_Rovine_Ancestrali_1_35_tile14:	
	lockall
	
	setvar 0x4055 0x14	
	
	compare 0x4054 0x0
	if 0x1 _goto Rovine_Ancestrali_1_35_start0_tile14
	
	compare 0x4054 0x1
	if 0x1 _goto Rovine_Ancestrali_1_35_start1_tile14
	
	compare 0x4054 0x2
	if 0x1 _goto Rovine_Ancestrali_1_35_start2_tile14
	
	compare 0x4054 0x3
	if 0x1 _goto Rovine_Ancestrali_1_35_start3_tile14
	
	compare 0x4054 0x4
	if 0x1 _goto Rovine_Ancestrali_1_35_start4_tile14
	
	compare 0x4054 0x5
	if 0x1 _goto Rovine_Ancestrali_1_35_start5_tile14
	
	compare 0x4054 0x6
	if 0x1 _goto Rovine_Ancestrali_1_35_start6_tile14
	
	compare 0x4054 0x7
	if 0x1 _goto Rovine_Ancestrali_1_35_start7_tile14
	
	compare 0x4054 0x8
	if 0x1 _goto Rovine_Ancestrali_1_35_start8_tile14
	
	compare 0x4054 0x9
	if 0x1 _goto Rovine_Ancestrali_1_35_start9_tile14
	
	releaseall
	end
	
//PIECE0______________________________________________________	
Rovine_Ancestrali_1_35_start0_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	sound 0x5
	
	releaseall
	end
	
	
//PIECE1______________________________________________________	
Rovine_Ancestrali_1_35_start1_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x1 0x9 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE2______________________________________________________	
Rovine_Ancestrali_1_35_start2_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x2 0x9 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE3______________________________________________________	
Rovine_Ancestrali_1_35_start3_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x3 0x9 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE4______________________________________________________	
Rovine_Ancestrali_1_35_start4_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x4 0x9 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE5______________________________________________________	
Rovine_Ancestrali_1_35_start5_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x5 0x9 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE6______________________________________________________	
Rovine_Ancestrali_1_35_start6_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x6 0x9 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE7______________________________________________________	
Rovine_Ancestrali_1_35_start7_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x7 0x9 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE8______________________________________________________	
Rovine_Ancestrali_1_35_start8_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x8 0x9 0x9
	sound 0xC
	
	releaseall
	end
	
	
//PIECE9______________________________________________________	
Rovine_Ancestrali_1_35_start9_tile14:	
	lockall
	
	movesprite 0xA 0x9 0x9
	movesprite 0x9 0x9 0x9
	sound 0xC
	
	releaseall
	end



OW_Player_Blue:
	setvar 0x501F 0x100
	return

OW_Player_Orange:
	setvar 0x501F 0x1A3
	return

OW_Player_Green:
	setvar 0x501F 0x1A4
	return