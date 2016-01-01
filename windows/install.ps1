# disable cortana
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
# disable lockscreen
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$Item = Get-ItemProperty -Path $RegPath -Name "NoLockScreen"  -ErrorAction SilentlyContinue
New-Item -Path $RegPath -ErrorAction SilentlyContinue  | Out-Null
New-ItemProperty -Path $RegPath -Type "DWORD" -Name "NoLockScreen"  -Value 1 | Out-Null
Write-Host "Disable lock screen successfully."
 
# disable hibernation
powercfg -h off
 
# disable pagefile
Function Set-OSCVirtualMemory
{
        [cmdletbinding(SupportsShouldProcess=$true,DefaultParameterSetName="SetPageFileSize")]
        Param
        (
                [Alias('dl')]
                [String[]]$DriveLetter,
                [Parameter(Mandatory=$true,Position=3,ParameterSetName="None")]
                [Switch]$None,
        )
       
        If($PSCmdlet.ShouldProcess("Setting the virtual memory page file size"))
        {
                Foreach($DL in $DriveLetter)
                {              
                        If($None)
                        {
                                $PageFile = Get-WmiObject -Query "Select * From Win32_PageFileSetting Where Name='$DL\\pagefile.sys'" -EnableAllPrivileges
                                If($PageFile -ne $null)
                                {
                                        $PageFile.Delete()
                                }
                                Else
                                {
                                        Write-Warning """$DL"" is already set None!"
                                }
                        }
                }
        }
}
 
 Set-OSCVirtualMemory -none -Driveletter "C:","D:","E:","F:","G:"
 
 