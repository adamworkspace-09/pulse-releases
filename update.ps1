# Pulse - mise a jour legere (~5 Mo) sans reinstaller.
$ErrorActionPreference = 'Stop'
$dir = Join-Path $env:LOCALAPPDATA 'Programs\pulse-desktop'
$base = 'https://github.com/adamworkspace-09/pulse-releases/releases/latest/download'
if (-not (Test-Path "$dir\Pulse.exe")) {
  Write-Host "Pulse n'est pas installe. Telecharge d'abord : $base/Pulse-Setup.exe"
  Read-Host 'Entree pour fermer'; exit
}
Write-Host 'Telechargement de la mise a jour de Pulse (~5 Mo)...'
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest "$base/app.asar" -OutFile "$dir\resources\app.asar.new" -UseBasicParsing
Get-Process Pulse -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 2
Move-Item -Force "$dir\resources\app.asar.new" "$dir\resources\app.asar"
Start-Process "$dir\Pulse.exe"
Write-Host 'Pulse est a jour !'
Start-Sleep -Seconds 2
