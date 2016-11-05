# Intel_Chipset_V10.1.1.27
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Chipset'
$version = '10.1.1.27'
$fileType = 'exe'
$silentArgs = '-s -norestart'
$unpackDir = New-Item "${ENV:TEMP}\intelchipsetdriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Intel_Chipset_V101127.zip"
$setupFile = Join-Path "$unpackDir" "SetupChipset.exe"
$checksumtype = 'sha256'
$checksum ='a27d0e2715cb6503ca645089260166f64ef42540529ad5cd8e334f994134dee3'
$checksum64 ='a27d0e2715cb6503ca645089260166f64ef42540529ad5cd8e334f994134dee3'

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/utils/Intel_Chipset_V101127.zip"
$url64 = "$url"

 
Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -checksumtype $checksumtype -checksum $checksum -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
