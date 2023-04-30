################################################################################################################################
#    /$$$$$$                                                                                                                    
#   /$$__  $$                                                                                                                   
#  | $$  \__/ /$$   /$$  /$$$$$$$ /$$$$$$/$$$$   /$$$$$$  /$$$$$$$  /$$   /$$ /$$   /$$         # Author:   Soham Ray [Sysmonyx]
#  |  $$$$$$ | $$  | $$ /$$_____/| $$_  $$_  $$ /$$__  $$| $$__  $$| $$  | $$|  $$ /$$/                                         
#   \____  $$| $$  | $$|  $$$$$$ | $$ \ $$ \ $$| $$  \ $$| $$  \ $$| $$  | $$ \  $$$$/          # Website:  https://sysmonyx.com
#   /$$  \ $$| $$  | $$ \____  $$| $$ | $$ | $$| $$  | $$| $$  | $$| $$  | $$  >$$  $$                                          
#  |  $$$$$$/|  $$$$$$$ /$$$$$$$/| $$ | $$ | $$|  $$$$$$/| $$  | $$|  $$$$$$$ /$$/\  $$         # Email:    contact@sysmonyx.com
#   \______/  \____  $$|_______/ |__/ |__/ |__/ \______/ |__/  |__/ \____  $$|__/  \__/                                         
#             /$$  | $$                                             /$$  | $$                                                   
#            |  $$$$$$/                                            |  $$$$$$/                                                   
#             \______/                                              \______/                                                    
################################################################################################################################
#   Description:    This script Uninstalls specified pre-loaded apps from Samsung One-UI using ADB.
#                   WARNING: THIS SCRIPT IS CURRENTLY WORK IN PROGRESS & DEFINITELY NOT TESTED.
#
#   Last Updated:   30.04.2023
################################################################################################################################
# List ADB Devices.
.\adb devices

# TO-DO: Add confirmation prompt for user before proceeding.
# TO-DO: Implement a better way to call "adb" instead of using ".\".

# Apps.
$apps = @(

    # Not Sorted A-Z yet.
    "com.samsung.android.arzone"                                # AR Zone
    "com.samsung.android.ardrawing"                             # AR Drawing
    "com.samsung.android.bixby.agent"                           # Bixby
    "com.samsung.android.bixby.galaxy"                          # Galaxy Shop
    "com.samsung.android.visionarapps"                          # AR Vision
    "com.samsung.android.voc"                                   # Samsung Memebers

)

# Uninstall Apps for the current User.
foreach ($app in $apps){
    Write-Output "Removing $app . . . ."
    .\adb shell pm uninstall --user 0 $app
}

# Wait for Key-Press from user.
Write-Output "`nComplete. Press any key to continue . . . ."
[Console]::ReadKey($true) | Out-Null
################################################################################################################################