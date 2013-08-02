@echo off
pushd %cd%

@echo off
cd /d %~dp0

ECHO OFF
PowerShell -Command "& {echo 'powershell has been installed. This time do nothing.'}"
IF ERRORLEVEL 0 goto ps
IF NOT ERRORLEVEL 0 goto installps

:installps
ECHO "installing PowerShell"
start /wait .\WindowsXP-KB968930-x86-CHS.exe
if not exist "reboot.txt" touch reboot.txt & echo "This file existed here, it shows this system needs reboot." > reboot.txt
:ps
powershell -command "& {.\install.ps1}"

popd