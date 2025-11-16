@echo off
REM === Optional: Close all Edge windows to ensure changes take effect ===
echo Closing all Microsoft Edge processes...
taskkill /IM msedge.exe /F >nul 2>&1

REM === Set Edge homepage (GPO-Managed) ===
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HomepageLocation /t REG_SZ /d "http://203.0.113.2:80" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HomepageIsNewTabPage /t REG_DWORD /d 0 /f

REM === Set Edge startup behaviour ===
REM 4 = Open specific URLs
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v RestoreOnStartup /t REG_DWORD /d 4 /f

REM === Startup URLs must be set in a subkey ===
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\RestoreOnStartupURLs" /v "1" /t REG_SZ /d "http://203.0.113.2:80" /f

REM === Optional: Verify that the registry keys were written ===
echo Verifying registry settings...
REG QUERY "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HomepageLocation
REG QUERY "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v RestoreOnStartup
REG QUERY "HKLM\SOFTWARE\Policies\Microsoft\Edge\RestoreOnStartupURLs" /v "1"

echo Done. Microsoft Edge may need to be restarted for the changes to take effect.
pause
