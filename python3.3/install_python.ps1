Push-Location
$curpwd = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $curpwd

Write-Host "install python-3.3"

if (get-command python -erroraction silentlycontinue){
	Write-Host "python has been installed before and this setup do nothing."
}else{
	Start-Process msiexec -ArgumentList "/i python-3.3.0.msi /passive TARGETDIR=C:\\xingmin\\python3.3 ALLUSER=1 ADDLOCAL=ALL" -Wait
#	Write-Host "write system environment of python"
#	$oldenvpath = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" -Name Path
#	$newenvpath = "C:\xingmin\python3.3;"+$oldenvpath.Path
#	Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" -Name Path -Value $newenvpath
	$env:Path = $env:Path + ";C:\xingmin\python3.3"

	Write-Host "install pywin32"
	Copy-Item -Force -Recurse .\pywin32-218.win32-py3.3\PLATLIB\* C:\xingmin\python3.3\Lib\site-packages
	Copy-Item -Force -Recurse .\pywi n32-218.win32-py3.3\SCRIPTS\* C:\xingmin\python3.3\Lib\site-packages
	& C:\xingmin\python3.3\python C:\xingmin\python3.3\Lib\site-packages\pywin32_postinstall.py -quiet -install
	
	if (-not (Test-Path "..\reboot.txt")) {
		Write-Output "This file existed here, it shows this system needs reboot." > reboot.txt;
	}
	
}
Pop-Location