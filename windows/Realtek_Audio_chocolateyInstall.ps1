# Realtek Audio
# Audio: REALTEK HM_TUF V6.0.1.7848
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Realtek_Audio'
$version = '6.0.1.7848'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\realtekaudiodriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Realtek_Audio_V7848_20160617.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum ='4dd21c7347222ce3116b23bcf1fdf4c26c072c3a78deb21361d46478859e2cad'
$checksum64 ='4dd21c7347222ce3116b23bcf1fdf4c26c072c3a78deb21361d46478859e2cad'

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/audio/Realtek_Audio_V7848_20160617.zip"
$url64 = "$url"

 
Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -checksumtype $checksumtype -checksum $checksum -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
