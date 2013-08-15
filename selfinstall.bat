@echo off
pushd %cd%

@echo off
cd /d %~dp0

ECHO OFF
reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall uninstall.txt >nul 2>&1
for /f "usebackq tokens=2 delims=:" %%i in (`%windir%\system32\find.exe /i /c "KB968930" uninstall.txt`) do (if %%i GEQ 1 goto ps)


:installps
ECHO "installing PowerShell"
start /wait .\WindowsXP-KB968930-x86-CHS.exe
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v selfinstalldevenv /t reg_sz /d "%~dp0selfinstall.bat" /f >nul 2>&1
shutdown /r /f /t 0
exit /b 1

:ps
call .\deltask.bat
if exist uninstall.txt del uninstall.txt
powershell -command "& {.\install.ps1}"
if exist "reboot.txt" shutdown /r /f /t 0
popd
exit /b 0