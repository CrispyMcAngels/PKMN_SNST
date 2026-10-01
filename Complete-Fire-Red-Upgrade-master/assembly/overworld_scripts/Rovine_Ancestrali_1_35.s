.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Rovine Ancestrali puzzle (map 0.5). The player arrives invisible (0x501F = 0x12E) in the middle of the
@board and stays there; src/board_puzzle.c moves the cursor (NPC 0xA) and the pieces (NPCs 1-9) until
@the pieces form the picture. Their starting cells are set in vars 0x4056-0x405E by the sign in map 1.34.

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
			msgbox Rovine_Ancestrali_1_35_L_text1 0x7
			pause 0x1E
			fadescreen 0x2
			pause 0x1E
			msgbox Rovine_Ancestrali_1_35_L_text2 0x7
			closeonkeypress @Hide the text box before the puzzle (releaseall used to do it)
			setvar 0x4050 0x2
			callasm BoardPuzzle_StartRovine
			waitstate @Until it's solved
			pause 0x1E
			pause 0x1E
			setvar 0x4051 0x21
			setvar 0x4050 0x4
			setvar 0x501F 0x100
			msgbox Rovine_Ancestrali_1_35_SOL_text1 0x7
			closeonkeypress
			pause 0x1E
			warpmuted 0x1 0x22 0xFF 0x04 0x04
			releaseall
			end

