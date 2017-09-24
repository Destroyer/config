# Intel(R) Gigabit Ethernet Driver
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Ethernet'
$version = '22.4.16.0'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\intelethernet" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\IntelLAN22.4.16.0_RS2_20170718.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum64 ='9addb9212356f35415b235bd1a430a712242b1ed385ef6e785b85df1bc754ce2'
$url64 = "http://dlcdnet.asus.com/pub/ASUS/mb/04LAN/IntelLAN22.4.16.0_RS2_20170718.zip"


Get-ChocolateyWebFile $packageName $unpackFile -Url64bit $url64 -checksumtype $checksumtype -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
