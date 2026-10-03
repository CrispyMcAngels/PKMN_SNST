.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"


//___LEVEL___

.global gMapScripts_Roccavento_3_3
gMapScripts_Roccavento_3_3:
    mapscript MAP_SCRIPT_ON_FRAME_TABLE Roccavento_3_3_MapScriptOnFrame
	mapscript MAP_SCRIPT_ON_LOAD Roccavento_3_3_MapScriptOnLoad
	mapscript MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE Roccavento_3_3_MapScriptOnWarpIntoMapTable
    .byte MAP_SCRIPT_TERMIN

	Roccavento_3_3_MapScriptOnWarpIntoMapTable:
		levelscript 0x4051, 0x4C, Roccavento_3_3_MapScriptOnWarpIntoMapTableBegin
		.hword MAP_SCRIPT_TERMIN

		Roccavento_3_3_MapScriptOnWarpIntoMapTableBegin:
			spriteface 0xFF 0x4
			end	

	Roccavento_3_3_MapScriptOnLoad:
		compare 0x4051 0x4C
		if 0x1 _call Roccavento_3_3_MapScriptOnLoad_1
		end

		Roccavento_3_3_MapScriptOnLoad_1:
			movesprite2 0xD 0x45 0x2C
			movesprite2 0xE 0x47 0x2C
			return

	Roccavento_3_3_MapScriptOnFrame:
		levelscript 0x4051, 0x4C, Roccavento_3_3_MapScriptOnFrameBegin
		.hword MAP_SCRIPT_TERMIN

		Roccavento_3_3_MapScriptOnFrameBegin:
			pause 0x1E
			applymovement 0xD Roccavento_3_3_MapScriptOnFrame_mov1
			waitmovement 0xD
			sound 0x15
			pause 0x1E			
			show_mugshot CRISPY
			msgbox Roccavento_3_3_MapScriptOnFrame_text1 MSG_NORMAL
			special 0x15A
			pause 0x25			
			spriteface 0xD 0x2
			pause 0x1E
			show_mugshot CRISPY
			msgbox Roccavento_3_3_MapScriptOnFrame_text2 MSG_NORMAL
			special 0x15A
			pause 0x25			
			spriteface 0xD 0x3
			pause 0x1E
			show_mugshot CRISPY
			msgbox Roccavento_3_3_MapScriptOnFrame_text3 MSG_NORMAL
			special 0x15A
			pause 0x25		
			applymovement 0xD mov_exclamation
			waitmovement 0xD
			sound 0x15
			pause 0x1E
			show_mugshot CRISPY
			msgbox Roccavento_3_3_MapScriptOnFrame_text4 MSG_NORMAL
			special 0x15A
			pause 0x1E
			show_mugshot CRISPY
			msgbox Roccavento_3_3_MapScriptOnFrame_text5 MSG_NORMAL
			special 0x15A
			setvar 0x4051 0x4D
			releaseall
			end

			Roccavento_3_3_MapScriptOnFrame_mov1:
				.byte 0x1C
				.byte 0x1 
				.byte 0x1C
				.byte 0x3 
				.byte 0x1C
				.byte 0x0 
				.byte 0x1C
				.byte 0x2 
				.byte 0x1A
				.byte 0x62
				.byte 0xFE

//___NPCs___

@The old man who owns the farmers' market: a shop that stays on the map (src/overworld_shop.c, shop 0).
@The stock is listed beside the money box; the quantity is picked like in a mart.
.global EventScript_Roccavento_3_3_NPC0
EventScript_Roccavento_3_3_NPC0:
	lock
	faceplayer
	preparemsg Roccavento_3_3_NPC0_text1
	waitmsg
	showmoney 0x0 0x0
	setvar 0x8005 0x0 @Shop 0: Roccavento farmers' market
	callasm OverworldShop_Open

	Roccavento_3_3_NPC0_Shop:
		setvar 0x8000 0x80 @OVERWORLD_SHOP_LIST: the open shop's stock
		setvar 0x8001 0x5 @Items shown at once
		setvar 0x8004 0x0 @Special 0x158 is only CFRU's scrolling multichoice when 0x8004 is 0
		special 0x158
		waitstate
		compare 0x800D 0x7F
		if 0x1 _goto Roccavento_3_3_NPC0_Leave
		copyvar 0x8005 0x800D
		callasm OverworldShop_SelectItem @[BUFFER1] = item
		compare 0x800D 0x0
		if 0x1 _goto Roccavento_3_3_NPC0_NoMoney
		compare 0x800D 0x2
		if 0x1 _goto Roccavento_3_3_NPC0_BagFull
		preparemsg Roccavento_3_3_NPC0_text_howmany
		waitmsg
		callasm OverworldShop_ChooseQuantity @[BUFFER2] = quantity, [BUFFER3] = total price
		waitstate
		compare 0x800D 0x0
		if 0x1 _goto Roccavento_3_3_NPC0_Again
		msgbox Roccavento_3_3_NPC0_text_confirm MSG_YESNO
		compare 0x800D 0x0
		if 0x1 _goto Roccavento_3_3_NPC0_Again
		callasm OverworldShop_Buy
		compare 0x800D 0x0
		if 0x1 _goto Roccavento_3_3_NPC0_BagFull
		updatemoney 0x0 0x0
		sound 0xF8 @SE_MONEY, as in the mart
		msgbox Roccavento_3_3_NPC0_text_thanks MSG_NORMAL

	Roccavento_3_3_NPC0_Again:
		preparemsg Roccavento_3_3_NPC0_text_more
		waitmsg
		goto Roccavento_3_3_NPC0_Shop

	Roccavento_3_3_NPC0_NoMoney:
		msgbox Roccavento_3_3_NPC0_text_nomoney MSG_NORMAL
		goto Roccavento_3_3_NPC0_Again

	Roccavento_3_3_NPC0_BagFull:
		msgbox Roccavento_3_3_NPC0_text_bagfull MSG_NORMAL
		goto Roccavento_3_3_NPC0_Again

	Roccavento_3_3_NPC0_Leave:
		callasm OverworldShop_Close
		hidemoney 0x0 0x0
		msgbox Roccavento_3_3_NPC0_text2 MSG_NORMAL
		release
		end

@Local ID 2: bald man in a dark robe, near the west bridge
.global EventScript_Roccavento_3_3_NPC1
EventScript_Roccavento_3_3_NPC1:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC1_text1 MSG_NORMAL
	release
	end

@Local ID 13: Crispy, after the cutscene. PLACEHOLDER text
.global EventScript_Roccavento_3_3_NPC12
EventScript_Roccavento_3_3_NPC12:
	lock
	faceplayer
	show_mugshot CRISPY
	msgbox Roccavento_3_3_NPC12_text1 MSG_NORMAL
	special 0x15A
	release
	end

.global EventScript_Roccavento_3_3_NPC2
EventScript_Roccavento_3_3_NPC2:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC2_text1 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_3_3_NPC3
EventScript_Roccavento_3_3_NPC3:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC3_text1 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_3_3_NPC5
EventScript_Roccavento_3_3_NPC5:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC5_text1 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_3_3_NPC14
EventScript_Roccavento_3_3_NPC14:
	lock
	faceplayer
	msgbox Roccavento_3_3_NPC14_text1 MSG_NORMAL
	release
	end


//___SIGNs___


