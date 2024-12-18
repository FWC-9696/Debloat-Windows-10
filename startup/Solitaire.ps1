explorer shell:appsFolder\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe!App                 #Game Bar
explorer shell:appsFolder\Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe!App	    #Microsoft Solitaire Colletion NOTE: Use Get:StartApps for list of UWP Apps
sleep 1200                                                                              #wait for Microsoft Rewards points
Stop-Process -Name Solitaire                                                            #Kill Solitaire to save system resources