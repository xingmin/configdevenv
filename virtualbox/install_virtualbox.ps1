
Push-Location
$curpwd = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $curpwd


Write-Host "install virtualbox"
& .\VirtualBox-4.2.10-84105-Win.exe 
& python autoinstallwin32.py

Pop-Location
