@echo off
setlocal
set "MSI_PATH=%~dp0chromeremotedesktophost.msi"

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

echo Installing Voidstrap Mobile Chrome Desktop...
msiexec /i "%MSI_PATH%" /quiet /norestart

exit /b
