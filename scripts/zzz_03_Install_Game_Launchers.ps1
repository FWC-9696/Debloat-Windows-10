#This script will automatically install some Game Launchers as shown below.
#The Xbox app is installed in 01_Install_Software.

Write-Host "Installing Game Launchets"
$apps = @(

    "Amazon.Games"               #Amazon Games
    #"Battle.net"                 #Battle.net
    "EpicGames.EpicGamesLauncher"#Epic Games Launcher
    "ElectronicArts.EADesktop"   #EA Desktop
    "GOG.Galaxy"                 #GOG Galaxy
    "Parsec.Parsec"              #Parsec
    "Valve.Steam"                #Steam
    "Ubisoft.Connect"            #Ubisoft Connect

)

foreach ($app in $apps) {
    Write-Output "Trying to install $app"

    winget install $app --accept-source-agreements --accept-package-agreements

    }

Write-Host "Installing Rockstar Games Launcher from Source (No Winget Package)"
sleep 3
Start-Process https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe #Rockstar Games Launcher