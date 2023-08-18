#This script will reformat the date/time to international format and set the date/time
#based on location. Helpful for laptops.

Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1

Write-Output "Elevating priviledges for this process"
do {} until (Elevate-Privileges SeTakeOwnershipPrivilege)

Write-Host "Enabling Location and Setting Clock to Automatic"

Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\ "DisableLocation" "0" -ErrorAction SilentlyContinue
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\ "DisableLocationScripting" "0" -ErrorAction SilentlyContinue
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\ "DisableSensors" "0" -ErrorAction SilentlyContinue
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors\ "DisableWindowsLocationProvider" "0" -ErrorAction SilentlyContinue
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\ "Value" "Allow" -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Control Panel\International" "itime" "1" -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Control Panel\International" "sShortTime" "HH:mm" -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Control Panel\International" "sTimeFormat" "HH:mm:ss" -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Control Panel\International" "sShortDate" "yyyy-MM-dd" -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSecondsInSystemClock" 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSecondsInSystemClock" 1 -ErrorAction SilentlyContinue

$services = @(
    "tzautoupdate" #Automatically sets the system time zone.
    "lfsvc"        #This service monitors the current location of the system and manages geofences (a geographical location with associated events).  If you turn off this service, applications will be unable to use or receive notifications for geolocation or geofences.
    "W32Time"      #Maintains date and time synchronization on all clients and servers in the network. If this service is stopped, date and time synchronization will be unavailable. If this service is disabled, any services that explicitly depend on it will fail to start.
)

foreach ($service in $services) {
    Write-Output "Setting $service to Automatic"
    Get-Service -Name $service | Set-Service -StartupType Automatic
}

Start-Service -Name W32Time -PassThru
Write-Host `n
W32tm /resync /force
Write-Host `n
Write-Host "Done"