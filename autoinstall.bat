@echo off
pushd %cd%

@echo off
cd /d %~dp0

ECHO OFF
reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall uninstall.txt
for /f "usebackq tokens=2 delims=:" %%i in (`find /i /c "KB968930" uninstall.txt`) do (if %%i GEQ 1 goto ps)


:installps
ECHO "installing PowerShell"
start /wait .\WindowsXP-KB968930-x86-CHS.exe
if not exist "reboot.txt" touch reboot.txt & echo "This file existed here, it shows this system needs reboot." > reboot.txt
exit /b 1

:ps
if exist uninstall.txt del uninstall.txt
powershell -command "& {.\install.ps1}"

popd

exit /b 0