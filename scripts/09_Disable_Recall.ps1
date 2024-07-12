Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1

Write-Output "Elevating priviledges for this process"
do {} until (Elevate-Privileges SeTakeOwnershipPrivilege)

New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI" -Name DisableAIDataAnalysis -Type DWORD -Value 1  -ErrorAction SilentlyContinue -Force
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI" "DisableAIDataAnalysis" 1

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsAI" -Name DisableAIDataAnalysis -Type DWORD -Value 1  -ErrorAction SilentlyContinue -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsAI" "DisableAIDataAnalysis" 1

New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Name TurnOffWindowsCopilot -Type DWORD -Value 1  -ErrorAction SilentlyContinue -Force
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot" "TurnOffWindowsCopilot" 1

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Name TurnOffWindowsCopilot -Type DWORD -Value 1  -ErrorAction SilentlyContinue -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsCopilot" "TurnOffWindowsCopilot" 1