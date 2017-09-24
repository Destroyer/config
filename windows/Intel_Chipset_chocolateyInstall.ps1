# Intel_chipset_10.1.1.44
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Chipset'
$version = '10.1.1.44'
$fileType = 'exe'
$silentArgs = '-s'
$unpackDir = New-Item "${ENV:TEMP}\intelchipsetdriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Chipset10.1.1.44_RS2_20170718.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum64 ='ba6cbc7f22671354b3deebedf83282ee6a5bd8087e2a0cb20d57366d931821d5'
$url64 = "http://dlcdnet.asus.com/pub/ASUS/mb/03CHIPSET/Chipset10.1.1.44_RS2_20170718.zip"

 
Get-ChocolateyWebFile $packageName $unpackFile -Url64bit $url64 -checksumtype $checksumtype -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
