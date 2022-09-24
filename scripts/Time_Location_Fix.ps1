Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1

Write-Output "Elevating priviledges for this process"
do {} until (Elevate-Privileges SeTakeOwnershipPrivilege)

Write-Host "Enabling Location and Setting Clock to Automatic"

Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\ "DisableLocation" "0"
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\ "DisableLocationScripting" "0"
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\ "DisableSensors" "0"
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\ "DisableWindowsLocationProvider" "0"
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\ "Value" "Allow"
Set-ItemProperty -Path "HKCU:\Control Panel\International" "itime" "1"
Set-ItemProperty -Path "HKCU:\Control Panel\International" "sShortTime" "HH:mm"
Set-ItemProperty -Path "HKCU:\Control Panel\International" "sTimeFormat" "HH:mm:ss"
Set-ItemProperty -Path "HKCU:\Control Panel\International" "sShortDate" "yyyy-MM-dd"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSecondsInSystemClock" 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSecondsInSystemClock" 1

$services = @(
    "tzautoupdate" #Automatically sets the system time zone.
    "lfsvc"        #This service monitors the current location of the system and manages geofences (a geographical location with associated events).  If you turn off this service, applications will be unable to use or receive notifications for geolocation or geofences.
    "W32Time"      #Maintains date and time synchronization on all clients and servers in the network. If this service is stopped, date and time synchronization will be unavailable. If this service is disabled, any services that explicitly depend on it will fail to start.
)

foreach ($service in $services) {
    Write-Output "Setting $service to Automatic"
    Get-Service -Name $service | Set-Service -StartupType Automatic
}

W32tm /resync /force

Write-Host "Done"