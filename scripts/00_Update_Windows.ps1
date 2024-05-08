Write-Host `n "Checking for Windows Updates..." `n
winget install Microsoft.Powershell
Start-Process ms-settings:windowsupdate
USOClient StartInteractiveScan