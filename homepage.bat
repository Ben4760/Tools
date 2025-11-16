@echo off
REM Close Edge
taskkill /IM msedge.exe /F >nul 2>&1

REM Policies path
set Key="HKLM\SOFTWARE\Policies\Microsoft\Edge"

REM Homepage
REG ADD %Key% /v HomepageLocation /t REG_SZ /d "http://203.0.113.2:80" /f
REG ADD %Key% /v HomepageIsNewTabPage /t REG_DWORD /d 0 /f

REM Startup pages
REG ADD %Key% /v RestoreOnStartup /t REG_DWORD /d 4 /f
REG ADD "%Key%\RestoreOnStartupURLs" /v "1" /t REG_SZ /d "http://203.0.113.2:80" /f

REM New tab page (forces all new tabs to your URL)
REG ADD %Key% /v NewTabPageLocation /t REG_SZ /d "http://203.0.113.2:80" /f

echo Done. Restart your computer to ensure changes apply.
pause
