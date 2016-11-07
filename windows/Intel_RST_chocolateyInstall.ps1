# Intel(R) AHCI/RAID Driver for Windows 7 32bit & 64bit / 8.1 64bit / 10 64bit.(WHQL)
# Intel(R) Rapid Storage Technology Driver Software V14.8.0.1042 for Windows 7 32bit & 64bit / 8.1 64bit / 10 64bit.(WHQL)
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_RST'
$version = '14.8.0.1042'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\intelrst" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\IRST_Win7-81-10_64bit_V14801042.zip"
$setupFile = Join-Path "$unpackDir" "\IRST\Driver\AsusSetup.exe"
$setupFile2 = Join-Path "$unpackDir" "\IRST\Install\AsusSetup.exe"
$checksumtype = 'sha256'
$checksum ='32b4b1e0134d51ef4df4c57c26d0117d17c5d06f2424c65804e7e4ee0d4a23c1'
$checksum64 ='32b4b1e0134d51ef4df4c57c26d0117d17c5d06f2424c65804e7e4ee0d4a23c1'

$url = "http://dlcdnet.asus.com/pub/ASUS/misc/sata/IRST_Win7-81-10_64bit_V14801042.zip"
$url64 = "$url"


 
Get-ChocolateyWebFile $packageName $unpackFile $url $url64 -checksumtype $checksumtype -checksum $checksum -checksum64 $checksum
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile2
Remove-Item $unpackDir -Recurse -Force
