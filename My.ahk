#NoEnv
#Warn
#SingleInstance, Force

WM_INPUTLANGCHANGEREQUEST = 0x50

EN_LOCALE = 0x0409
HU_LOCALE = 0x040e

SetKeyboardLayout(Locale)
{
  Global WM_INPUTLANGCHANGEREQUEST
	Layout := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", Locale), "Int", 0)
	WinGet, Windows, List
	Loop % Windows
  {
    Handle := "ahk_id " windows%A_Index%
		PostMessage, WM_INPUTLANGCHANGEREQUEST,, % Layout,, % Handle
	}
}

#e::SetKeyboardLayout(EN_LOCALE)
#h::SetKeyboardLayout(HU_LOCALE)

#IfWinActive ahk_exe chrome.exe
^d::
{
  Send, ^j ; Open Downloads
  Send, ^w ; Close active tab - should be Downloads at this point
  Return
}
#IfWinActive
