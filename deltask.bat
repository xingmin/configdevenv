@reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v selfinstalldevenv
if errorlevel 0 goto 0
if errorlevel 1 goto EOF
:0
@reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v selfinstalldevenv /f
:EOF
@echo "Finished!" 
exit /b 0
