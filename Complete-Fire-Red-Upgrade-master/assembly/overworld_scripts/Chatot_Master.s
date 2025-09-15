.thumb
.align 2

.include "../xse_commands.s"
.include "../xse_defines.s"

.global EventScript_Chatot_Master
EventScript_Chatot_Master:
	lock
	faceplayer
	//capire come fare yes or no
	cry 0x1EE 0x0
	msgbox EventScript_Chatot_Master_texti MSG_YESNO
	compare 0x800D 0x1
	if 0x1 _goto EventScript_Chatot_Master_yes
	if 0x0 _goto EventScript_Chatot_Master_no
	release
	end

	EventScript_Chatot_Master_no:
	release
	end

	EventScript_Chatot_Master_yes:
	compare 0x4053 0x0
	if 0x1 _call EventScript_Chatot_Master_0
	compare 0x4053 0x1
	if 0x1 _call EventScript_Chatot_Master_1
	compare 0x4053 0x2
	if 0x1 _call EventScript_Chatot_Master_2
	compare 0x4053 0x3
	if 0x1 _call EventScript_Chatot_Master_3
	compare 0x4053 0x4
	if 0x1 _call EventScript_Chatot_Master_4
	compare 0x4053 0x5
	if 0x1 _call EventScript_Chatot_Master_5
	compare 0x4053 0x6
	if 0x1 _call EventScript_Chatot_Master_6
	compare 0x4053 0x7
	if 0x1 _call EventScript_Chatot_Master_7
	end

	EventScript_Chatot_Master_0:
		msgbox EventScript_Chatot_Master_text0 MSG_NORMAL
		cry 0x1EE 0x0
		release
		end

	EventScript_Chatot_Master_1:
		msgbox EventScript_Chatot_Master_text1 MSG_NORMAL
		cry 0x1EE 0x0
		release
		end

	EventScript_Chatot_Master_2:
		msgbox EventScript_Chatot_Master_text2 MSG_NORMAL
		cry 0x1EE 0x0
		release
		end

	EventScript_Chatot_Master_3:
		msgbox EventScript_Chatot_Master_text3 MSG_NORMAL
		cry 0x1EE 0x0
		release
		end

	EventScript_Chatot_Master_4:
		msgbox EventScript_Chatot_Master_text4 MSG_NORMAL
		cry 0x1EE 0x0
		release
		end

	EventScript_Chatot_Master_5:
		msgbox EventScript_Chatot_Master_text5 MSG_NORMAL
		cry 0x1EE 0x0
		release
		end

	EventScript_Chatot_Master_6:
		msgbox EventScript_Chatot_Master_text6 MSG_NORMAL
		cry 0x1EE 0x0
		release
		end

	EventScript_Chatot_Master_7:
		msgbox EventScript_Chatot_Master_text7 MSG_NORMAL
		cry 0x1EE 0x0
		release
		end