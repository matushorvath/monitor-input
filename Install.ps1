$Target = "C:\Documents\xwinddcutil"
$DisplayLeft = 3
$DisplayRight = 2

$PSNativeCommandUseErrorActionPreference = $true
$ErrorActionPreference = "Stop"

$Directory = New-Item -Path $Target -ItemType Directory -Force
Invoke-WebRequest https://github.com/scottaxcell/winddcutil/releases/download/v2.0.0/winddcutil.exe -OutFile "$Directory\winddcutil.exe"
Copy-Item "ToggleMonitorInput.ps1" -Destination $Directory

$Shell = New-Object -ComObject WScript.Shell
$Desktop = $Shell.SpecialFolders("Desktop")

$LinkLeft = $Shell.CreateShortcut("$Desktop\Toggle Displays.lnk")
$LinkLeft.Arguments = "-Command $Directory\ToggleMonitorInput.ps1 $DisplayLeft,$DisplayRight"
$LinkLeft.Hotkey = "Ctrl+Shift+0"
$LinkLeft.TargetPath = "pwsh.exe"
$LinkLeft.WindowStyle = 7
$LinkLeft.WorkingDirectory = "$Directory"
$LinkLeft.Save()

$LinkLeft = $Shell.CreateShortcut("$Desktop\Toggle Left Display.lnk")
$LinkLeft.Arguments = "-Command $Directory\ToggleMonitorInput.ps1 $DisplayLeft"
$LinkLeft.Hotkey = "Ctrl+Shift+1"
$LinkLeft.TargetPath = "pwsh.exe"
$LinkLeft.WindowStyle = 7
$LinkLeft.WorkingDirectory = "$Directory"
$LinkLeft.Save()

$LinkRight = $Shell.CreateShortcut("$Desktop\Toggle Right Display.lnk")
$LinkRight.Arguments = "-Command $Directory\ToggleMonitorInput.ps1 $DisplayRight"
$LinkRight.Hotkey = "Ctrl+Shift+2"
$LinkRight.TargetPath = "pwsh.exe"
$LinkRight.WindowStyle = 7
$LinkRight.WorkingDirectory = "$Directory"
$LinkRight.Save()
