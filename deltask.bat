@reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v selfinstalldevenv  >nul 2>&1 
if %ERRORLEVEL% EQU 0 (goto 0) else (goto EOF)
:0
@reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v selfinstalldevenv /f  >nul 2>&1 
:EOF

exit /b 0
