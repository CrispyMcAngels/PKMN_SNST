.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_TimeTravel_1_123
gMapScripts_TimeTravel_1_123:
	mapscript MAP_SCRIPT_ON_FRAME_TABLE TimeTravel_1_123_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	TimeTravel_1_123_MapScriptOnFrame:
		levelscript 0x4052, 6, TimeTravel_1_123_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		TimeTravel_1_123_MapScriptOnFrameBegin:
			compare 0x4051 0x3D
			if 0x1 _goto TimeTravel_1_123_MapScriptOnFrameBegin_P1
			compare 0x4051 0x3E
			if 0x1 _goto TimeTravel_1_123_MapScriptOnFrameBegin_P2
			releaseall
			end

			TimeTravel_1_123_MapScriptOnFrameBegin_P1:
				pause 0x1E
				pause 0x1E
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text1 MSG_NORMAL
				special 0x15A
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text1a MSG_NORMAL
				special 0x15A
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text1b MSG_NORMAL
				special 0x15A
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text1c MSG_NORMAL
				special 0x15A
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text1d MSG_NORMAL
				special 0x15A	
				pause 0x1E
				pause 0x1E
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text2 MSG_NORMAL
				special 0x15A
				pause 0x1E
				pause 0x1E
				fadescreen 0x3
				pause 0x1E
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text3 MSG_NORMAL
				special 0x15A
				setvar 0x501F 0x149
				pause 0x1E
				pause 0x1E
				warpmuted 0x1 0x2 0xFF 0x0A 0x0C
				releaseall
				end

			TimeTravel_1_123_MapScriptOnFrameBegin_P2:
				pause 0x1E
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text4 MSG_NORMAL
				special 0x15A
				pause 0x1E
				pause 0x1E
				pause 0x1E
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text5 MSG_NORMAL
				special 0x15A
				pause 0x78
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text6 MSG_NORMAL
				special 0x15A
				pause 0x28
				fadescreen 0x3
				pause 0xB4
				compare 0x5026 0x0
				if 0x1 _call Player_Blue
				compare 0x5026 0x88
				if 0x1 _call Player_Orange
				compare 0x5026 0x85
				if 0x1 _call Player_Green	
				textcolor 0x0
				msgbox TimeTravel_1_123_text7 MSG_NORMAL
				special 0x15A

				compare 0x5026 0x0
				if 0x1 _call blue_z
				compare 0x5026 0x88
				if 0x1 _call orange_z
				compare 0x5026 0x85
				if 0x1 _call green_z	
				releaseall
				end

				blue_z:
					setvar 0x501F 0x100
					warpmuted 0x1 0x26 0xFF 0x9 0x7
					releaseall
					end

				orange_z:
					setvar 0x501F 0x1a3
					warpmuted 0x1 0x26 0xFF 0x9 0x7
					releaseall
					end

				green_z:
					setvar 0x501F 0x1a4
					warpmuted 0x1 0x26 0xFF 0x9 0x7
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

