# Realtek Audio Driver V6.0.1.8158
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Realtek_Audio'
$version = '6.0.1.8158'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\realtekaudiodriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Realtek_AudioDriver_Win7-10_V6018158_20170607.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum64 ='5105497d2021c38792d5609b9b49b886763fd5b5809a13131f7e971fb2a5b948'
$url64 = "http://dlcdnet.asus.com/pub/ASUS/mb/01AUDIO/Realtek_AudioDriver_Win7-10_V6018158_20170607.zip"


Get-ChocolateyWebFile $packageName $unpackFile -Url64bit $url64 -checksumtype $checksumtype -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
