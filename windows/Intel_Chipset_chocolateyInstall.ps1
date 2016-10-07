$packageName = 'Intel_Chipset'
$version = '10.1.1.27'
$fileType = 'exe'
$silentArgs = '-s -norestart'
$unpackDir = New-Item "${ENV:TEMP}\intelchipsetdriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Intel_Chipset_V101127.zip"
$setupFile = Join-Path "$unpackDir" "SetupChipset.exe"

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/utils/Intel_Chipset_V101127.zip"
$url64 = "˜$url"

Get-ChocolateyWebFile $packageName $unpackFile $url $url64
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
