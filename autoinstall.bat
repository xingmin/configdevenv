ECHO OFF
PowerShell -Command "& {echo 'powershell installed'}"
IF ERRORLEVEL 0 goto ps
IF NOT ERRORLEVEL 0 goto installps

:installps
start /wait .\WindowsXP-KB968930-x86-CHS.exe

:ps
ECHO "test"
rem powershell -command "& {.\install.ps1}"