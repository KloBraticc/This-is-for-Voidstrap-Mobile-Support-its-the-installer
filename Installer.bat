@echo off
setlocal

set "DEFAULT_MSI=%~dp0chromeremotedesktophost.msi"
set /p "Press ENTER: "

if "%MSI_PATH%"=="" set "MSI_PATH=%DEFAULT_MSI%"

if not exist "%MSI_PATH%" (
    echo ERROR: File not found at "%MSI_PATH%"
    pause
    exit /b 1
)

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Not running as admin. Relaunching...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Running MSI as Admin...
msiexec /i "%MSI_PATH%"

echo Installer finished. Press any key to exit.
pause
exit /b
