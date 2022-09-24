Write-Host "Cleaning Up System Files" `n

Stop-Service -Name wuauserv
Stop-Service -Name bits
Remove-Item C:\temp -Recurse
Remove-Item C:\Windows\temp -Recurse
Remove-Item C:\Windows\SoftwareDistribution -Recurse
Remove-Item C:\Windows.Old -Recurse

Write-Host "Done"