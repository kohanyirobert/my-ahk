#NoEnv
#Warn
#SingleInstance, Force

WS_EX_TRANSPARENT = 0x20

PreventTaskBarAutoShow := 1

if (PreventTaskBarAutoShow)
{
  Gui, Margin , 0, 0
  Gui, Add, Progress, w%A_ScreenWidth% h%A_ScreenHeight%
  Gui, +LastFound -Caption +AlwaysOnTop +ToolWindow -Border -Disabled -SysMenu
  WinSet, ExStyle, +%WS_EX_TRANSPARENT%
  Winset, Transparent, 0
  Gui, Show, NoActivate
}
return

#IfWinActive ahk_exe chrome.exe
^d::
{
  Send, ^j ; Open Downloads
  Send, ^w ; Close active tab - should be Downloads at this point
  return
}
#IfWinActive

RCtrl::RWin
RAlt & Tab::^!Tab
!Pause::Media_Play_Pause
!PrintScreen::Media_Prev
!Delete::Media_Next