# Asmedia_USB3_V1.16.35.1
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Asmedia_USB3'
$version = '1.16.35.1'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\asmediausb" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Asmedia_USB3_V116351.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum ='67358f14e0a1c6483aaf04f826cde0c0587ee47d1d90b4fa72b37be3bb928ac8'
$checksum64 ='67358f14e0a1c6483aaf04f826cde0c0587ee47d1d90b4fa72b37be3bb928ac8'

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/usb30/Asmedia_USB3_V116351.zip"
$url64 = "$url"


 
Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -checksumtype $checksumtype -checksum $checksum -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
