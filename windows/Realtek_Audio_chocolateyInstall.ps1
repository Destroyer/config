$packageName = 'Realtek_Audio'
$version = '6.0.1.7848'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\realtekaudiodriver" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Realtek_Audio_V7848_20160617.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/audio/Realtek_Audio_V7848_20160617.zip"
$url64 = "˜$url"

Get-ChocolateyWebFile $packageName $unpackFile $url $url64
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
