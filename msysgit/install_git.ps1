Push-Location
Write-Host "installing git for windows(msysgit)"
$curpwd = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $curpwd

& .\Git-1.8.1.2-preview20130201.exe /SP- /SILENT /DIR="C:\xingmin\git" /CLOSEAPPLICATIONS /NOCANCEL /NORESTART
& C:\xingmin\git\bin\sh.exe --login -c "git config --global user.name xingmin liu && git config --global user.email xingminliu@qq.com"


Pop-Location