Push-Location
$curpwd = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $curpwd
if (get-command git -erroraction silentlycontinue){
	Write-Host "Git has been installed, this setup do nothing."
}else{
	Write-Host "installing git for windows(msysgit)--"
	Start-Process .\\Git-1.8.1.2-preview20130201.exe -ArgumentList "/SP- /SILENT /DIR=C:\\xingmin\\git /CLOSEAPPLICATIONS /NOCANCEL /NORESTART" -Wait
#	& C:\xingmin\git\bin\sh.exe --login -c "git config --global user.name 'xingmin liu' && git config --global user.email xingminliu@qq.com"
	
	$oldenvpath = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" -Name Path
	$newenvpath = "C:\xingmin\git\bin;"+$oldenvpath.Path
	Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment" -Name Path -Value $newenvpath
	$env:Path = $env:Path + ";C:\xingmin\git\bin"
	
	if (-not (Test-Path "..\reboot.txt")) {
		Write-Output "This file existed here, it shows this system needs reboot." > reboot.txt;
	}
	
}
Pop-Location