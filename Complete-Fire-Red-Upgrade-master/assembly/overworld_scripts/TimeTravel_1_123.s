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
			compare 0x4051 0x53
			//back to Risaia Rosa
			if 0x1 _goto TimeTravel_1_123_MapScriptOnFrame_T_ECHO_2_AFTER			
			compare 0x4067 0x2
			if 0x1 _goto TimeTravel_1_123_MapScriptOnFrame_T_ECHO_2
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
				show_mugshot PLAYER	
				msgbox TimeTravel_1_123_text1 MSG_NORMAL
				special 0x15A
				pause 0x1E
				show_mugshot PLAYER	
				msgbox TimeTravel_1_123_text1a MSG_NORMAL
				special 0x15A
				pause 0x1E
				show_mugshot PLAYER
				
				msgbox TimeTravel_1_123_text1b MSG_NORMAL
				special 0x15A
				pause 0x1E
				show_mugshot PLAYER
				
				msgbox TimeTravel_1_123_text1c MSG_NORMAL
				special 0x15A
				pause 0x1E
				show_mugshot PLAYER
				
				msgbox TimeTravel_1_123_text1d MSG_NORMAL
				special 0x15A	
				pause 0x1E
				pause 0x1E
				pause 0x1E
				show_mugshot PLAYER
				
				msgbox TimeTravel_1_123_text2 MSG_NORMAL
				special 0x15A
				pause 0x1E
				pause 0x1E
				fadescreen 0x3
				pause 0x1E
				pause 0x1E
				show_mugshot PLAYER
				
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
				show_mugshot PLAYER
				
				msgbox TimeTravel_1_123_text4 MSG_NORMAL
				special 0x15A
				pause 0x1E
				pause 0x1E
				pause 0x1E
				show_mugshot PLAYER
				
				msgbox TimeTravel_1_123_text5 MSG_NORMAL
				special 0x15A
				pause 0x78
				show_mugshot PLAYER
				
				msgbox TimeTravel_1_123_text6 MSG_NORMAL
				special 0x15A
				pause 0x28
				fadescreen 0x3
				pause 0xB4
				show_mugshot PLAYER
				
				msgbox TimeTravel_1_123_text7 MSG_NORMAL
				special 0x15A

				setvar 0x501F 0x100
				warpmuted 0x1 0x26 0xFF 0x9 0x7
				releaseall
				end

			TimeTravel_1_123_MapScriptOnFrame_T_ECHO_2:
				pause 0x50
				show_mugshot PLAYER
				msgbox TimeTravel_1_123_t_echo_2_text1 MSG_NORMAL
				special 0x15A	
				setvar 0x501F 0x155
				setvar 0x4050 0x0
				pause 0x30
				fadescreen 0x3
				pause 0x24
				playsong 0x0 
				writebytetooffset 0x30 0x4000012
				msgbox Dark_Future_32_3_text7a 0x7
				writebytetooffset 0x0 0x4000012
				setvar 0x500E 0x5
				spriteface 0xFF 0x1
				warpteleport 0x20 0x3 0xFF 0x2 0x2
				releaseall
				end

			TimeTravel_1_123_MapScriptOnFrame_T_ECHO_2_AFTER:
				pause 0x60
				show_mugshot PLAYER
				msgbox TimeTravel_1_123_t_echo_2_text2 MSG_NORMAL
				special 0x15A	
				pause 0x40
				show_mugshot PLAYER
				msgbox TimeTravel_1_123_t_echo_2_text3 MSG_NORMAL
				special 0x15A	
				pause 0x30
				show_mugshot PLAYER
				msgbox TimeTravel_1_123_t_echo_2_text4 MSG_NORMAL
				special 0x15A	
				pause 0x30
				show_mugshot PLAYER
				msgbox TimeTravel_1_123_t_echo_2_text5 MSG_NORMAL
				special 0x15A	
				pause 0x30
				spriteface 0xFF 0x1
				//set normal OW sprite
				setvar 0x501F 0x100
				
				warpteleport 0x03 0x32 0xFF 0xF 0x13
				releaseall
				end				

