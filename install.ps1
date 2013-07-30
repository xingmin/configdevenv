
Push-Location
$curpwd = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $curpwd

& .\python3.3\install_python.ps1

& .\msysgit\install_git.ps1

Pop-Location
