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


//SIGNS_____________

.global EventScript_Rovine_Ancestrali_1_35_Sign0	
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
		setvar 0x501F 0x0100
		msgbox Rovine_Ancestrali_1_35_SOL_text1 0x7
		closeonkeypress
		compare 0x4054 0x0
		warpmuted 0x1 0x22 0xFF 0x0B 0x07
		releaseall
		end

.global EventScript_Rovine_Ancestrali_1_35_Sign1	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign2	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign3	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign4	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign5	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign6	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign7	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign8	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign9	
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

.global EventScript_Rovine_Ancestrali_1_35_SignA	
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

.global EventScript_Rovine_Ancestrali_1_35_SignB	
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

.global EventScript_Rovine_Ancestrali_1_35_SignC	
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

.global EventScript_Rovine_Ancestrali_1_35_SignD	
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

.global EventScript_Rovine_Ancestrali_1_35_SignE	
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

.global EventScript_Rovine_Ancestrali_1_35_SignF	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign10	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign11	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign12	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign13	
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

.global EventScript_Rovine_Ancestrali_1_35_Sign14	
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

.global EventScript_Rovine_Ancestrali_1_35_tile0			
EventScript_Rovine_Ancestrali_1_35_tile0:			
	lockall		
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0		
	waitmovement 0xFF		
			
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
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up0_tile0:		
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left0_tile0:		
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
	//PIECE1______________________________________________________		
	Rovine_Ancestrali_1_35_start1_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up1_tile0:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left1_tile0:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE2______________________________________________________		
	Rovine_Ancestrali_1_35_start2_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up2_tile0:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left2_tile0:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE3______________________________________________________		
	Rovine_Ancestrali_1_35_start3_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up3_tile0:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left3_tile0:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE4______________________________________________________		
	Rovine_Ancestrali_1_35_start4_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up4_tile0:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left4_tile0:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE5______________________________________________________		
	Rovine_Ancestrali_1_35_start5_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up5_tile0:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left5_tile0:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE6______________________________________________________		
	Rovine_Ancestrali_1_35_start6_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up6_tile0:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left6_tile0:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE7______________________________________________________		
	Rovine_Ancestrali_1_35_start7_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up7_tile0:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left7_tile0:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE8______________________________________________________		
	Rovine_Ancestrali_1_35_start8_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up8_tile0:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left8_tile0:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE9______________________________________________________		
	Rovine_Ancestrali_1_35_start9_tile0:		
		lockall	
			
			
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile0	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile0	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up9_tile0:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left9_tile0:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x0	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
			
		Rovine_Ancestrali_1_35_mov0:	
			.byte 0x1 
			.byte 0xFE
			
		Rovine_Ancestrali_1_35_movD:	
			.byte 0x1D
			.byte 0x1D
			.byte 0x0 
			.byte 0xFE
			
		Rovine_Ancestrali_1_35_movU:	
			.byte 0x1E
			.byte 0x1E
			.byte 0x0 
			.byte 0xFE
			
		Rovine_Ancestrali_1_35_movL:	
			.byte 0x1F
			.byte 0x1F
			.byte 0x0 
			.byte 0xFE
			
		Rovine_Ancestrali_1_35_movR:	
			.byte 0x20
			.byte 0x20
			.byte 0x0 
			.byte 0xFE

.global EventScript_Rovine_Ancestrali_1_35_tile1			
EventScript_Rovine_Ancestrali_1_35_tile1:			
	lockall		
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0		
	waitmovement 0xFF		
			
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
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up0_tile1:		
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0xA
		sound 0x22		
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left0_tile1:		
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right0_tile1:		
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE1______________________________________________________		
	Rovine_Ancestrali_1_35_start1_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up1_tile1:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left1_tile1:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right1_tile1:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE2______________________________________________________		
	Rovine_Ancestrali_1_35_start2_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up2_tile1:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left2_tile1:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right2_tile1:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE3______________________________________________________		
	Rovine_Ancestrali_1_35_start3_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up3_tile1:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left3_tile1:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right3_tile1:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE4______________________________________________________		
	Rovine_Ancestrali_1_35_start4_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up4_tile1:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left4_tile1:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right4_tile1:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE5______________________________________________________		
	Rovine_Ancestrali_1_35_start5_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up5_tile1:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left5_tile1:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right5_tile1:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE6______________________________________________________		
	Rovine_Ancestrali_1_35_start6_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up6_tile1:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left6_tile1:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right6_tile1:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE7______________________________________________________		
	Rovine_Ancestrali_1_35_start7_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up7_tile1:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left7_tile1:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right7_tile1:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE8______________________________________________________		
	Rovine_Ancestrali_1_35_start8_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up8_tile1:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left8_tile1:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right8_tile1:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	//PIECE9______________________________________________________		
	Rovine_Ancestrali_1_35_start9_tile1:		
		lockall	
			
			
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile1	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile1	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile1	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up9_tile1:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left9_tile1:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right9_tile1:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x1	
		releaseall	
		end

.global EventScript_Rovine_Ancestrali_1_35_tile2			
EventScript_Rovine_Ancestrali_1_35_tile2:			
	lockall		
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0		
	waitmovement 0xFF		
			
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
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile2	
		releaseall	
		end	
			

			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up0_tile2:		
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right0_tile2:		
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE1______________________________________________________		
	Rovine_Ancestrali_1_35_start1_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up1_tile2:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right1_tile2:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE2______________________________________________________		
	Rovine_Ancestrali_1_35_start2_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up2_tile2:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right2_tile2:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE3______________________________________________________		
	Rovine_Ancestrali_1_35_start3_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up3_tile2:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right3_tile2:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE4______________________________________________________		
	Rovine_Ancestrali_1_35_start4_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up4_tile2:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right4_tile2:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE5______________________________________________________		
	Rovine_Ancestrali_1_35_start5_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up5_tile2:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right5_tile2:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE6______________________________________________________		
	Rovine_Ancestrali_1_35_start6_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up6_tile2:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right6_tile2:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE7______________________________________________________		
	Rovine_Ancestrali_1_35_start7_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up7_tile2:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right7_tile2:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE8______________________________________________________		
	Rovine_Ancestrali_1_35_start8_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up8_tile2:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right8_tile2:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
	//PIECE9______________________________________________________		
	Rovine_Ancestrali_1_35_start9_tile2:		
		lockall	
			
			
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile2	
			
			
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up9_tile2:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_right9_tile2:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x2	
		releaseall	
		end	
			

.global EventScript_Rovine_Ancestrali_1_35_tile3			
EventScript_Rovine_Ancestrali_1_35_tile3:			
	lockall		
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0		
	waitmovement 0xFF		
			
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
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up0_tile3:		
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left0_tile3:		
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
	//PIECE1______________________________________________________		
	Rovine_Ancestrali_1_35_start1_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up1_tile3:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left1_tile3:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE2______________________________________________________		
	Rovine_Ancestrali_1_35_start2_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up2_tile3:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left2_tile3:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE3______________________________________________________		
	Rovine_Ancestrali_1_35_start3_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up3_tile3:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left3_tile3:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE4______________________________________________________		
	Rovine_Ancestrali_1_35_start4_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up4_tile3:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left4_tile3:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE5______________________________________________________		
	Rovine_Ancestrali_1_35_start5_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up5_tile3:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left5_tile3:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE6______________________________________________________		
	Rovine_Ancestrali_1_35_start6_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up6_tile3:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left6_tile3:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE7______________________________________________________		
	Rovine_Ancestrali_1_35_start7_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up7_tile3:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left7_tile3:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE8______________________________________________________		
	Rovine_Ancestrali_1_35_start8_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up8_tile3:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left8_tile3:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	//PIECE9______________________________________________________		
	Rovine_Ancestrali_1_35_start9_tile3:		
		lockall	
			
			
		compare 0x4055 0x8	
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile3	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile3	
			
			
		releaseall	
		end	
			
			
			
			
			
			
			
			
			
			
	Rovine_Ancestrali_1_35_up9_tile3:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left9_tile3:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x3	
		releaseall	
		end	

.global EventScript_Rovine_Ancestrali_1_35_tile4			
EventScript_Rovine_Ancestrali_1_35_tile4:			
	lockall		
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0		
	waitmovement 0xFF		
			
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
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down0_tile4:		
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up0_tile4:		
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left0_tile4:		
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right0_tile4:		
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE1______________________________________________________		
	Rovine_Ancestrali_1_35_start1_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down1_tile4:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up1_tile4:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left1_tile4:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right1_tile4:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE2______________________________________________________		
	Rovine_Ancestrali_1_35_start2_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down2_tile4:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up2_tile4:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left2_tile4:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right2_tile4:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE3______________________________________________________		
	Rovine_Ancestrali_1_35_start3_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down3_tile4:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up3_tile4:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left3_tile4:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right3_tile4:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE4______________________________________________________		
	Rovine_Ancestrali_1_35_start4_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down4_tile4:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up4_tile4:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left4_tile4:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right4_tile4:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE5______________________________________________________		
	Rovine_Ancestrali_1_35_start5_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down5_tile4:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up5_tile4:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left5_tile4:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right5_tile4:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE6______________________________________________________		
	Rovine_Ancestrali_1_35_start6_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down6_tile4:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up6_tile4:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left6_tile4:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right6_tile4:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE7______________________________________________________		
	Rovine_Ancestrali_1_35_start7_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down7_tile4:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up7_tile4:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left7_tile4:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right7_tile4:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE8______________________________________________________		
	Rovine_Ancestrali_1_35_start8_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down8_tile4:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up8_tile4:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left8_tile4:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right8_tile4:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	//PIECE9______________________________________________________		
	Rovine_Ancestrali_1_35_start9_tile4:		
		lockall	
		compare 0x4055 0x0	
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile4	
		compare 0x4055 0x9	
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile4	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile4	
		compare 0x4055 0x3	
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down9_tile4:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up9_tile4:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left9_tile4:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right9_tile4:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x4	
		releaseall	
		end	

.global EventScript_Rovine_Ancestrali_1_35_tile5			
EventScript_Rovine_Ancestrali_1_35_tile5:			
	lockall		
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0		
	waitmovement 0xFF		
			
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
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down0_tile5:		
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up0_tile5:		
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left0_tile5:		
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right0_tile5:		
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE1______________________________________________________		
	Rovine_Ancestrali_1_35_start1_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down1_tile5:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up1_tile5:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left1_tile5:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right1_tile5:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE2______________________________________________________		
	Rovine_Ancestrali_1_35_start2_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down2_tile5:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up2_tile5:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left2_tile5:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right2_tile5:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE3______________________________________________________		
	Rovine_Ancestrali_1_35_start3_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down3_tile5:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up3_tile5:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left3_tile5:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right3_tile5:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE4______________________________________________________		
	Rovine_Ancestrali_1_35_start4_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down4_tile5:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up4_tile5:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left4_tile5:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right4_tile5:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE5______________________________________________________		
	Rovine_Ancestrali_1_35_start5_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down5_tile5:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up5_tile5:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left5_tile5:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right5_tile5:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE6______________________________________________________		
	Rovine_Ancestrali_1_35_start6_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down6_tile5:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up6_tile5:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left6_tile5:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right6_tile5:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE7______________________________________________________		
	Rovine_Ancestrali_1_35_start7_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down7_tile5:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up7_tile5:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left7_tile5:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right7_tile5:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE8______________________________________________________		
	Rovine_Ancestrali_1_35_start8_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down8_tile5:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up8_tile5:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left8_tile5:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right8_tile5:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	//PIECE9______________________________________________________		
	Rovine_Ancestrali_1_35_start9_tile5:		
		lockall	
		compare 0x4055 0x1	
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile5	
		compare 0x4055 0xA	
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile5	
		compare 0x4055 0x6	
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile5	
		compare 0x4055 0x4	
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down9_tile5:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up9_tile5:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left9_tile5:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right9_tile5:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x5	
		releaseall	
		end	

.global EventScript_Rovine_Ancestrali_1_35_tile6			
EventScript_Rovine_Ancestrali_1_35_tile6:			
	lockall		
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0		
	waitmovement 0xFF		
			
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
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down0_tile6:		
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up0_tile6:		
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left0_tile6:		
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right0_tile6:		
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0xA	
		sound 0x22	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE1______________________________________________________		
	Rovine_Ancestrali_1_35_start1_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down1_tile6:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up1_tile6:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left1_tile6:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right1_tile6:		
		applymovement 0x1 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x1	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE2______________________________________________________		
	Rovine_Ancestrali_1_35_start2_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down2_tile6:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up2_tile6:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left2_tile6:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right2_tile6:		
		applymovement 0x2 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x2	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE3______________________________________________________		
	Rovine_Ancestrali_1_35_start3_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down3_tile6:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up3_tile6:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left3_tile6:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right3_tile6:		
		applymovement 0x3 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x3	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE4______________________________________________________		
	Rovine_Ancestrali_1_35_start4_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down4_tile6:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up4_tile6:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left4_tile6:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right4_tile6:		
		applymovement 0x4 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x4	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE5______________________________________________________		
	Rovine_Ancestrali_1_35_start5_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down5_tile6:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up5_tile6:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left5_tile6:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right5_tile6:		
		applymovement 0x5 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x5	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE6______________________________________________________		
	Rovine_Ancestrali_1_35_start6_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down6_tile6:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up6_tile6:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left6_tile6:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right6_tile6:		
		applymovement 0x6 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x6	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE7______________________________________________________		
	Rovine_Ancestrali_1_35_start7_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down7_tile6:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up7_tile6:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left7_tile6:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right7_tile6:		
		applymovement 0x7 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x7	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE8______________________________________________________		
	Rovine_Ancestrali_1_35_start8_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down8_tile6:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up8_tile6:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left8_tile6:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right8_tile6:		
		applymovement 0x8 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x8	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	//PIECE9______________________________________________________		
	Rovine_Ancestrali_1_35_start9_tile6:		
		lockall	
		compare 0x4055 0x2	
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile6	
		compare 0x4055 0xB	
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile6	
		compare 0x4055 0x7	
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile6	
		compare 0x4055 0x5	
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_down9_tile6:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movD	
		applymovement 0xA Rovine_Ancestrali_1_35_movD	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_up9_tile6:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movU	
		applymovement 0xA Rovine_Ancestrali_1_35_movU	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_left9_tile6:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movL	
		applymovement 0xA Rovine_Ancestrali_1_35_movL	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
	Rovine_Ancestrali_1_35_right9_tile6:		
		applymovement 0x9 Rovine_Ancestrali_1_35_movR	
		applymovement 0xA Rovine_Ancestrali_1_35_movR	
		waitmovement 0x9	
		sound 0xC	
		setvar 0x4055 0x6	
		releaseall	
		end	
			
.global EventScript_Rovine_Ancestrali_1_35_tile7		
EventScript_Rovine_Ancestrali_1_35_tile7:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile7
		releaseall
		end
		

		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up0_tile7:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right0_tile7:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up1_tile7:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right1_tile7:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up2_tile7:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right2_tile7:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up3_tile7:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right3_tile7:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up4_tile7:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right4_tile7:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up5_tile7:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right5_tile7:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up6_tile7:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right6_tile7:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up7_tile7:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right7_tile7:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up8_tile7:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right8_tile7:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tile7:	
		lockall
		
		
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile7
		
		
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_up9_tile7:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right9_tile7:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x7
		releaseall
		end

.global EventScript_Rovine_Ancestrali_1_35_tile8		
EventScript_Rovine_Ancestrali_1_35_tile8:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tile8:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up0_tile8:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left0_tile8:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tile8:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up1_tile8:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left1_tile8:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tile8:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up2_tile8:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left2_tile8:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tile8:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up3_tile8:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left3_tile8:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tile8:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up4_tile8:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left4_tile8:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tile8:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up5_tile8:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left5_tile8:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tile8:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up6_tile8:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left6_tile8:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tile8:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up7_tile8:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left7_tile8:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tile8:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up8_tile8:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left8_tile8:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tile8:	
		lockall
		compare 0x4055 0x3
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile8
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile8
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile8
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tile8:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up9_tile8:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left9_tile8:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x8
		releaseall
		end

.global EventScript_Rovine_Ancestrali_1_35_tile9		
EventScript_Rovine_Ancestrali_1_35_tile9:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tile9:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up0_tile9:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left0_tile9:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right0_tile9:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tile9:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up1_tile9:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left1_tile9:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right1_tile9:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tile9:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up2_tile9:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left2_tile9:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right2_tile9:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tile9:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up3_tile9:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left3_tile9:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right3_tile9:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tile9:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up4_tile9:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left4_tile9:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right4_tile9:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tile9:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up5_tile9:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left5_tile9:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right5_tile9:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tile9:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up6_tile9:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left6_tile9:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right6_tile9:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tile9:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up7_tile9:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left7_tile9:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right7_tile9:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tile9:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up8_tile9:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left8_tile9:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right8_tile9:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tile9:	
		lockall
		compare 0x4055 0x4
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile9
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile9
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile9
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tile9:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up9_tile9:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left9_tile9:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right9_tile9:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x9
		releaseall
		end

.global EventScript_Rovine_Ancestrali_1_35_tileA		
EventScript_Rovine_Ancestrali_1_35_tileA:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tileA:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up0_tileA:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left0_tileA:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right0_tileA:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tileA:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up1_tileA:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left1_tileA:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right1_tileA:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tileA:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up2_tileA:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left2_tileA:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right2_tileA:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tileA:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up3_tileA:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left3_tileA:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right3_tileA:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tileA:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up4_tileA:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left4_tileA:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right4_tileA:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tileA:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up5_tileA:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left5_tileA:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right5_tileA:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tileA:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up6_tileA:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left6_tileA:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right6_tileA:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tileA:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up7_tileA:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left7_tileA:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right7_tileA:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tileA:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up8_tileA:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left8_tileA:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right8_tileA:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tileA:	
		lockall
		compare 0x4055 0x5
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tileA
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tileA
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tileA
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tileA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tileA:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up9_tileA:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left9_tileA:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right9_tileA:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xA
		releaseall
		end
		
.global EventScript_Rovine_Ancestrali_1_35_tileB		
EventScript_Rovine_Ancestrali_1_35_tileB:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tileB:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up0_tileB:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left0_tileB:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right0_tileB:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tileB:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up1_tileB:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left1_tileB:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right1_tileB:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tileB:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up2_tileB:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left2_tileB:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right2_tileB:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tileB:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up3_tileB:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left3_tileB:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right3_tileB:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tileB:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up4_tileB:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left4_tileB:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right4_tileB:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tileB:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up5_tileB:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left5_tileB:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right5_tileB:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tileB:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up6_tileB:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left6_tileB:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right6_tileB:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tileB:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up7_tileB:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left7_tileB:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right7_tileB:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tileB:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up8_tileB:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left8_tileB:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right8_tileB:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tileB:	
		lockall
		compare 0x4055 0x6
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tileB
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tileB
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tileB
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tileB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tileB:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up9_tileB:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left9_tileB:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right9_tileB:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xB
		releaseall
		end

.global EventScript_Rovine_Ancestrali_1_35_tileC		
EventScript_Rovine_Ancestrali_1_35_tileC:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tileC:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up0_tileC:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right0_tileC:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tileC:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up1_tileC:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right1_tileC:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tileC:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up2_tileC:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right2_tileC:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tileC:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up3_tileC:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right3_tileC:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tileC:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up4_tileC:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right4_tileC:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tileC:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up5_tileC:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right5_tileC:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tileC:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up6_tileC:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right6_tileC:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tileC:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up7_tileC:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right7_tileC:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tileC:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up8_tileC:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right8_tileC:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tileC:	
		lockall
		compare 0x4055 0x7
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tileC
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tileC
		
		
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tileC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tileC:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up9_tileC:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right9_tileC:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xC
		releaseall
		end
		
.global EventScript_Rovine_Ancestrali_1_35_tileD		
EventScript_Rovine_Ancestrali_1_35_tileD:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tileD:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left0_tileD:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tileD:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left1_tileD:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tileD:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left2_tileD:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tileD:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left3_tileD:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tileD:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left4_tileD:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tileD:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left5_tileD:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tileD:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left6_tileD:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tileD:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left7_tileD:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tileD:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left8_tileD:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tileD:	
		lockall
		compare 0x4055 0x8
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tileD
		
		
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tileD
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tileD:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left9_tileD:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xD
		releaseall
		end
		
.global EventScript_Rovine_Ancestrali_1_35_tileE		
EventScript_Rovine_Ancestrali_1_35_tileE:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tileE:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up0_tileE:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left0_tileE:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right0_tileE:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tileE:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up1_tileE:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left1_tileE:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right1_tileE:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tileE:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up2_tileE:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left2_tileE:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right2_tileE:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tileE:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up3_tileE:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left3_tileE:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right3_tileE:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tileE:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up4_tileE:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left4_tileE:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right4_tileE:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tileE:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up5_tileE:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left5_tileE:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right5_tileE:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tileE:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up6_tileE:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left6_tileE:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right6_tileE:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tileE:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up7_tileE:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left7_tileE:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right7_tileE:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tileE:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up8_tileE:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left8_tileE:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right8_tileE:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tileE:	
		lockall
		compare 0x4055 0x9
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tileE
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tileE
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tileE
		compare 0x4055 0xD
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tileE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tileE:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up9_tileE:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left9_tileE:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right9_tileE:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xE
		releaseall
		end
	
.global EventScript_Rovine_Ancestrali_1_35_tileF		
EventScript_Rovine_Ancestrali_1_35_tileF:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tileF:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up0_tileF:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left0_tileF:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right0_tileF:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tileF:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up1_tileF:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left1_tileF:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right1_tileF:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tileF:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up2_tileF:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left2_tileF:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right2_tileF:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tileF:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up3_tileF:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left3_tileF:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right3_tileF:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tileF:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up4_tileF:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left4_tileF:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right4_tileF:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tileF:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up5_tileF:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left5_tileF:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right5_tileF:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tileF:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up6_tileF:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left6_tileF:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right6_tileF:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tileF:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up7_tileF:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left7_tileF:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right7_tileF:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tileF:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up8_tileF:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left8_tileF:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right8_tileF:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tileF:	
		lockall
		compare 0x4055 0xA
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tileF
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tileF
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tileF
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tileF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tileF:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up9_tileF:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left9_tileF:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right9_tileF:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0xF
		releaseall
		end
		
.global EventScript_Rovine_Ancestrali_1_35_tile10		
EventScript_Rovine_Ancestrali_1_35_tile10:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up0_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tile10:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up0_tile10:	
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left0_tile10:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right0_tile10:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up1_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tile10:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up1_tile10:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left1_tile10:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right1_tile10:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up2_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tile10:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up2_tile10:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left2_tile10:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right2_tile10:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up3_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tile10:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up3_tile10:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left3_tile10:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right3_tile10:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up4_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tile10:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up4_tile10:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left4_tile10:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right4_tile10:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up5_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tile10:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up5_tile10:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left5_tile10:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right5_tile10:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up6_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tile10:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up6_tile10:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left6_tile10:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right6_tile10:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up7_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tile10:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up7_tile10:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left7_tile10:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right7_tile10:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up8_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tile10:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up8_tile10:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left8_tile10:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right8_tile10:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tile10:	
		lockall
		compare 0x4055 0xB
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile10
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_up9_tile10
		compare 0x4055 0x11
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile10
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tile10:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_up9_tile10:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movU
		applymovement 0xA Rovine_Ancestrali_1_35_movU
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_left9_tile10:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right9_tile10:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x10
		releaseall
		end
		
.global EventScript_Rovine_Ancestrali_1_35_tile11		
EventScript_Rovine_Ancestrali_1_35_tile11:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tile11:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right0_tile11:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tile11:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right1_tile11:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tile11:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right2_tile11:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tile11:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right3_tile11:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tile11:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right4_tile11:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tile11:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right5_tile11:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tile11:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right6_tile11:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tile11:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right7_tile11:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tile11:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right8_tile11:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tile11:	
		lockall
		compare 0x4055 0xC
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile11
		
		
		
		
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile11
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tile11:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right9_tile11:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x11
		releaseall
		end
		
.global EventScript_Rovine_Ancestrali_1_35_tile12		
EventScript_Rovine_Ancestrali_1_35_tile12:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tile12:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left0_tile12:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tile12:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left1_tile12:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tile12:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left2_tile12:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tile12:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left3_tile12:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tile12:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left4_tile12:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tile12:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left5_tile12:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tile12:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left6_tile12:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tile12:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left7_tile12:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tile12:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left8_tile12:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tile12:	
		lockall
		compare 0x4055 0xE
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile12
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile12
		
		
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tile12:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left9_tile12:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x12
		releaseall
		end
		
.global EventScript_Rovine_Ancestrali_1_35_tile13		
EventScript_Rovine_Ancestrali_1_35_tile13:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left0_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tile13:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left0_tile13:	
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right0_tile13:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left1_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tile13:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left1_tile13:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right1_tile13:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left2_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tile13:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left2_tile13:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right2_tile13:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left3_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tile13:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left3_tile13:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right3_tile13:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left4_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tile13:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left4_tile13:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right4_tile13:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left5_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tile13:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left5_tile13:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right5_tile13:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left6_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tile13:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left6_tile13:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right6_tile13:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left7_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tile13:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left7_tile13:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right7_tile13:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left8_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tile13:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left8_tile13:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right8_tile13:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tile13:	
		lockall
		compare 0x4055 0xF
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile13
		
		
		compare 0x4055 0x14
		if 0x1 _goto Rovine_Ancestrali_1_35_left9_tile13
		compare 0x4055 0x12
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tile13:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_left9_tile13:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movL
		applymovement 0xA Rovine_Ancestrali_1_35_movL
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end
		
	Rovine_Ancestrali_1_35_right9_tile13:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x13
		releaseall
		end

.global EventScript_Rovine_Ancestrali_1_35_tile14		
EventScript_Rovine_Ancestrali_1_35_tile14:		
	lockall	
	applymovement 0xFF Rovine_Ancestrali_1_35_mov0	
	waitmovement 0xFF	
		
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
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down0_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right0_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down0_tile14:	
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right0_tile14:	
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0xA
		sound 0x22	
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE1______________________________________________________	
	Rovine_Ancestrali_1_35_start1_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto  Rovine_Ancestrali_1_35_down1_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right1_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down1_tile14:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right1_tile14:	
		applymovement 0x1 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x1
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE2______________________________________________________	
	Rovine_Ancestrali_1_35_start2_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down2_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right2_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down2_tile14:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right2_tile14:	
		applymovement 0x2 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x2
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE3______________________________________________________	
	Rovine_Ancestrali_1_35_start3_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down3_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right3_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down3_tile14:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right3_tile14:	
		applymovement 0x3 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x3
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE4______________________________________________________	
	Rovine_Ancestrali_1_35_start4_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down4_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right4_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down4_tile14:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right4_tile14:	
		applymovement 0x4 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x4
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE5______________________________________________________	
	Rovine_Ancestrali_1_35_start5_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down5_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right5_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down5_tile14:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right5_tile14:	
		applymovement 0x5 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x5
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE6______________________________________________________	
	Rovine_Ancestrali_1_35_start6_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down6_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right6_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down6_tile14:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right6_tile14:	
		applymovement 0x6 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x6
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE7______________________________________________________	
	Rovine_Ancestrali_1_35_start7_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down7_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right7_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down7_tile14:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right7_tile14:	
		applymovement 0x7 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x7
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE8______________________________________________________	
	Rovine_Ancestrali_1_35_start8_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down8_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right8_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down8_tile14:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right8_tile14:	
		applymovement 0x8 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x8
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
	//PIECE9______________________________________________________	
	Rovine_Ancestrali_1_35_start9_tile14:	
		lockall
		compare 0x4055 0x10
		if 0x1 _goto Rovine_Ancestrali_1_35_down9_tile14
		
		
		
		
		compare 0x4055 0x13
		if 0x1 _goto Rovine_Ancestrali_1_35_right9_tile14
		releaseall
		end
		
	Rovine_Ancestrali_1_35_down9_tile14:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movD
		applymovement 0xA Rovine_Ancestrali_1_35_movD
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	Rovine_Ancestrali_1_35_right9_tile14:	
		applymovement 0x9 Rovine_Ancestrali_1_35_movR
		applymovement 0xA Rovine_Ancestrali_1_35_movR
		waitmovement 0x9
		sound 0xC
		setvar 0x4055 0x14
		releaseall
		end
