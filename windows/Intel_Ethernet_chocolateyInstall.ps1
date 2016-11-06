# Intel(R) Gigabit Ethernet Driver V20.2.4001.0 for Windows 10 64bit.(WHQL)
# https://www.asus.com/Motherboards/Z170-A/HelpDesk_Download/

$packageName = 'Intel_Ethernet'
$version = '20.2.4001.0'
$fileType = 'exe'
$silentArgs = '-s -noreboot'
$unpackDir = New-Item "${ENV:TEMP}\intelethernet" -ItemType Directory -Force
$unpackFile = "${ENV:TEMP}\Intel_Gigabit_Ethernet_Win7-81_V20230010_Win10_V20240010.zip"
$setupFile = Join-Path "$unpackDir" "AsusSetup.exe"
$checksumtype = 'sha256'
$checksum ='924415cc096dd26d002168162853916bbb13ffe002d018dff12450bb48e4ec8d'
$checksum64 ='924415cc096dd26d002168162853916bbb13ffe002d018dff12450bb48e4ec8d'

$url = "http://dlcdnet.asus.com/pub/ASUS/lan/Intel_Gigabit_Ethernet_Win7-81_V20230010_Win10_V20240010.zip"
$url64 = "$url"


 
Get-ChocolateyWebFile $packageName $unpackFile $url $url64
Get-ChocolateyUnzip $unpackFile $unpackDir
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $setupFile
Remove-Item $unpackDir -Recurse -Force
