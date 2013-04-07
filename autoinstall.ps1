
Push-Location
$curpwd = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $curpwd

Write-Host "install python-3.3"
Start-Process msiexec -ArgumentList "/i python-3.3.0.msi /passive TARGETDIR=C:\\xingmin\\python3.3 ALLUSER=1 ADDLOCAL=ALL" -Wait
Write-Host "write system environment of python"
$oldenvpath = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" -Name Path
$newenvpath = "C:\xingmin\python3.3;"+$oldenvpath.Path
Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" -Name Path -Value $newenvpath
$env:Path = $env:Path + ";C:\xingmin\python3.3"

Write-Host "install pywin32"
Copy-Item -Force -Recurse .\pywin32-218.win32-py3.3\PLATLIB\* C:\xingmin\python3.3\Lib\site-packages
Copy-Item -Force -Recurse .\pywin32-218.win32-py3.3\SCRIPTS\* C:\xingmin\python3.3\Lib\site-packages
& python C:\xingmin\python3.3\Lib\site-packages\pywin32_postinstall.py -quiet -install

Write-Host "install virtualbox"
& .\VirtualBox-4.2.10-84105-Win.exe 
& python autoinstallwin32.py

#install tigervnc
#& .\tigervnc-1.2.0.exe /SP- /SILENT /DIR="C:\xingmin\tigervnc" /CLOSEAPPLICATIONS /NOCANCEL /NORESTART
#$oldenvpath = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" -Name Path
#$newenvpath = "C:\xingmin\tigervnc;"+$oldenvpath.Path
#Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" -Name Path -Value $newenvpath

Pop-Location
