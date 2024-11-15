.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global gMapScripts_Monte_Remoto_2_27
gMapScripts_Monte_Remoto_2_27:
    mapscript MAP_SCRIPT_ON_LOAD MonteRemoto_2_27_MapScriptOnLoad
    mapscript MAP_SCRIPT_ON_FRAME_TABLE MonteRemoto_2_27_MapScriptOnFrame
    .byte MAP_SCRIPT_TERMIN

MonteRemoto_2_27_MapScriptOnLoad:
    checkflag 0x230
    if 0x1 _call MonteRemoto_2_27_MapScriptOnLoad_sepmaptile_1
    compare 0x4051 0x9
    if 0x1 _call MonteRemoto_2_27_MapScriptOnLoad_moveHo_oh
    end

MonteRemoto_2_27_MapScriptOnLoad_sepmaptile_1:
    setmaptile 0x0A 0x12 0x0001 0x0
    setmaptile 0x0B 0x12 0x0001 0x0
    setmaptile 0x0D 0x12 0x0001 0x0
    setmaptile 0x0E 0x12 0x02EA 0x0

    setmaptile 0x0A 0x13 0x0001 0x0
    setmaptile 0x0B 0x13 0x0001 0x0
    setmaptile 0x0C 0x13 0x0001 0x0
    setmaptile 0x0D 0x13 0x0001 0x0
    setmaptile 0x0E 0x13 0x0001 0x0

    setmaptile 0x0A 0x14 0x0001 0x0
    setmaptile 0x0B 0x14 0x0035 0x0
    setmaptile 0x0C 0x14 0x0036 0x0
    setmaptile 0x0D 0x14 0x0037 0x0
    setmaptile 0x0E 0x14 0x0001 0x0

    setmaptile 0x0B 0x15 0x0057 0x0
    setmaptile 0x0C 0x15 0x004E 0x0
    setmaptile 0x0D 0x15 0x0047 0x0

    setmaptile 0x0B 0x16 0x003E 0x0
    setmaptile 0x0C 0x16 0x003F 0x0
    setmaptile 0x0D 0x16 0x0001 0x0

    setmaptile 0x0B 0x17 0x004F 0x0
    setmaptile 0x0C 0x17 0x003F 0x0
    setmaptile 0x0D 0x17 0x0001 0x0
    return

MonteRemoto_2_27_MapScriptOnLoad_moveHo_oh:
    movesprite2 0x1 0xC 0xF
    return


MonteRemoto_2_27_MapScriptOnFrame:
    levelscript 0x4050, 1, MonteRemoto_2_27_MapScriptOnFrameBegin
    .hword MAP_SCRIPT_TERMIN

MonteRemoto_2_27_MapScriptOnFrameBegin:
    lockall
    compare 0x4051 0x1
    if 0x1 _call MonteRemoto_2_27_MapScriptOnFrameBegin_Part1
    compare 0x4051 0x2
    if 0x1 _call MonteRemoto_2_27_MapScriptOnFrameBegin_Part2
    compare 0x4051 0x9
    if 0x1 _call MonteRemoto_2_27_MapScriptOnFrameBegin_Part3
    compare 0x4051 0xA
    if 0x1 _call MonteRemoto_2_27_MapScriptOnFrameBegin_Part4
    compare 0x4051 0xB
    if 0x1 _call MonteRemoto_2_27_MapScriptOnFrameBegin_Part5
    releaseall
    end

MonteRemoto_2_27_MapScriptOnFrameBegin_Part1:
    playsong 0x0112 0x1

    pause 0x1E
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text1 MSG_NORMAL
    pause 0x1E

    sound 0x09

    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov1
    waitmovement 0x0

    special 0x113
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov1a
    waitmovement 0x0

    showpokepic 0x3AB 0x0 0x6
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text2 MSG_NORMAL
    special 0x15A

    //Crono si guarda attorno
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov2
    waitmovement 0x0

    showpokepic 0x3AB 0x0 0x6
    //Il tramonto d'altronde...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text3 MSG_NORMAL
    special 0x15A

    //camera move up a far vedere il tramonto
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov3
    waitmovement 0x0 

    showpokepic 0x3AB 0x0 0x6
    //...Incantevole...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text4 MSG_NORMAL
    special 0x15A

    //camera move down di nuovo alla statua
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov4
    waitmovement 0x0 

    showpokepic 0x3AB 0x0 0x6
    //Chi l'avrebbe mai detto...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text5 MSG_NORMAL
    special 0x15A

    pause 0x1E

    showpokepic 0x3AB 0x0 0x6
    //Fermare il tempo...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text6 MSG_NORMAL
    special 0x15A

    pause 0x1E

    showpokepic 0x3AB 0x0 0x6
    //Il tempo e' il tiranno...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text7 MSG_NORMAL
    special 0x15A

    //crono pausa e look down
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov5
    waitmovement 0x0 

    showpokepic 0x3AB 0x0 0x6
    //Io, Crono...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text8 MSG_NORMAL
    special 0x15A

    //Crono and player move up
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov6
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov7
    waitmovement 0x0

    pause 0x1E

    showpokepic 0x3AB 0x0 0x6
    //Da allora...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text9 MSG_NORMAL
    special 0x15A

    fadescreen 0x1
    //transizione al passato
    playsong 0x0000 0x1
    writebytetooffset 0x30 0x4000012
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text10 MSG_NORMAL
    writebytetooffset 0x0 0x4000012
    setvar 0x4051 0x2
    setflag 0x230
    //inserire effetto seppia
    writebytetooffset 0x2 0x2036E28
    warpmuted 0x2 0x1B 0xFF 0x0C 0x0B

    fadescreen 0x0
    
    return


MonteRemoto_2_27_MapScriptOnFrame_mov1:
    .byte 0x11
    .byte 0x11
    .byte 0x13
    .byte 0x13
    .byte 0x11
    .byte 0x13
    .byte 0x13
    .byte 0x11
    .byte 0x13
    .byte 0x13
    .byte 0x13
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov1a:
    .byte 0x11
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov2:
    .byte 0x1A
    .byte 0x1C
    .byte 0x2
    .byte 0x1A
    .byte 0x1C
    .byte 0x3 
    .byte 0x1A
    .byte 0x1C
    .byte 0x1 
    .byte 0x1A
    .byte 0x1C
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov3:
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov4:
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov5:
    .byte 0x1A
    .byte 0x0 
    .byte 0x1A
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov6:
    .byte 0x12
    .byte 0x12
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x13
    .byte 0x13
    .byte 0x11
    .byte 0x11
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov7:
    .byte 0xD
    .byte 0xD
    .byte 0xD
    .byte 0xD
    .byte 0xD
    .byte 0xD
    .byte 0xD
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov8:
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrameBegin_Part2:
    special 0x113
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov9
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov10
    waitmovement 0x0
    pause 0x1E
    pause 0x1E
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov11
    waitmovement 0x0

    showpokepic 0x3AB 0x0 0x6
    //La fine del mio viaggio e' vicina...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text11 MSG_NORMAL
    special 0x15A

    pause 0x1E
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov12
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov13
    waitmovement 0x0
    pause 0x1E
    pause 0x1E

    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov14
    waitmovement 0x0
    createsprite 0x65 0x06 0x0B 0x10 0x1 0x0
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov15
    waitmovement 0x0
    createsprite 0x65 0x07 0x0D 0x10 0x1 0x0
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov16
    waitmovement 0x0

    showpokepic 0x3AB 0x0 0x6
    //Grazie alla fiamma...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text12 MSG_NORMAL
    special 0x15A   
    pause 0x1E
    showpokepic 0x3AB 0x0 0x6
    //Oh guardiano del tempo
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text13 MSG_NORMAL
    special 0x15A
    pause 0x1E

    fadescreen 0x3
    cry 0xFA 0x0
    fadescreen 0x2

    cry 0xFA 0x0
    movesprite 0x1 0x0C 0x0E
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text15 MSG_NORMAL
    pause 0x1E

    showpokepic 0x3AB 0x0 0x6
    //Ed ora diventa mio!
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text16 MSG_NORMAL
    special 0x15A   
    pause 0x1E
    cry 0xFA 0x0
    applymovement 0x1 MonteRemoto_2_27_MapScriptOnFrame_mov17
    waitmovement 0x0
    pause 0x1E

    showpokepic 0x3AB 0x0 0x6
    //Attraverso il potere...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text17 MSG_NORMAL
    special 0x15A 
    pause 0x1E
    setweather 0x5
    doweather
    pause 0x1E
    //Crono face down e !!
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov18
    waitmovement 0x0
    pause 0x1E
    showpokepic 0x3AB 0x0 0x6
    //Ma che?\pNon è possibile...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text18 MSG_NORMAL
    special 0x15A
    pause 0x1E
    showpokepic 0x3AB 0x0 0x6
    //Sta arrivando qualcuno...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text19 MSG_NORMAL
    special 0x15A
    pause 0x1E

    //Camera move down
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov19
    waitmovement 0x0
    pause 0x1E

    //arrivo uomo mascherato
    sound 0x09
    movesprite 0x2 0x0C 0x21
    pause 0x1E
    pause 0x1E

    showpokepic 0x3ac 0x0 0x6
    //...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text20 MSG_NORMAL
    special 0x15A

    pause 0x1E

    createsprite 0x5C 0x8 0x0B 0x21 0x7 0x0
    createsprite 0x5C 0x9 0x0C 0x20 0x7 0x0
    createsprite 0x5C 0xA 0x0D 0x21 0x7 0x0

    showpokepic 0x3ac 0x0 0x6
    //Rilascio
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text21 MSG_NORMAL
    special 0x15A
    pause 0x1E
    hidesprite 0x4
    setvar 0x4050 0x0
    warpmuted 0x2 0x3C 0xFF 0x07 0x05
    return

MonteRemoto_2_27_MapScriptOnFrame_mov9:
    .byte 0xC 
    .byte 0xC 
    .byte 0xC 
    .byte 0xC 
    .byte 0xC 
    .byte 0xC 
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov10:
    .byte 0x60
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x1 
    .byte 0x61
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov11:
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov12:
    .byte 0x11
    .byte 0x11
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov13:
    .byte 0x11
    .byte 0x11
    .byte 0x1
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov14:
    .byte 0x1C
    .byte 0x2 
    .byte 0x1C
    .byte 0x1C
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov15:
    .byte 0x1C
    .byte 0x3 
    .byte 0x1C
    .byte 0x1C
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov16:
    .byte 0x1C
    .byte 0x1C
    .byte 0x1
    .byte 0x1C
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov17:
    .byte 0x10
    .byte 0xFE


MonteRemoto_2_27_MapScriptOnFrame_mov18:
    .byte 0x0 
    .byte 0x1B
    .byte 0x65
    .byte 0x1C
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov19:
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrameBegin_Part3:
    setweather 0x5
    doweather
    pause 0x1E
    
    //Camera move down
    special 0x113
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov20
    waitmovement 0x0
    pause 0x1E

    //arrivo Raikou
    pause 0x1E
    cry 0xF3 0x0  
    movesprite 0x3 0x0A 0x14
    pause 0x1E

    //arrivo Suicune
    pause 0x1E
    cry 0xF5 0x0  
    movesprite 0x4 0x0E 0x14
    pause 0x1E

    //arrivo Entei
    pause 0x1E
    cry 0xF4 0x0  
    movesprite 0x5 0x0C 0x16
    pause 0x1E
    pause 0x1E
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov21
    waitmovement 0x0

    showpokepic 0x3AB 0x0 0x6
    //Dannazione...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text22 MSG_NORMAL
    special 0x15A
    pause 0x1E
    pause 0x1E
    showpokepic 0x3AB 0x0 0x6
    //Sconfiggili
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text23 MSG_NORMAL
    special 0x15A

    //Ho-oh fa il suo verso e si sposta in avanti
    pause 0x1E
    cry 0xFA 0x0
    applymovement 0x1 MonteRemoto_2_27_MapScriptOnFrame_mov22
    waitmovement 0x0
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text15 MSG_NORMAL

    //Raikou attacca
    pause 0x1E
    cry 0xF3 0x0
    applymovement 0x3 MonteRemoto_2_27_MapScriptOnFrame_mov23
    waitmovement 0x0
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text24 MSG_NORMAL

    //Suicune attacca
    pause 0x1E
    cry 0xF5 0x0
    applymovement 0x4 MonteRemoto_2_27_MapScriptOnFrame_mov24
    waitmovement 0x0
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text25 MSG_NORMAL

    //Entei attacca
    pause 0x1E
    cry 0xF4 0x0
    applymovement 0x5 MonteRemoto_2_27_MapScriptOnFrame_mov25
    waitmovement 0x0
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text26 MSG_NORMAL

    //Urlo Oh-oh
    pause 0x1E
    cry 0xFA 0x0
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text15 MSG_NORMAL

    //Crono speech

    pause 0x1E
    showpokepic 0x3AB 0x0 0x6
    //Non capisco
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text27 MSG_NORMAL
    special 0x15A


    //terremoto

    setvar 0x8004 0xF  
    setvar 0x8005 0xF  
    setvar 0x8006 0xF  
    setvar 0x8007 0xF
    special 0x136
    sound 0xC
    showpokepic 0x3AB 0x0 0x6
    //Non capisco
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text28 MSG_NORMAL
    special 0x15A

    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov26
    waitmovement 0x0



    //tutto bianco
    sound 0xC
    fadescreen 0x3
    cry 0xFA 0x0
    clearflag 0x230
    setvar 0x4051 0xA
    pause 0x1E
    pause 0x1E
    warpmuted 0x2 0x1B 0xFF 0x0C 0x12

    return

MonteRemoto_2_27_MapScriptOnFrame_mov20:
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov21:
    .byte 0x52
    .byte 0x52
    .byte 0x1C
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov22:
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov23:
    .byte 0x17
    .byte 0x12
    .byte 0x3 
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov24:
    .byte 0x16
    .byte 0x13
    .byte 0x2 
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov25:
    .byte 0x15
    .byte 0x10
    .byte 0x1 
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov26:
    .byte 0x1D
    .byte 0x1D
    .byte 0x21
    .byte 0x21
    .byte 0x65
    .byte 0xFE


MonteRemoto_2_27_MapScriptOnFrameBegin_Part4:
    setweather 0x5
    doweather
    pause 0x1E
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov27
    waitmovement 0x0
    pause 0x1E

    showpokepic 0x3AB 0x0 0x6
    //Non capisco
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text29 MSG_NORMAL
    special 0x15A

    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov28
    waitmovement 0x0
    pause 0x1E

    showpokepic 0x3AB 0x0 0x6
    //Non ho altra scelta...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text30 MSG_NORMAL
    special 0x15A

    special 0x113
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov29
    waitmovement 0x0    


    //schermo nero e ritorno al presente

    fadescreen 0x1
    writebytetooffset 0x0 0x2036E28
    setvar 0x4051 0xB
    writebytetooffset 0x30 0x4000012
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text31 MSG_NORMAL
    writebytetooffset 0x0 0x4000012

    warpmuted 0x2 0x1B 0xFF 0x0C 0x10
    
    
    return

MonteRemoto_2_27_MapScriptOnFrame_mov27:
    .byte 0x1F
    .byte 0x1F
    .byte 0x1D
    .byte 0x1D
    .byte 0x1D
    .byte 0x55
    .byte 0x55
    .byte 0x65
    .byte 0x1D
    .byte 0x1D
    .byte 0x20
    .byte 0x20
    .byte 0x20
    .byte 0x20
    .byte 0x1E
    .byte 0x1E
    .byte 0x54
    .byte 0x54
    .byte 0x65
    .byte 0x1D
    .byte 0x1D
    .byte 0x1F
    .byte 0x1F
    .byte 0x1 
    .byte 0x64
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov28:
    .byte 0x2 
    .byte 0x1C
    .byte 0x1C
    .byte 0x0 
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov29:
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0xFE


MonteRemoto_2_27_MapScriptOnFrameBegin_Part5:
    playsong 0x0112 0x1
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov30
    waitmovement 0x0

    showpokepic 0x3AB 0x0 0x6
    //Ebbene si...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text32 MSG_NORMAL
    special 0x15A

    pause 0x1E
    sound 0x09
    pause 0x1E
    pause 0x1E
    movesprite 0x6 0x0A 0x17
    applymovement 0x6 MonteRemoto_2_27_MapScriptOnFrame_mov31
    waitmovement 0x0

    pause 0x1E
    showpokepic 0x3ad 0x15 0x6
    //Steven...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text33 MSG_NORMAL
    special 0x15A

    //crono look down
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov32
    waitmovement 0x0

    pause 0x1E
    showpokepic 0x3AB 0x0 0x6
    //Eccellente steven...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text34 MSG_NORMAL
    special 0x15A

    pause 0x1E
    showpokepic 0x3ad 0x15 0x6
    //Sissignore
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text35 MSG_NORMAL
    special 0x15A
    
    pause 0x1E
    //steven goes away
    applymovement 0x6 MonteRemoto_2_27_MapScriptOnFrame_mov33
    waitmovement 0x0
    hidesprite 0x6
    sound 0x09
    pause 0x1E

    //crono looks up
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov30
    waitmovement 0x0

    pause 0x1E
    showpokepic 0x3AB 0x0 0x6
    //A presto...
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text36 MSG_NORMAL
    special 0x15A

    pause 0x1E
    //crono goes away
    special 0x113
    applymovement 0xFF MonteRemoto_2_27_MapScriptOnFrame_mov34
    waitmovement 0x0   

    pause 0x1E
    sound 0x09
    pause 0x1E
    pause 0x1E

    fadedefault
    playsong 0x0115 0x0
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov35
    waitmovement 0x0   

    msgbox MonteRemoto_2_27_MapScriptOnFrame_text37 MSG_NORMAL
    pause 0x1E
    applymovement 0x7F MonteRemoto_2_27_MapScriptOnFrame_mov36
    waitmovement 0x0   
    playsong 0x116 0x0
    showpokepic 0x3AE 0x2 0x1
    showpokepic 0x3AF 0xA 0x1
    showpokepic 0x3B0 0x12 0x1
    showpokepic 0x3B1 0x6 0x7
    showpokepic 0x3B2 0xE 0x7
    pause 0x1E
    pause 0x1E
    applymovement 0x7 MonteRemoto_2_27_MapScriptOnFrame_mov37
    waitmovement 0x0
    special 0x15A
    special 0x15A
    special 0x15A
    special 0x15A
    special 0x15A
    fadescreen 0x1
    writebytetooffset 0x30 0x4000012
    setvar 0x4051 0xC
    msgbox MonteRemoto_2_27_MapScriptOnFrame_text38 MSG_NORMAL
    pause 0x1E
    setvar 0x501F 0x0100
    writebytetooffset 0x0 0x4000012
    warpmuted 0x4 0x1 0xFF 0x4 0x6
    fadescreen 0x0
    return


MonteRemoto_2_27_MapScriptOnFrame_mov30:
    .byte 0x1 
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov31:
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x13
    .byte 0x13
    .byte 0x01
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov32:
    .byte 0x0
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov33:
    .byte 0x12
    .byte 0x12
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov34:
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x12
    .byte 0x12
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0x10
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov35:
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov36:
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0x11
    .byte 0xFE

MonteRemoto_2_27_MapScriptOnFrame_mov37:
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x12
    .byte 0x60
    .byte 0xFE
