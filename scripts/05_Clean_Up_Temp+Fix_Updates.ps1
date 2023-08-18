#This will delete common temporary directories and might help fix Windows updates.

Write-Host "Stopping Windows Update Service & Cleaning Up System Files" `n

Stop-Service -Name wuauserv -PassThru
Stop-Service -Name bits -PassThru

Write-Host `n
Write-Host "Waiting 30 seconds for services to terminate, and removing temp files..." `n
sleep 30

Remove-Item -Recurse -Force "$env:windir\SoftwareDistribution\*" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\temp\*" -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force "$env:SystemDrive\Windows.Old" -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force "$env:TEMP" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCache\*" -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force "$env:SystemDrive\TEMP" -ErrorAction SilentlyContinue

Remove-Item -Recurse -Force "$env:windir\CarbonBlack" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\CbsTemp" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\ccmcache" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\CCM\Temp" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\CCM\Inventory\Temp" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\CCM\Logs\*" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\CCM\SystemTemp" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:windir\CCM\Staging\*" -ErrorAction SilentlyContinue

Start-Process "$env:windir\system32\cleanmgr.exe" -Verb RunAs

Write-Host "Done"