Write-Host `n "Checking for Windows Updates..." `n

Start-Process ms-settings:windowsupdate
USOClient StartInteractiveScan