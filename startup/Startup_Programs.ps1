#This is a good way to start up programs at startup that do not otherwise start easily.
#You may also add parameters as seen in the caffiene line
#Create a shortcut with the following syntax:
#powershell.exe -ExecutionPolicy Bypass -File C:\Path\to\this\file\Startup_Programs.ps1
#Then add to 
   # For all users: C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
   # For current user: C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

& "C:\Program Files\NVCleanstall\NVCleanstall.exe"			#NVCleanstall
& "C:\Program Files\DS4Windows\DS4Updater.exe"				#DS4Windows
& "C:\Program Files\Sony\FW updater\FWupdater.exe"			#DualSense Firmware Updater
& "C:\Program Files\LGHUB\lghub.exe"					#Logitech G Hub
& "C:\Program Files\caffeine.exe" -startoff				#Caffeine, but start inactive with "-startoff"
& "C:\Program Files\DisplayLink Core Software\DisplayLinkTrayApp.exe"	#DisplayLink