#This is a good way to start up programs at startup that do not otherwise start easily.
#You may also add parameters as seen in the caffiene line
#Create a shortcut with the following syntax:
#powershell.exe -ExecutionPolicy Bypass -File C:\Path\to\this\file\Startup_Programs.ps1
#Then add to 
   # For all users: C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
   # For current user: C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

& "$env:ProgramFiles\NVCleanstall\NVCleanstall.exe"			#NVCleanstall
& "$env:ProgramFiles\DS4Windows\DS4Updater.exe"				#DS4Windows
& "$env:ProgramFiles\Sony\FW updater\FWupdater.exe"			#DualSense Firmware Updater
& "$env:ProgramFiles\LGHUB\lghub.exe"					#Logitech G Hub
& "$env:ProgramFiles\caffeine.exe" -startoff				#Caffeine, but start inactive with "-startoff"
#& "$env:ProgramFiles\DisplayLink Core Software\DisplayLinkTrayApp.exe"	#DisplayLink
#& "${env:ProgramFiles(x86)}\Turtle Beach\Ear Force Audio Hub\PTUtilityShell.exe"  #Turtle Beach Audio Hub