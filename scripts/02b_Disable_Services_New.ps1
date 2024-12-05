# Description:
# This script disables unwanted Windows services by preventing them from running on startup
# It should not cause issues, but services can always be re-enabled using services.msc

$services = @(
    #"diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    #"DiagTrack"                                # Diagnostics Tracking Service
    "dmwappushservice"                         # WAP Push Message Routing Service (see known issues)
    #"lfsvc"                                    # Geolocation Service
    "MapsBroker"                               # Downloaded Maps Manager
    "NetTcpPortSharing"                        # Net.Tcp Port Sharing Service
    "RemoteAccess"                             # Routing and Remote Access
    "RemoteRegistry"                           # Remote Registry
    "SharedAccess"                             # Internet Connection Sharing (ICS)
    "TrkWks"                                   # Distributed Link Tracking Client
    #"WbioSrvc"                                 # Windows Biometric Service (required for Fingerprint reader / facial detection)
    #"WlanSvc"                                 # WLAN AutoConfig (WILL DISABLE WIFI)
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    #"wscsvc"                                  # Windows Security Center Service
    #"WSearch"                                 # Windows Search
    #"XblAuthManager"                           # Xbox Live Auth Manager
    #"XblGameSave"                              # Xbox Live Game Save Service
    #"XboxNetApiSvc"                            # Xbox Live Networking Service
    "ndu"                                      # Windows Network Data Usage Monitor
    # Services which cannot be disabled
    #"WdNisSvc"
)

foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Manual
}

Set-Service HPPrintScanDoctorService -StartupType Disabled -ErrorAction SilentlyContinue

taskmgr /0 /startup

Write-Host `n
Write-Host "Please Disable Unwanted Programs"
Write-Host `n