#NoEnv
#Warn
#SingleInstance, Force

FindProcesses(name)
{
  pids := []
  count := 0
  for Process in ComObjGet("winmgmts:").ExecQuery("select * from Win32_Process")
  {
    if (Process.Name == name)
    {
      pids.Insert(count, Process.ProcessId)
      count += 1
    }
  }
  return pids
}

SuspendProcess(pid)
{
  hProcess := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "Int", pid)
  if (hProcess)
  {
    DllCall("ntdll.dll\NtSuspendProcess", "Int", hProcess)
    DllCall("CloseHandle", "Int", hProcess)
  }
  return
}

SuspendProcesses(name)
{
  for index, pid in FindProcesses(name)
  {
    SuspendProcess(pid)
  }
  return
}

ResumeProcess(pid)
{
  hProcess := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "Int", pid)
  if (hProcess)
  {
    DllCall("ntdll.dll\NtResumeProcess", "Int", hProcess)
    DllCall("CloseHandle", "Int", hProcess)
  }
  return
}

ResumeProcesses(name)
{
  for index, pid in FindProcesses(name)
  {
    ResumeProcess(pid)
  }
  return
}

; Suspend Slack and Discord
^CtrlBreak::
{
  SuspendProcesses("slack.exe")
  SuspendProcesses("Discord.exe")
  return
}

; Resume Slack and Discord
^PrintScreen::
{
  ResumeProcesses("Discord.exe")
  ResumeProcesses("slack.exe")
  return
}

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