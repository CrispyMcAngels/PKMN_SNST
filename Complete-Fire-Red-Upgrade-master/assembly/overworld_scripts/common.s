.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Common_PC
EventScript_Common_PC:
    msgbox gText_Common_PC_text1 0x7
    end


//CUT
.global EventScript_Common_Cut
EventScript_Common_Cut:
    lockall
    checkflag 0x820 @ Patch Badge, Gym 1
    if 0x0 _goto EventScript_Common_CutFillerText
    special 0x10A @ Check if party Pokemon can learn Cut
    compare 0x8004 0x6
    if 0x1 _goto EventScript_Common_CutFillerText
    setanimation 0x0 0x8004 @ Show Pokeball raising animation
    bufferpartypokemon 0x0 0x8004 @ Store first Pokemon compatible with Cut
    bufferattack 0x1 0xF @ Store Cut attack name
    msgbox gText_Common_PokemonUsedHM MSG_KEEPOPEN
    closeonkeypress
    doanimation 0x2
    waitstate
    applymovement LASTTALKED m_CutTree
    waitmovement LASTTALKED
    hidesprite LASTTALKED
    releaseall
	end

EventScript_Common_CutFillerText:
    msgbox gText_Common_CuttableTree MSG_SIGN
    releaseall
	end

m_CutTree: .byte cut_tree, end_m