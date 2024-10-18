#NVCleanstall (Updates Graphics Drivers)
Write-Host `n
Write-Host "Checking for Nvidia Driver Updates (if NVCleanstall is installed)..." `n
$ErrorActionPreference = "silentlycontinue"
Start $env:ProgramFiles\NVCleanstall\NVCleanstall.exe
$ErrorActionPreference = "continue"

#Updates Windows Store Apps
Write-Host "Checking for Windows Store Updates..."
Start ms-windows-store://downloadsandupdates -ErrorAction SilentlyContinue
Get-CimInstance -Namespace "Root\cimv2\mdm\dmmap" -ClassName "MDM_EnterpriseModernAppManagement_AppManagement01" | Invoke-CimMethod -MethodName UpdateScanMethod -ErrorAction SilentlyContinue

#Updates Windows
Write-Host "Checking for Windows Updates..." `n
Start-Process ms-settings:windowsupdate
USOClient StartInteractiveScan

#Update PowerToys
Write-Host "Checking for PowerToys Updates..." `n
Start-Process $env:LOCALAPPDATA\PowerToys\PowerToys.exe -Verb RunAs -ErrorAction SilentlyContinue
Start-Process $env:LOCALAPPDATA\PowerToys\PowerToys.Update.exe -Verb RunAs -ErrorAction SilentlyContinue

#Updates Other Programs
Write-Host "Checking for Software Updates..." `n
Start-Process ms-settings:windowsupdate
USOClient StartInteractiveScan
winget upgrade
Write-Host `n
Write-Host "To Upgrade Everything, run the following command:"
Write-Host "winget upgrade --all --accept-source-agreements --accept-package-agreements" `n