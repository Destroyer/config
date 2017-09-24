# Intel(R) AHCI/RAID Driver for Windows 7 32bit & 64bit / 8.1 64bit / 10 64bit.(WHQL)
# Intel(R) Rapid Storage Technology Driver Software V14.8.0.1042 for Windows 7 32bit & 64bit / 8.1 64bit / 10 64bit.(WHQL)
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_RST'
$version = '15.7.1.1015'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\intelrst" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\IRST15.7.1.1015_RS2_20170718.zip"
$setupFile = Join-Path "$unpackDir" "\Driver\AsusSetup.exe"
$setupFile2 = Join-Path "$unpackDir" "\Install\AsusSetup.exe"
$checksumtype = 'sha256'
$checksum64 ='cef8567c83d176096ba59d7d56013784b80e69cdef01fc89d172d06069d2aa08'
$url64 = "http://dlcdnet.asus.com/pub/ASUS/mb/05SATA/IRST15.7.1.1015_RS2_20170718.zip"


Get-ChocolateyWebFile $packageName $unpackFile -Url64bit $url64 -checksumtype $checksumtype -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
Remove-Item $unpackFile
