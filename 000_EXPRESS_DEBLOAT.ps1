#&".\scripts\00_Update_Windows.ps1"
#sleep 10
&".\scripts\01a_Optimize_UI_New.ps1"
&".\scripts\01b_Time_Location_Fix.ps1"
&".\scripts\02a_Remove_Apps.ps1"
&".\scripts\01ab_ShowAllNotifs_Win11.ps1"
&".\scripts\02b_Disable_Services_New.ps1"
&".\scripts\02c_Utilities_New.ps1"
&".\scripts\02d_Resource_Tweaks.ps1"
& Write-Host `n "Done. Press any key to clean up."
Read-Host
&".\scripts\03_Clean_Up_Temp+Fix_Updates.ps1"
#&".\scripts\zzz_00_Update_Everything.ps1"

& Write-Host `n "You may now close this window" `n "Some changes will require a reboot."