#This will delete common temporary directories and might help fix Windows updates.
#Folders may not all exist, and might show red text.

Write-Host "Stopping Windows Update Service + Cleaning Up System Files" `n

Stop-Service -Name wuauserv -PassThru
Stop-Service -Name bits -PassThru

Remove-Item C:\temp -Recurse -Force
Remove-Item C:\Windows\temp -Recurse -Force
Remove-Item C:\Windows\SoftwareDistribution -Recurse -Force
Remove-Item C:\Windows.Old -Recurse -Force

Write-Host "Done"