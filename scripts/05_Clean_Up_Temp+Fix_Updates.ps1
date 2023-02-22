#This will delete common temporary directories and might help fix Windows updates.
#Folders may not all exist, and might show red text.

Write-Host "Stopping Windows Update Service & Cleaning Up System Files" `n

Stop-Service -Name wuauserv -PassThru
Stop-Service -Name bits -PassThru

Write-Host `n
Write-Host "Waiting 30 seconds for services to terminate, and removing temp files..." `n
sleep 30

Remove-Item -Recurse -Force "$env:windir\temp"
Remove-Item -Recurse -Force "$env:windir\SoftwareDistribution"
Remove-Item -Recurse -Force "C:\Windows.Old"

Remove-Item -Recurse -Force "$env:TEMP"
Remove-Item -Recurse -Force "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCache\*"

Remove-Item -Recurse -Force "C:\TEMP"

Remove-Item -Recurse -Force "$env:windir\CarbonBlack"
Remove-Item -Recurse -Force "$env:windir\CbsTemp"

Remove-Item -Recurse -Force "$env:windir\ccmcache"
Remove-Item -Recurse -Force "$env:windir\CCM\Temp"
Remove-Item -Recurse -Force "$env:windir\CCM\Inventory\Temp"
Remove-Item -Recurse -Force "$env:windir\CCM\Logs\*"
Remove-Item -Recurse -Force "$env:windir\CCM\SystemTemp"
Remove-Item -Recurse -Force "$env:windir\CCM\Staging\*"

Start-Process "$env:windir\system32\cleanmgr.exe" -Verb RunAs

Write-Host "Done"