#NoEnv
#Warn
#SingleInstance, Force

AppsKeyDToggle := 0

#IfWinActive ahk_exe chrome.exe
^d::
{
  Send, ^j ; Open Downloads
  Send, ^w ; Close active tab - should be Downloads at this point
  return
}
#IfWinActive

RAlt::RWin
AppsKey & d::#!d
AppsKey::AppsKey