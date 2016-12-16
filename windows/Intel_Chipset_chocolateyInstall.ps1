# Intel_chipset_10.1.1.38
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Chipset'
$version = '10.1.1.38'
$fileType = 'exe'
$silentArgs = '-s'
$unpackDir = New-Item "${ENV:TEMP}\intelchipsetdriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Intel_chipset_101138.zip"
$setupFile = Join-Path "$unpackDir" "SetupChipset.exe"
$checksumtype = 'sha256'
$checksum ='f7dd5b34eb18ebc5c690b05a163cc9f966b04c6c1ab6c24454f01bbec8f25252'
$checksum64 ='f7dd5b34eb18ebc5c690b05a163cc9f966b04c6c1ab6c24454f01bbec8f25252'

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/utils/Intel_chipset_101138.zip"
$url64 = "$url"

 
Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -checksumtype $checksumtype -checksum $checksum -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
