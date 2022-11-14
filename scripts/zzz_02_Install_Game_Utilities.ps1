#This script will automatically install some Windows Store apps
#To add apps to the list, find the app at https://apps.microsoft.com/store/apps
#In the address bar, copy the last piece of the link into the list
#i.e. https://apps.microsoft.com/store/detail/prime-video-for-windows/9P6RC76MSMMJ
#is for the prime video app, so you could add "9P6RC76MSMMJ" to the list to install it
#for programs not from the windows store, use the winget command in powershell to import/export

Write-Host "Installing Game Utilities"
$apps = @(

    "PlayStation.DualSenseFWUpdater" #DualShock (PS5 Controller) Firmware Updater
    "Radmin.VPN"                     #Radmin VPN (Replaces LogMeIn Hamachi or LAN)
    "Logitech.GHUB"                  #Logitech G Hub
    "ViGEm.ViGEmBus"                 #Nefarius Gamepad Emulator, Subcomponent of DS4Windows
)

foreach ($app in $apps) {
    Write-Output "Trying to install $app"

    winget install $app --accept-source-agreements --accept-package-agreements

    }