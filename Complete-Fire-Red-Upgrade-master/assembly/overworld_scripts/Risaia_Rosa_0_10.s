.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

@Risaia Rosa, the farmhouse (0.10, door at (28,49) of 3.50)

//___NPCs___

@npc 0: the lady of the house, cooking: her pink risotto heals the party, as often as the player wants
@(like the mother in FireRed: there's no Pokemon Center near the Risaia)
.global EventScript_Risaia_Rosa_0_10_NPC0
EventScript_Risaia_Rosa_0_10_NPC0:
	lock
	faceplayer
	msgbox Risaia_Rosa_0_10_NPC0_text1 MSG_YESNO
	compare 0x800D 0x0
	if 0x1 _goto EventScript_Risaia_Rosa_0_10_NPC0_No
	closeonkeypress
	fadescreen 0x1
	fanfare 0x100 @The healing jingle
	waitfanfare
	special 0x0 @Heals the party
	fadescreen 0x0
	msgbox Risaia_Rosa_0_10_NPC0_text2 MSG_NORMAL
	release
	end

EventScript_Risaia_Rosa_0_10_NPC0_No:
	msgbox Risaia_Rosa_0_10_NPC0_text3 MSG_NORMAL
	release
	end

//___SIGNs___

@sign 0: a well-thumbed romance novel on the shelf
.global EventScript_Risaia_Rosa_0_10_Sign0
EventScript_Risaia_Rosa_0_10_Sign0:
	msgbox Risaia_Rosa_0_10_Sign0_text1 MSG_SIGN
	msgbox Risaia_Rosa_0_10_Sign0_text2 MSG_SIGN
	end
