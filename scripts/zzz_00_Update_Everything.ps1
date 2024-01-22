#NVCleanstall (Updates Graphics Drivers)
Write-Host `n
Write-Host "Checking for Nvidia Driver Updates..." `n
Start $env:ProgramFiles\NVCleanstall\NVCleanstall.exe -ErrorAction SilentlyContinue

#Updates Windows Store Apps
Write-Host "Checking for Windows Store Updates..."
Start ms-windows-store://downloadsandupdates
Get-CimInstance -Namespace "Root\cimv2\mdm\dmmap" -ClassName "MDM_EnterpriseModernAppManagement_AppManagement01" | Invoke-CimMethod -MethodName UpdateScanMethod

#Updates Windows
Write-Host "Checking for Windows Updates..." `n
Start-Process ms-settings:windowsupdate
USOClient StartInteractiveScan

#Updates Other Programs
Write-Host "Checking for Software Updates..." `n
Start-Process ms-settings:windowsupdate
USOClient StartInteractiveScan
winget upgrade
Write-Host `n
Write-Host "To Upgrade Everything, run the following command:"
Write-Host "winget upgrade --all --accept-source-agreements --accept-package-agreements" `n