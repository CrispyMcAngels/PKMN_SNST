.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Roccavento 7.5: woodworking workshop

@The master craftsman gives the Black Flute once (flag 0x99D, set only once it is in the bag)
.global EventScript_Roccavento_7_5_NPC0
EventScript_Roccavento_7_5_NPC0:
	lock
	faceplayer
	checkflag 0x99D
	if 0x1 _goto EventScript_Roccavento_7_5_NPC0_Done
	msgbox Roccavento_7_5_NPC0_text1 MSG_NORMAL
	giveitem 0x2A 0x1 MSG_OBTAIN @Black Flute
	compare 0x800D 0x0
	if 0x1 _goto EventScript_Roccavento_7_5_NPC0_BagFull
	setflag 0x99D
	msgbox Roccavento_7_5_NPC0_text2 MSG_NORMAL
	release
	end

EventScript_Roccavento_7_5_NPC0_BagFull:
	msgbox Roccavento_7_5_NPC0_text_bagfull MSG_NORMAL
	release
	end

EventScript_Roccavento_7_5_NPC0_Done:
	msgbox Roccavento_7_5_NPC0_text3 MSG_NORMAL
	release
	end

.global EventScript_Roccavento_7_5_NPC1
EventScript_Roccavento_7_5_NPC1:
	lock
	faceplayer
	msgbox Roccavento_7_5_NPC1_text1 MSG_NORMAL
	release
	end

