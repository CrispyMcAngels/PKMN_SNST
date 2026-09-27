.thumb
.align 2


.include "../xse_commands.s"
.include "../xse_defines.s"
  
.global Script_SaveGame

Script_SaveGame:
  pause 0x20
  special 0x5D
  waitstate 
  compare 0x800D 0x1
  if 0x0 _goto Script_CallStartMenu
  closemessage
  end 

.global Script_CallStartMenu
Script_CallStartMenu:
  callasm StartMenu_Init +1
  end 
  
.global Script_Retire

Script_Retire:
   callasm 0x080A0F3D
   end

.global Script_Quests

Script_Quests:
  pause 0x20
  callasm SideQuests_Open +1 @ src/side_quests
  waitstate
  end

.global Script_TimeEchoes

Script_TimeEchoes:
  pause 0x20
  callasm TimeEchoes_Main +1 @ src/time_echoes
  waitstate
  end
