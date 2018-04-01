# Intel_chipset_11.7.0.1040
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Chipset'
$version = '11.7.0.1040'
$fileType = 'exe'
$silentArgs = '-s'
$unpackDir = New-Item "${ENV:TEMP}\intelchipsetdriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Consumer_11.7.0.1040.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum64 ='78638ddb6c4358813528e1d7bddfe93c7d02000a95bcc8c984b0f6af4dc09cc6'
$url64 = "http://dlcdnet.asus.com/pub/ASUS/mb/03CHIPSET/Consumer_11.7.0.1040.zip"

 
Get-ChocolateyWebFile $packageName $unpackFile -Url64bit $url64 -checksumtype $checksumtype -checksum64 $checksum64
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
