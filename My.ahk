#NoEnv
#Warn
#SingleInstance, Force

#IfWinActive ahk_exe chrome.exe
^d::
{
  Send, ^j ; Open Downloads
  Send, ^w ; Close active tab - should be Downloads at this point
  return
}
#IfWinActive

RCtrl::RWin
AppsKey & d::#!d
AppsKey::AppsKey