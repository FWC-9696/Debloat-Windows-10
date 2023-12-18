#Updates Windows Store Apps

Write-Host `n "Checking for Windows Store Updates..." `n

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

#NVCleanstall (Updates Graphics Drivers)
& "$env:ProgramFiles\NVCleanstall\NVCleanstall.exe"						                          