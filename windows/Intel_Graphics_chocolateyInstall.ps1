# 	Intel_VGA_21.20.16.4542_Win64
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Graphics'
$version = '21.20.16.4542'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\intelgraphics" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Intel_VGA_2120164542_Win64.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum ='31a17b1f983ce49eb80d4f1edd982dae4f6ea3c15c439b87779c994db26b6ad3'
$checksum64 ='31a17b1f983ce49eb80d4f1edd982dae4f6ea3c15c439b87779c994db26b6ad3'

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/vga/Intel_VGA_2120164542_Win64.zip"
$url64 = "$url"
 
 
Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -checksumtype $checksumtype -checksum $checksum -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
