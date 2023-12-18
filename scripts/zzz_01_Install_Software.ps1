#This script will automatically install some Windows Store apps
#To add apps to the list, use "winget search <appname>" to find the app ID

Write-Host "Installing Software"
$apps = @(
    "9NBLGGH4NNS1"             #Update Winget itself

    "Microsoft.PowerToys"      #PowerToys

    "9P7KNL5RWT25"             #Microsoft Sysinternals Suite (Includes Process explorer & Other Tools)

    "9MV0B5HZVK9Z"             #Xbox
    "9NZKPSTSNW4P"             #Xbox Game Bar
    "9PLDPG46G47Z"             #Xbox Insider Hub
    #"9PGW18NPBZV5"             #Minecraft Launcher, Doesn't work.
    "9N8WTRRSQ8F7"             #Diagnostic Data Viewer
    "9WZDNCRFJBH4"             #Microsoft Photos

    #"9WZDNCRFJ3P2"             #Windows Movies & TV
    #"9N95Q1ZZPMH4"             #MPEG-2 Video Extension
    #"9NBLGGH10PG8"             #Microsoft People
    "9MZ95KL8MR0L"             #Snip and Sketch (New Snipping Tool)
    #"9WZDNCRFJ3PT"             #Groove Music
    #"9WZDNCRFJ1P3"	            #One Drive
    #"9WZDNCRFHVQM"             #Mail and Calendar (Old)
    "9NRX63209R7B"             #Outlook for Windows (Replacement for Mail & Calendar)

    #Non-Windows UWP Apps
    "9NBHCS1LX4R0"             #Paint.net
    "XP9M26RSCLNT88"           #Tree Size, for determining sizes of folders
    #"XPFCG5NRKXQPKT"           #Foxit PDF Reader

    #Printer UWP Apps
    #"9WZDNCRFJ14K"             #Cannon Inkjet Print Utility
    #"9WZDNCRFHWLH"             #HP Smart

    #Graphics Drivers
    #"TechPowerUp.NVCleanstall" #NVCleanstall
    #"DisplayLink.GraphicsDriver"#DisplayLink Graphics Driver
    "9N09F8V8FS02"               #DisplayLink Manager

    #Java
    #"Oracle.JavaRuntimeEnvironment" #Java
    
    #Media Players
    #"VideoLAN.VLC"              #VLC Media Player
)

foreach ($app in $apps) {
    Write-Output "Trying to install $app"

    winget install $app --accept-source-agreements --accept-package-agreements

    }