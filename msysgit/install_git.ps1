Push-Location
Write-Host "installing git for windows(msysgit)--"
$curpwd = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $curpwd
if (get-command git -erroraction silentlycontinue){
	Write-Host "Git has been installed, this setup do nothing."
}else{
	Start-Process .\\Git-1.8.1.2-preview20130201.exe -ArgumentList "/SP- /SILENT /DIR=C:\\xingmin\\git /CLOSEAPPLICATIONS /NOCANCEL /NORESTART" -Wait
	& C:\xingmin\git\bin\sh.exe --login -c "git config --global user.name 'xingmin liu' && git config --global user.email xingminliu@qq.com"
}
Pop-Location