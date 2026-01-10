.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Common_PC
EventScript_Common_PC:
    msgbox gText_Common_PC_text1 0x7
    end


//TV_randomized
.global EventScript_Common_TV
EventScript_Common_TV:
    random 0x14
    compare 0x800D 0x0 
    if 0x1 _call TV_1
    compare 0x800D 0x1 
    if 0x1 _call TV_2
    compare 0x800D 0x2 
    if 0x1 _call TV_3
    compare 0x800D 0x3 
    if 0x1 _call TV_4
    compare 0x800D 0x4 
    if 0x1 _call TV_5
    compare 0x800D 0x5 
    if 0x1 _call TV_6
    compare 0x800D 0x6 
    if 0x1 _call TV_7
    compare 0x800D 0x7 
    if 0x1 _call TV_8
    compare 0x800D 0x8
    if 0x1 _call TV_9
    compare 0x800D 0x9 
    if 0x1 _call TV_10
    compare 0x800D 0x10 
    if 0x1 _call TV_11
    compare 0x800D 0x11 
    if 0x1 _call TV_12
    compare 0x800D 0x12 
    if 0x1 _call TV_13
    compare 0x800D 0x13 
    if 0x1 _call TV_14
    end

    TV_1:
        msgbox gText_Common_TV_text1 0x7
        return

    TV_2:
        msgbox gText_Common_TV_text2 0x7
        return

    TV_3:
        msgbox gText_Common_TV_text3 0x7
        return

    TV_4:
        msgbox gText_Common_TV_text4 0x7
        return

    TV_5:
        msgbox gText_Common_TV_text5 0x7
        return

    TV_6:
        msgbox gText_Common_TV_text6 0x7
        return

    TV_7:
        msgbox gText_Common_TV_text7 0x7
        return

    TV_8:
        msgbox gText_Common_TV_text8 0x7
        return

    TV_9:
        msgbox gText_Common_TV_text9 0x7
        return

    TV_10:
        msgbox gText_Common_TV_text10 0x7
        return

    TV_11:
        msgbox gText_Common_TV_text11 0x7
        return

    TV_12:
        msgbox gText_Common_TV_text12 0x7
        return

    TV_13:
        msgbox gText_Common_TV_text13 0x7
        return

    TV_14:
        msgbox gText_Common_TV_text14 0x7
        return

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