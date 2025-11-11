@echo off
REM Set Edge homepage policy (HKLM)
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HomepageLocation /t REG_SZ /d "http://203.0.113.2:80" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HomepageIsNewTabPage /t REG_DWORD /d 0 /f
REM Set Edge to open specific startup pages
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v RestoreOnStartup /t REG_DWORD /d 4 /f

echo Done. Please restart Microsoft Edge for the changes to take effect.
pause
