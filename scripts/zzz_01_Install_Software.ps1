#This script will automatically install some Windows Store apps
#To add apps to the list, find the app at https://apps.microsoft.com/store/apps
#In the address bar, copy the last piece of the link into the list
#i.e. https://apps.microsoft.com/store/detail/prime-video-for-windows/9P6RC76MSMMJ
#is for the prime video app, so you could add "9P6RC76MSMMJ" to the list to install it
#for programs not from the windows store, use the winget command in powershell to import/export

Write-Host "Installing Software"
$apps = @(
    "9MV0B5HZVK9Z"             #Xbox
    "9NZKPSTSNW4P"             #Xbox Game Bar
    "9PLDPG46G47Z"             #Xbox Insider Hub
    #"9PGW18NPBZV5"             #Minecraft Launcher, Doesn't work.
    "9N8WTRRSQ8F7"             #Diagnostic Data Viewer
    "9WZDNCRFJBH4"             #Microsoft Photos
    #"9WZDNCRFHVQM"             #Mail and Calendar
    #"9WZDNCRFJ3P2"             #Windows Movies & TV
    #"9N95Q1ZZPMH4"             #MPEG-2 Video Extension
    #"9NBLGGH10PG8"             #Microsoft People
    "9MZ95KL8MR0L"             #Snip and Sketch (New Snipping Tool)
    #"9WZDNCRFJ3PT"             #Groove Music
    #"9WZDNCRFJ1P3"	        #One Drive

    #Non-Windows UWP Apps
    "9NBHCS1LX4R0"             #Paint.net
    "XP9M26RSCLNT88"           #Tree Size, for determining sizes of folders
    "XPFCG5NRKXQPKT"           #Foxit PDF Reader

    #Printer UWP Apps
    #"9WZDNCRFJ14K"             #Cannon Inkjet Print Utility
    "9WZDNCRFHWLH"             #HP Smart

    #Graphics Drivers
    "TechPowerUp.NVCleanstall" #NVCleanstall
    "DisplayLink.GraphicsDriver"#DisplayLink Graphics Driver

    #Java
    "Oracle.JavaRuntimeEnvironment" #Java
    
    #Media Players
    "VideoLAN.VLC"              #VLC Media Player
)

foreach ($app in $apps) {
    Write-Output "Trying to install $app"

    winget install $app --accept-source-agreements --accept-package-agreements

    }