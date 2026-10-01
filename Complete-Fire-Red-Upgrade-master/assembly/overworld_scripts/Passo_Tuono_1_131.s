.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Passo Tuono band puzzle (map 0.22). The player arrives invisible (0x501F = 0x12E) and stays where they
@are; src/board_puzzle.c moves the cursor (NPC 1) from band to band and scrolls the bands (NPCs 2-9, two
@per band) until the faces under the cursor are in the right order.
@0x4054 = band under the cursor, 0x4055-0x4058 = position of each band (0 = lowest).

//___LEVEL___

.global gMapScripts_Passo_Tuono_1_131
gMapScripts_Passo_Tuono_1_131:
	mapscript MAP_SCRIPT_ON_FRAME_TABLE Passo_Tuono_1_131_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

	Passo_Tuono_1_131_MapScriptOnFrame:
		levelscript 0x4052, 7, Passo_Tuono_1_131_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Passo_Tuono_1_131_MapScriptOnFrameBegin:
			lockall
			compare 0x4051 0x43
			if 0x1 _goto Passo_Tuono_1_131_MapScriptOnFrameBegin_P1
			releaseall
			end

			Passo_Tuono_1_131_MapScriptOnFrameBegin_P1:
				//bottom half of each band under its top half
				movesprite 0x3 0x4 0xF
				movesprite 0x5 0x6 0xF
				movesprite 0x7 0x8 0xF
				movesprite 0x9 0xA 0xF
				pause 0x1E
				show_mugshot PLAYER
				msgbox Passo_Tuono_1_131_text1 MSG_NORMAL
				special 0x15A
				closeonkeypress @Hide the text box before the puzzle (releaseall used to do it)
				pause 0x1E
				//every band at its lowest position
				setvar 0x4055 0x0
				setvar 0x4056 0x0
				setvar 0x4057 0x0
				setvar 0x4058 0x0
				//block level
				setvar 0x4052 0x8
				callasm BandPuzzle_StartPassoTuono
				waitstate @Until it's solved

//____SOLVED_____

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
				show_mugshot PLAYER
				msgbox Passo_Tuono_1_131_text2 MSG_NORMAL
				special 0x15A
				setvar 0x4051 0x44
				pause 0x1E
				//reactivate level script var
				setvar 0x4052 0x7
				fadescreen 0x3
				//put correct OW sprite
				setvar 0x501F 0x100
				fadescreen 0x2
				warpmuted 0x0 0x19 0xFF 0x6 0x4
				releaseall
				end
