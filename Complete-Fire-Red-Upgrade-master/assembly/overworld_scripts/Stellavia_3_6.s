.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

//___NPCs___

.global EventScript_Stellavia_3_6_NPC0
EventScript_Stellavia_3_6_NPC0:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC0_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC1
EventScript_Stellavia_3_6_NPC1:
	lock
	faceplayer
	cry 0x151 0x0
	msgbox Stellavia_3_6_NPC1_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC2
EventScript_Stellavia_3_6_NPC2:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC2_text1 MSG_NORMAL
	release
	end

//Ludicolo
.global EventScript_Stellavia_3_6_NPC3
EventScript_Stellavia_3_6_NPC3:
	lock
	faceplayer
	checkflag 0x1
	if 0x1 _goto EventScript_Stellavia_3_6_NPC3_P3
	cry 0x129 0x0
	textcolor 0x2
	msgbox Stellavia_3_6_NPC3_text1 MSG_NORMAL
	pause 0x1E
	showmoney 0x0 0x0 0x0
	msgbox Stellavia_3_6_NPC3_text2 MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Stellavia_3_6_NPC3_P1
	closeonkeypress
	hidemoney 0x0 0x0 
	release
	end

	EventScript_Stellavia_3_6_NPC3_P1:
		//script to remove the money
		checkmoney 0x1F4 0x0
		compare 0x800D 0x1
		if 0x4 _goto EventScript_Stellavia_3_6_NPC3_P2
		msgbox Stellavia_3_6_NPC3_text3 MSG_NORMAL
		hidemoney 0x0 0x0 
		release 
		end

	EventScript_Stellavia_3_6_NPC3_P2:
		removemoney 0x1f4 0x0
		updatemoney 0x0 0x0 0x0
		pause 0x1E
		hidemoney 0x0 0x0 
		getplayerpos 0x4001 0x4002
		compare 0x4001 0x17
		if 0x1 _call EventScript_Stellavia_3_6_NPC3_17_17
		compare 0x4001 0x19
		if 0x1 _call EventScript_Stellavia_3_6_NPC3_19_17
		compare 0x4002 0x16
		if 0x1 _call EventScript_Stellavia_3_6_NPC3_18_16
		compare 0x4002 0x18
		if 0x1 _call EventScript_Stellavia_3_6_NPC3_18_18
		pause 0x1E
		spriteface 0x4 0x1
		spriteface 0x5 0x1
		spriteface 0x6 0x2
		cry 0x129 0x0
		textcolor 0x2
		msgbox Stellavia_3_6_NPC3_text1 MSG_NORMAL
		pause 0x1E
		playsong 0x14A 0x0
		pause 0x2E
		applymovement 0x4 Stellavia_3_6_NPC3_mov4
		applymovement 0x5 Stellavia_3_6_NPC3_mov4
		waitmovement 0x4
		pause 0x1E
		fadedefault
		setflag 0x1
		release
		end

	EventScript_Stellavia_3_6_NPC3_P3:
		msgbox Stellavia_3_6_NPC3_text1 MSG_NORMAL
		release
		end


		EventScript_Stellavia_3_6_NPC3_17_17:
			applymovement 0xFF Stellavia_3_6_NPC3_mov1
			waitmovement 0xFF
			return

		EventScript_Stellavia_3_6_NPC3_19_17:
			applymovement 0xFF Stellavia_3_6_NPC3_mov1
			waitmovement 0xFF
			return

		EventScript_Stellavia_3_6_NPC3_18_16:
			applymovement 0xFF Stellavia_3_6_NPC3_mov2
			waitmovement 0xFF
			return

		EventScript_Stellavia_3_6_NPC3_18_18:
			applymovement 0xFF Stellavia_3_6_NPC3_mov3
			waitmovement 0xFF
			return

		Stellavia_3_6_NPC3_mov1:
			.byte 0x10
			.byte 0x10
			.byte 0x1 
			.byte 0xFE

		Stellavia_3_6_NPC3_mov2:
			.byte 0x13
			.byte 0x10
			.byte 0x10
			.byte 0x10
			.byte 0x1 
			.byte 0xFE

		Stellavia_3_6_NPC3_mov3:
			.byte 0x12
			.byte 0x10
			.byte 0x1 
			.byte 0xFE

		Stellavia_3_6_NPC3_mov4:
			.byte 0x21
			.byte 0x21
			.byte 0x2 
			.byte 0x19
			.byte 0x1 
			.byte 0x19
			.byte 0x3 
			.byte 0x19
			.byte 0x0 
			.byte 0x1A
			.byte 0x21
			.byte 0x21
			.byte 0x12
			.byte 0x19
			.byte 0x1 
			.byte 0x19
			.byte 0x3 
			.byte 0x19
			.byte 0x0 
			.byte 0x1A
			.byte 0x21
			.byte 0x21
			.byte 0x13
			.byte 0x19
			.byte 0x1 
			.byte 0x19
			.byte 0x2 
			.byte 0x19
			.byte 0x0 
			.byte 0xFE

.global EventScript_Stellavia_3_6_NPC4
EventScript_Stellavia_3_6_NPC4:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC4_text1 MSG_NORMAL
	release
	end

//bambina davanti a Ludicolo
.global EventScript_Stellavia_3_6_NPC5
EventScript_Stellavia_3_6_NPC5:
	lock
	faceplayer
	checkflag 0x1
	if 0x1 _goto EventScript_Stellavia_3_6_NPC5_P1
	msgbox Stellavia_3_6_NPC5_text1 MSG_NORMAL
	release
	end

	EventScript_Stellavia_3_6_NPC5_P1:
		checkflag 0x97D
		if 0x0 _call EventScript_Stellavia_3_6_NPC5_P2
		msgbox Stellavia_3_6_NPC5_text3 MSG_NORMAL
		release
		end

		EventScript_Stellavia_3_6_NPC5_P2:
			msgbox Stellavia_3_6_NPC5_text2 MSG_NORMAL
			pause 0x1E
			giveitem 0x44 0x1 MSG_OBTAIN
			setflag 0x97D
			return

.global EventScript_Stellavia_3_6_NPC6
EventScript_Stellavia_3_6_NPC6:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC6_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC7
EventScript_Stellavia_3_6_NPC7:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC7_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC8
EventScript_Stellavia_3_6_NPC8:
	lock
	faceplayer
	cry 0x173 0x0
	msgbox Stellavia_3_6_NPC8_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC9
EventScript_Stellavia_3_6_NPC9:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC9_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC11
EventScript_Stellavia_3_6_NPC11:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC11_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC12
EventScript_Stellavia_3_6_NPC12:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC12_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC14
EventScript_Stellavia_3_6_NPC14:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC14_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC15
EventScript_Stellavia_3_6_NPC15:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC15_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC16
EventScript_Stellavia_3_6_NPC16:
	lock
	faceplayer
	cry 0x120 0x0
	msgbox Stellavia_3_6_NPC16_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC17
EventScript_Stellavia_3_6_NPC17:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC17_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC18
EventScript_Stellavia_3_6_NPC18:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC18_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC19
EventScript_Stellavia_3_6_NPC19:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC19_text1 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC20
EventScript_Stellavia_3_6_NPC20:
	lock
	faceplayer
	cry 0x44 0x0
	textcolor 0x2
	msgbox Stellavia_3_6_NPC20_text1 MSG_NORMAL
	pause 0x1E
	textcolor 0x0
	msgbox Stellavia_3_6_NPC20_text2 MSG_NORMAL
	release
	end

.global EventScript_Stellavia_3_6_NPC22
EventScript_Stellavia_3_6_NPC22:
	lock
	faceplayer
	msgbox Stellavia_3_6_NPC22_text1 MSG_NORMAL
	checkflag 0x97E
	if 0x1 _goto EventScript_Stellavia_3_6_NPC22_P1
	release
	end

	EventScript_Stellavia_3_6_NPC22_P1:
		pause 0x1E
		msgbox Stellavia_3_6_NPC22_text2 MSG_NORMAL
		pause 0x1E
		msgbox Stellavia_3_6_NPC22_text3 MSG_YESNO
		compare 0x800D 0x1
		if 0x1 _goto EventScript_Stellavia_3_6_NPC22_P2
		closeonkeypress
		pause 0x1E
		applymovement 0x17 Stellavia_3_6_NPC22_mov1
		waitmovement 0x17
		msgbox Stellavia_3_6_NPC22_text5 MSG_NORMAL		
		release
		end

		Stellavia_3_6_NPC22_mov1:
			.byte 0x62
			.byte 0xFE


		EventScript_Stellavia_3_6_NPC22_P2:
			closeonkeypress
			msgbox Stellavia_3_6_NPC22_text4 MSG_NORMAL
			setvar 0x4060 0x8
			warp 0xA 0x2 0xFF 0x06 0xA
			release
			end


.global EventScript_Stellavia_3_6_NPC23
EventScript_Stellavia_3_6_NPC23:
	lock
	faceplayer
	checkflag 0x981
	if 0x1 _goto EventScript_Stellavia_3_6_NPC23_P3
	checkflag 0x980
	if 0x1 _goto EventScript_Stellavia_3_6_NPC23_P1
	msgbox Stellavia_3_6_NPC23_text1 MSG_NORMAL
	pause 0x1E
	msgbox Stellavia_3_6_NPC23_text2 MSG_NORMAL
	showpokepic 0x306 0xA 0x5 
	pause 0x1E
	special 0x15A
	pause 0x1E
	msgbox Stellavia_3_6_NPC23_text3 MSG_NORMAL
	pause 0x1E
	fanfare 0x0102
	textcolor 0x2
	msgbox Mission_Received_text1 MSG_NORMAL
	setflag 0x980
	release
	end

	EventScript_Stellavia_3_6_NPC23_P1:
		msgbox Stellavia_3_6_NPC23_text4 MSG_NORMAL
		setvar 0x8003 0x0
		setvar 0x8004 0x0
		special2 0x800D 0x18
		compare 0x800D 0x306
		If 0x1 _goto EventScript_Stellavia_3_6_NPC23_P2
		setvar 0x8004 0x1
		special2 0x800D 0x18
		compare 0x800D 0x306
		If 0x1 _goto EventScript_Stellavia_3_6_NPC23_P2
		setvar 0x8004 0x2
		special2 0x800D 0x18
		compare 0x800D 0x306
		If 0x1 _goto EventScript_Stellavia_3_6_NPC23_P2
		setvar 0x8004 0x3
		special2 0x800D 0x18
		compare 0x800D 0x306
		If 0x1 _goto EventScript_Stellavia_3_6_NPC23_P2
		setvar 0x8004 0x4
		special2 0x800D 0x18
		compare 0x800D 0x306
		If 0x1 _goto EventScript_Stellavia_3_6_NPC23_P2
		setvar 0x8004 0x5
		special2 0x800D 0x18
		compare 0x800D 0x306
		If 0x1 _goto EventScript_Stellavia_3_6_NPC23_P2
		msgbox Stellavia_3_6_NPC23_text5 MSG_NORMAL
		release
		end

		EventScript_Stellavia_3_6_NPC23_P2:
			getplayerpos 0x4001 0x4002
			compare 0x4001 0x32
			if 0x1 _call Stellavia_3_6_NPC23_P2_mov1
			compare 0x4001 0x33
			if 0x1 _call Stellavia_3_6_NPC23_P2_mov2
			spriteface 0x18 0x1
			pause 0x1E
			createsprite 0x5C 0x1A 0x33 0x14 0x0 0x1
			pause 0x1E
			hidesprite 0x1A
			createsprite 0x86 0x19 0x33 0x14 0x41 0x2
			cry 0x306 0x0
			pause 0x1E
			applymovement 0x18 Stellavia_3_6_NPC22_mov1
			waitmovement 0x18
			msgbox Stellavia_3_6_NPC23_text6 MSG_NORMAL			
			pause 0x1E
			msgbox Stellavia_3_6_NPC23_text7 MSG_NORMAL	
			pause 0x1E
			fadescreen 0x3
			sound 0x6
			fadescreen 0x2
			pause 0x1E
			pause 0x25
			createsprite 0x5C 0x1A 0x33 0x14 0x0 0x1
			pause 0x1E
			hidesprite 0x19
			pause 0x1E
			hidesprite 0x1A
			applymovement 0x18 Stellavia_3_6_NPC23_mov3
			waitmovement 0x18
			msgbox Stellavia_3_6_NPC23_text8 MSG_NORMAL
			pause 0x1E
			giveitem 0x2A1 0x1 MSG_OBTAIN
			pause 0x1E
			msgbox Stellavia_3_6_NPC23_text9 MSG_NORMAL
			setflag 0x981
			hidesprite 0x19
			fanfare 0x0103
			textcolor 0x2
			msgbox Mission_Completed_text1 MSG_NORMAL		
			release
			end


			Stellavia_3_6_NPC23_P2_mov1:
				applymovement 0xFF Stellavia_3_6_NPC23_mov1
				waitmovement 0xFF
				return

				Stellavia_3_6_NPC23_mov1:
					.byte 0x10
					.byte 0x3 
					.byte 0xFE


			Stellavia_3_6_NPC23_P2_mov2:
				applymovement 0xFF Stellavia_3_6_NPC23_mov2
				waitmovement 0xFF
				return

				Stellavia_3_6_NPC23_mov2:
					.byte 0x12
					.byte 0x3 
					.byte 0xFE

				Stellavia_3_6_NPC23_mov3:
					.byte 0x10
					.byte 0x2 
					.byte 0xFE

		EventScript_Stellavia_3_6_NPC23_P3:
			msgbox Stellavia_3_6_NPC23_text9 MSG_NORMAL
			release
			end


.global EventScript_Stellavia_3_6_NPC25
EventScript_Stellavia_3_6_NPC25:
	giveitem 0x22 0x1 MSG_FIND
	end

.global EventScript_Stellavia_3_6_NPC26
EventScript_Stellavia_3_6_NPC26:
	giveitem 0x49 0x1 MSG_FIND
	end

.global EventScript_Stellavia_3_6_NPC27
EventScript_Stellavia_3_6_NPC27:
	giveitem 0x34 0x1 MSG_FIND
	end

//____SIGNS____

.global EventScript_Stellavia_3_6_Sign0
EventScript_Stellavia_3_6_Sign0:
	msgbox Stellavia_3_6_SIGN0 0x7
	end
	
.global EventScript_Stellavia_3_6_Sign1
EventScript_Stellavia_3_6_Sign1:
	msgbox Stellavia_3_6_SIGN1 0x7
	end
	
.global EventScript_Stellavia_3_6_Sign2
EventScript_Stellavia_3_6_Sign2:
	msgbox Stellavia_3_6_SIGN2 0x7
	end
	
.global EventScript_Stellavia_3_6_Sign4
EventScript_Stellavia_3_6_Sign4:
	msgbox Stellavia_3_6_SIGN4 0x7
	end

.global EventScript_Stellavia_3_6_Sign5
EventScript_Stellavia_3_6_Sign5:
	msgbox Stellavia_3_6_SIGN5 0x7
	end

.global EventScript_Stellavia_3_6_Sign7
EventScript_Stellavia_3_6_Sign7:
	msgbox Stellavia_3_6_SIGN7 0x7
	end

.global EventScript_Stellavia_3_6_Sign8
EventScript_Stellavia_3_6_Sign8:
	msgbox Stellavia_3_6_SIGN8 0x7
	end

.global EventScript_Stellavia_3_6_Sign9
EventScript_Stellavia_3_6_Sign9:
	msgbox Stellavia_3_6_SIGN9 0x7
	end

.global EventScript_Stellavia_3_6_Sign10
EventScript_Stellavia_3_6_Sign10:
	msgbox Stellavia_3_6_SIGN10 0x7
	end

.global EventScript_Stellavia_3_6_Sign11
EventScript_Stellavia_3_6_Sign11:
	msgbox Stellavia_3_6_SIGN11 0x7
	end

.global EventScript_Stellavia_3_6_Sign12
EventScript_Stellavia_3_6_Sign12:
	msgbox Stellavia_3_6_SIGN12 0x7
	end

.global EventScript_Stellavia_3_6_Sign13
EventScript_Stellavia_3_6_Sign13:
	msgbox Stellavia_3_6_SIGN13 0x7
	end

.global EventScript_Stellavia_3_6_Sign15
EventScript_Stellavia_3_6_Sign15:
	msgbox Stellavia_3_6_SIGN15 0x7
	end

.global EventScript_Stellavia_3_6_Sign16
EventScript_Stellavia_3_6_Sign16:
	msgbox Stellavia_3_6_SIGN16 0x7
	end

.global EventScript_Stellavia_3_6_Sign17
EventScript_Stellavia_3_6_Sign17:
	msgbox Stellavia_3_6_SIGN17 0x7
	end

.global EventScript_Stellavia_3_6_Sign18
EventScript_Stellavia_3_6_Sign18:
	msgbox Stellavia_3_6_SIGN18 0x7
	end
	
.global EventScript_Stellavia_3_6_Sign19
EventScript_Stellavia_3_6_Sign19:
	msgbox Stellavia_3_6_SIGN19_text1 0x7
	pause 0x1E
	msgbox Stellavia_3_6_SIGN19_text2 0x7
	end

.global EventScript_Stellavia_3_6_Sign24
EventScript_Stellavia_3_6_Sign24:
	msgbox Stellavia_3_6_SIGN19_text1 0x7
	pause 0x1E
	checkflag 0x98C
	if 0x0 _goto EventScript_Stellavia_3_6_Sign24_P1
	msgbox Stellavia_3_6_SIGN19_text2 0x7
	end

	EventScript_Stellavia_3_6_Sign24_P1:
		applymovement 0xFF Stellavia_3_6_NPC22_mov1
		waitmovement 0xFF
		msgbox Stellavia_3_6_SIGN19_text3 0x7
		pause 0x1E
		giveitem 0x4B 0x1 MSG_FIND
		setflag 0x98C
		end

.global EventScript_Stellavia_3_6_Sign25
EventScript_Stellavia_3_6_Sign25:
	msgbox Stellavia_3_6_SIGN19_text1 0x7
	pause 0x1E
	checkflag 0x98D
	if 0x0 _goto EventScript_Stellavia_3_6_Sign25_P1
	msgbox Stellavia_3_6_SIGN19_text2 0x7
	end

	EventScript_Stellavia_3_6_Sign25_P1:
		applymovement 0xFF Stellavia_3_6_NPC22_mov1
		waitmovement 0xFF
		msgbox Stellavia_3_6_SIGN19_text3 0x7
		pause 0x1E
		giveitem 0x4C 0x1 MSG_FIND
		setflag 0x98D
		end

.global EventScript_Stellavia_3_6_Sign26
EventScript_Stellavia_3_6_Sign26:
	msgbox Stellavia_3_6_SIGN19_text1 0x7
	pause 0x1E
	checkflag 0x98E
	if 0x0 _goto EventScript_Stellavia_3_6_Sign26_P1
	msgbox Stellavia_3_6_SIGN19_text2 0x7
	end

	EventScript_Stellavia_3_6_Sign26_P1:
		applymovement 0xFF Stellavia_3_6_NPC22_mov1
		waitmovement 0xFF
		msgbox Stellavia_3_6_SIGN19_text3 0x7
		pause 0x1E
		giveitem 0x4D 0x1 MSG_FIND
		setflag 0x98E
		end