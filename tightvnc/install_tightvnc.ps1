Push-Location
$curpwd = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $curpwd

& regedit /s .\tightvnc1.reg
& regedit /s .\tightvnc2.reg
Copy-Item .\TightVNC C:\xingmin\TightVNC  -Force -Recurse
& D:\TightVNC\tvnserver.exe -install -silent
& D:\TightVNC\tvnserver.exe -start -silent

Pop-Location