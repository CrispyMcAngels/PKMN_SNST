.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Roccavento 7.9: the post office. Roccavento hangs over the void, so its mail flies: Pokemon carry letters and parcels
@on the winds' currents. Its director, Nonno Zefiro, is named after a wind like the Monaci del Vento.

.equ FLAG_POSTMASTER_MET, 0x9A2

//___NPCs___

@Local ID 1 (npc 0): Nonno Zefiro, the old postmaster
.global EventScript_Roccavento_7_9_NPC0
EventScript_Roccavento_7_9_NPC0:
	lock
	faceplayer
	checkflag FLAG_POSTMASTER_MET
	if 0x1 _goto EventScript_Roccavento_7_9_NPC0_Again
	msgbox Roccavento_7_9_NPC0_text1 MSG_NORMAL
	msgbox Roccavento_7_9_NPC0_text2 MSG_NORMAL
	setflag FLAG_POSTMASTER_MET
	release
	end

EventScript_Roccavento_7_9_NPC0_Again:
	msgbox Roccavento_7_9_NPC0_text3 MSG_NORMAL
	release
	end

@Local ID 2 (npc 1): Pelipper, the veteran mail carrier
.global EventScript_Roccavento_7_9_NPC1
EventScript_Roccavento_7_9_NPC1:
	lock
	faceplayer
	cry 0x136 0x0 @SPECIES_PELIPPER
	msgbox Roccavento_7_9_NPC1_text1 MSG_NORMAL
	waitcry
	release
	end

@Local ID 3 (npc 2): Swablu, the apprentice from the Risaia Rosa
.global EventScript_Roccavento_7_9_NPC2
EventScript_Roccavento_7_9_NPC2:
	lock
	faceplayer
	cry 0x166 0x0 @SPECIES_SWABLU
	msgbox Roccavento_7_9_NPC2_text1 MSG_NORMAL
	waitcry
	release
	end

//___SIGNs___

@The notice board
.global EventScript_Roccavento_7_9_Sign0
EventScript_Roccavento_7_9_Sign0:
	msgbox Roccavento_7_9_Sign0_text1 MSG_SIGN
	end
