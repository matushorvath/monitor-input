param(
  [Parameter(Mandatory=$true)]
  [int[]]$Displays
)

$PSNativeCommandUseErrorActionPreference = $true
$ErrorActionPreference = "Stop"

# Map result of 'getvcp' to a parameter for 'setvcp'
$MapVCP = @{
	"4369" = "0x12"
	"4370" = "0x11"
}

$Displays | ForEach-Object {
	$Result = & .\winddcutil.exe getvcp $_ 0x60 | Select-String -Pattern "^VCP 0x60 (\d+)"
	$InputVCP = $Result.Matches[0].Groups[1].Value
	$OutputVCP = $MapVCP[$InputVCP]
	& .\winddcutil.exe setvcp $_ 0x60 $OutputVCP
}
