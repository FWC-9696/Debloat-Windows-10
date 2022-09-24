# Description:
# This script will disable the "Get More Out of Windows" annoying reminder in the settings app

Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1

Write-Output "Elevating priviledges for this process"
do {} until (Elevate-Privileges SeTakeOwnershipPrivilege)

Write-Output "Set registry keys"

New-Item HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement -Name ScoobeSystemSettingEnabled –Force
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement "ScoobeSystemSettingEnabled" 0

New-Item HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-310093Enabled –Force
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager "SubscribedContent-310093Enabled" 0