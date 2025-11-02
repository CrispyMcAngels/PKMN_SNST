.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//TILES

.global EventScript_Passo_Tuono_1_3_tile0
EventScript_Passo_Tuono_1_3_tile0:
	lockall
	applymovement 0x7 Passo_Tuono_1_3_tile0_mov1
	waitmovement 0x7
	pause 0x1E
	textcolor 0x0
	msgbox Passo_Tuono_1_3_tile0_text1 MSG_NORMAL	
	setvar 0x4051 0x40
	releaseall
	end

	Passo_Tuono_1_3_tile0_mov1:
		.byte 0x2 
		.byte 0x1B
		.byte 0x62
		.byte 0x1B
		.byte 0x12
		.byte 0x12
		.byte 0x0 
		.byte 0xFE


//____ROCKSs
.global EventScript_Passo_Tuono_1_3_NPC0
EventScript_Passo_Tuono_1_3_NPC0:
	lock
	//Questa roccia emana una strana energia 
	msgbox Passo_Tuono_1_3_NPC1_text1 MSG_NORMAL
	getplayerpos 0x4001 0x4002
	compare 0x4002 0x15
	if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC0_MOVE 
	compare 0x4002 0x13
	if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC0_MOVE
	release
	end

		EventScript_Passo_Tuono_1_3_NPC0_MOVE:
			pause 0x1E
			//vuoi provare a spingerla?
			msgbox Passo_Tuono_1_3_NPC1_text2 MSG_YESNO	
			compare 0x800D 0x1
			if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC0_YES
			release
			end

			EventScript_Passo_Tuono_1_3_NPC0_YES:
				getplayerpos 0x4001 0x4002
				compare 0x4002 0x15
				if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC0_MOVE_UP 
				compare 0x4002 0x13
				if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC0_MOVE_DOWN
				release
				end
				
				EventScript_Passo_Tuono_1_3_NPC0_MOVE_UP:
					applymovement 0xFF Passo_Tuono_1_3_NPC0_movUP 
					waitmovement 0xFF
					sound 0xC
					applymovement 0x1 Passo_Tuono_1_3_NPC0_mov1
					waitmovement 0x1
					sound 0xC
					release
					end

				EventScript_Passo_Tuono_1_3_NPC0_MOVE_DOWN:
					applymovement 0xFF Passo_Tuono_1_3_NPC0_movDOWN
					waitmovement 0xFF
					sound 0xC
					applymovement 0x1 Passo_Tuono_1_3_NPC0_mov2
					waitmovement 0x1
					sound 0xC
					release
					end

				Passo_Tuono_1_3_NPC0_movUP:
					.byte 0x22
					.byte 0xFE

				Passo_Tuono_1_3_NPC0_movDOWN:
					.byte 0x21
					.byte 0xFE

				Passo_Tuono_1_3_NPC0_mov1:
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0x11
					.byte 0xFE

				Passo_Tuono_1_3_NPC0_mov2:
					.byte 0x10
					.byte 0x10
					.byte 0x10
					.byte 0xFE

.global EventScript_Passo_Tuono_1_3_NPC1
EventScript_Passo_Tuono_1_3_NPC1:
	lock
	//Questa roccia emana una strana energia 
	msgbox Passo_Tuono_1_3_NPC1_text1 MSG_NORMAL
	getplayerpos 0x4001 0x4002
	compare 0x4001 0x0E
	if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC1_MOVE_0
	release
	end

EventScript_Passo_Tuono_1_3_NPC1_MOVE_0:
	compare 0x4002 0x19
	if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC1_MOVE 
	compare 0x4002 0x17
	if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC1_MOVE
	release
	end

	EventScript_Passo_Tuono_1_3_NPC1_MOVE:
		pause 0x1E
		//vuoi provare a spingerla?
		msgbox Passo_Tuono_1_3_NPC1_text2 MSG_YESNO	
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC1_YES
		release
		end

		EventScript_Passo_Tuono_1_3_NPC1_YES:
			getplayerpos 0x4001 0x4002
			compare 0x4002 0x19
			if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC1_MOVE_UP 
			compare 0x4002 0x17
			if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC1_MOVE_DOWN
			release
			end
			
			EventScript_Passo_Tuono_1_3_NPC1_MOVE_UP:
				applymovement 0xFF Passo_Tuono_1_3_NPC0_movUP 
				waitmovement 0xFF
				sound 0xC
				applymovement 0x2 Passo_Tuono_1_3_NPC1_mov1
				waitmovement 0x2
				sound 0xC
				release
				end

			EventScript_Passo_Tuono_1_3_NPC1_MOVE_DOWN:
				applymovement 0xFF Passo_Tuono_1_3_NPC0_movDOWN
				waitmovement 0xFF
				sound 0xC
				applymovement 0x2 Passo_Tuono_1_3_NPC1_mov2
				waitmovement 0x2
				sound 0xC
				release
				end


			Passo_Tuono_1_3_NPC1_mov1:
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0x11
				.byte 0xFE

			Passo_Tuono_1_3_NPC1_mov2:
				.byte 0x10
				.byte 0xFE

.global EventScript_Passo_Tuono_1_3_NPC2
EventScript_Passo_Tuono_1_3_NPC2:
	lock
	//Questa roccia emana una strana energia 
	msgbox Passo_Tuono_1_3_NPC1_text1 MSG_NORMAL
	getplayerpos 0x4001 0x4002
	compare 0x4001 0x13
	if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC2_MOVE 
	compare 0x4001 0x15
	if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC2_MOVE
	release
	end

	EventScript_Passo_Tuono_1_3_NPC2_MOVE:
		pause 0x1E
		//vuoi provare a spingerla?
		msgbox Passo_Tuono_1_3_NPC1_text2 MSG_YESNO	
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC2_YES
		release
		end

		EventScript_Passo_Tuono_1_3_NPC2_YES:
			getplayerpos 0x4001 0x4002
			compare 0x4001 0x13
			if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC2_MOVE_RIGHT
			compare 0x4001 0x15
			if 0x1 _goto EventScript_Passo_Tuono_1_3_NPC2_MOVE_LEFT
			release
			end
			
			EventScript_Passo_Tuono_1_3_NPC2_MOVE_RIGHT:
				applymovement 0xFF Passo_Tuono_1_3_NPC0_movRIGHT
				waitmovement 0xFF
				sound 0xC
				applymovement 0x3 Passo_Tuono_1_3_NPC2_mov1
				waitmovement 0x3
				sound 0xC
				release
				end

			EventScript_Passo_Tuono_1_3_NPC2_MOVE_LEFT:
				applymovement 0xFF Passo_Tuono_1_3_NPC0_movLEFT
				waitmovement 0xFF
				sound 0xC
				applymovement 0x3 Passo_Tuono_1_3_NPC2_mov2
				waitmovement 0x3
				sound 0xC
				release
				end


			Passo_Tuono_1_3_NPC2_mov1:
				.byte 0x13
				.byte 0x13
				.byte 0x13
				.byte 0xFE

			Passo_Tuono_1_3_NPC2_mov2:
				.byte 0x12
				.byte 0x12
				.byte 0x12
				.byte 0xFE

			Passo_Tuono_1_3_NPC0_movRIGHT:
				.byte 0x24
				.byte 0xFE

			Passo_Tuono_1_3_NPC0_movLEFT:
				.byte 0x23
				.byte 0xFE

//NORMAL NPCs 

//placeholder - trainer 1 - avventuriero
.global EventScript_Passo_Tuono_1_3_NPC3
EventScript_Passo_Tuono_1_3_NPC3:
	trainerbattle0 0x0 0x39 0x0 Passo_Tuono_1_3_NPC3_text1 Passo_Tuono_1_3_NPC3_text2
	msgbox Passo_Tuono_1_3_NPC3_text3 MSG_NORMAL
	end


//placeholder - trainer 2 - operaio
.global EventScript_Passo_Tuono_1_3_NPC4
EventScript_Passo_Tuono_1_3_NPC4:
	trainerbattle0 0x0 0x3A 0x0 Passo_Tuono_1_3_NPC4_text1 Passo_Tuono_1_3_NPC4_text2
	msgbox Passo_Tuono_1_3_NPC4_text3 MSG_NORMAL
	end


//placeholder - trainer 3 - combat girl
.global EventScript_Passo_Tuono_1_3_NPC5
EventScript_Passo_Tuono_1_3_NPC5:
	trainerbattle0 0x0 0x3B 0x0 Passo_Tuono_1_3_NPC5_text1 Passo_Tuono_1_3_NPC5_text2
	msgbox Passo_Tuono_1_3_NPC5_text3 MSG_NORMAL
	end
	

//placeholder - NPc6 - sceinziato che avvisa delle rocce
.global EventScript_Passo_Tuono_1_3_NPC6
EventScript_Passo_Tuono_1_3_NPC6:
	lock
	faceplayer
	msgbox Passo_Tuono_1_3_NPC6_text1 MSG_NORMAL
	release
	end
	
	
//placeholder - NPc11 - operario
.global EventScript_Passo_Tuono_1_3_NPC11
EventScript_Passo_Tuono_1_3_NPC11:
	lock
	faceplayer 
	msgbox Passo_Tuono_1_3_NPC11_text1 MSG_NORMAL
	release
	end

.global EventScript_Passo_Tuono_1_3_Sign2
EventScript_Passo_Tuono_1_3_Sign2:
	lockall
	compare 0x4051 0x3E
	if 0x1 _goto EventScript_Passo_Tuono_1_3_Sign2_3E
	compare 0x4051 0x3F
	if 0x1 _goto EventScript_Passo_Tuono_1_3_Sign2_3F
	compare 0x4051 0x40
	if 0x1 _goto EventScript_Passo_Tuono_1_3_Sign2_40
	compare 0x4051 0x40
	if 0x1 _goto EventScript_Passo_Tuono_1_3_Sign2_40
	msgbox Passo_Tuono_1_3_Sign2_text1 0x7
	releaseall
	end

EventScript_Passo_Tuono_1_3_Sign2_3E:
	msgbox Passo_Tuono_1_3_Sign2_text_3E 0x7
	releaseall
	end

EventScript_Passo_Tuono_1_3_Sign2_3F:
	msgbox Passo_Tuono_1_3_Sign2_text_3F 0x7
	releaseall
	end

EventScript_Passo_Tuono_1_3_Sign2_40:
	msgbox Passo_Tuono_1_3_Sign2_text_40 0x7
	releaseall
	end



.global EventScript_Passo_Tuono_1_3_Sign3
EventScript_Passo_Tuono_1_3_Sign3:
	msgbox Passo_Tuono_1_3_Sign3_text1 0x7
	end