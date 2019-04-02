#NoEnv
#Warn
#SingleInstance, Force

#IfWinActive ahk_exe chrome.exe
^d::
{
  Send, ^j ; Open Downloads
  Send, ^w ; Close active tab - should be Downloads at this point
  Return
}
#IfWinActive

AppsKey & 0::#0
AppsKey & 1::#1
AppsKey & 2::#2
AppsKey & 3::#3
AppsKey & 4::#4
AppsKey & 5::#5
AppsKey & 6::#6
AppsKey & 7::#7
AppsKey & 8::#8
AppsKey & 9::#9
AppsKey & d::#!d
AppsKey::AppsKey