$DisplayLeft = 3
$DisplayRight = 2

$PSNativeCommandUseErrorActionPreference = $true
$ErrorActionPreference = "Stop"

$Directory = Get-Location
Invoke-WebRequest https://github.com/scottaxcell/winddcutil/releases/download/v2.0.0/winddcutil.exe -OutFile "$Directory\winddcutil.exe"

$Shell = New-Object -ComObject WScript.Shell
$Desktop = $Shell.SpecialFolders("Desktop")

$Link = $Shell.CreateShortcut("$Desktop\Toggle Displays.lnk")
$Link.Arguments = "-Command $Directory\ToggleMonitorInput.ps1 $DisplayLeft,$DisplayRight"
$Link.Hotkey = "Ctrl+Shift+0"
$Link.TargetPath = "pwsh.exe"
$Link.WindowStyle = 7
$Link.WorkingDirectory = "$Directory"
$Link.Save()

$Link = $Shell.CreateShortcut("$Desktop\Toggle Left Display.lnk")
$Link.Arguments = "-Command $Directory\ToggleMonitorInput.ps1 $DisplayLeft"
$Link.Hotkey = "Ctrl+Shift+1"
$Link.TargetPath = "pwsh.exe"
$Link.WindowStyle = 7
$Link.WorkingDirectory = "$Directory"
$Link.Save()

$Link = $Shell.CreateShortcut("$Desktop\Toggle Right Display.lnk")
$Link.Arguments = "-Command $Directory\ToggleMonitorInput.ps1 $DisplayRight"
$Link.Hotkey = "Ctrl+Shift+2"
$Link.TargetPath = "pwsh.exe"
$Link.WindowStyle = 7
$Link.WorkingDirectory = "$Directory"
$Link.Save()
