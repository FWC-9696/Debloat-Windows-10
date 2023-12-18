# This will disable a lot of the visual effects in windows

Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1

Write-Output "Elevating priviledges for this process"
do {} until (Elevate-Privileges SeTakeOwnershipPrivilege)

Write-Output "Apply MarkC's mouse acceleration fix"
Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" "MouseSensitivity" "10"
Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" "MouseSpeed" "0"
Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" "MouseThreshold1" "0"
Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" "MouseThreshold2" "0"
Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" "SmoothMouseXCurve" ([byte[]](0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xCC, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00,
0x80, 0x99, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x66, 0x26, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x33, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00))
Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" "SmoothMouseYCurve" ([byte[]](0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00))

Write-Output "Disable easy access keyboard stuff"
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" "Flags" "506"
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" "Flags" "122"
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\ToggleKeys" "Flags" "58"

Write-Output "Disable Edge desktop shortcut on new profiles"
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name DisableEdgeDesktopShortcutCreation -Type DWORD -Value 1 -ErrorAction SilentlyContinue

Write-Output "Setting folder view options"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideDrivesWithNoMedia" 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSyncProviderNotifications" 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSuperHidden" 1
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "IconsOnly" 0

Write-Output "Disable Aero-Shake Minimize feature"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisallowShaking" 1

Write-Output "Setting default explorer view to This PC"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "LaunchTo" 1

Write-Output "Disable Hybrid Shutdown"
powercfg -h off

Write-Output "Adjust Appearance and Performance of Windows"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" "VisualFXSetting" 3
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" "UserPreferencesMask" ([byte[]](0x90,
0x12, 0x02, 0x80, 0x10, 0x00, 0x00, 0x00))

Write-Output "Hide The Search Bar"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "SearchboxTaskbarMode" 0

Write-Output "Showing All Notification Icons"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer" "EnableAutoTray" 0

Write-Output "Setting Windows 10/11 Display Options"
#New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarAL -PropertyType DWORD -Value 1                #Set Taskbar to Left (0) or Center (1) (Win 11)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarAL" 1

New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Start_ShowClassicMode -Type DWORD -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Start_ShowClassicMode" 1

New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name IsDynamicSearchBoxEnabled -Type DWORD -Value 0  -ErrorAction SilentlyContinue  #Hide Search (Win 11)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" "IsDynamicSearchBoxEnabled" 0

New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarMn -Type DWORD -Value 0 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarMn" 0

Write-Output "Disabling Copilot"

New-FolderForced "HKCU:Software\Policies\Microsoft\Windows\WindowsCopilot"
New-Item -Path "HKCU:Software\Policies\Microsoft\Windows\WindowsCopilot" -Name TurnOffWindowsCopilot -Type DWORD -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:Software\Policies\Microsoft\Windows\WindowsCopilot" "TurnOffWindowsCopilot" 1

Write-Output "Done, Restarting Explorer..."

taskkill /f /im explorer.exe
sleep 1
start explorer.exe

Write-Output "Bringing up option to show all notification icons Win11..."

New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name EnableAutoTray -Type DWORD -Value 1 -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" "EnableAutoTray" 1
cmd /c "explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}"