# Intel_VGA_V2019154474
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Graphics'
$version = '20.19.15.4474'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\intelgraphics" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Intel_VGA_V2019154474.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum ='6279077235be98221115faeaa7ec284e1c3739b6ce215e7b3cfaea909b847892'
$checksum64 ='6279077235be98221115faeaa7ec284e1c3739b6ce215e7b3cfaea909b847892'

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/vga/Intel_VGA_V2019154474.zip"
$url64 = "$url"
 
 
Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -checksumtype $checksumtype -checksum $checksum -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
