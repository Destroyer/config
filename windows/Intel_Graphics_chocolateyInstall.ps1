# Intel	VGA22.20.16.4691_RS2Win10_20170718
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Graphics'
$version = '22.20.16.4691'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\intelgraphics" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\VGA22.20.16.4691_RS2Win10_20170718.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum64 ='ae9260187e7e4e9cd238470e92f9642f91120d6e66e1326028153a910a8da8b5'
$url64 = "http://dlcdnet.asus.com/pub/ASUS/mb/07VGA/VGA22.20.16.4691_RS2Win10_20170718.zip"


Get-ChocolateyWebFile $packageName $unpackFile -Url64bit $url64 -checksumtype $checksumtype -checksum64 $checksum64
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
