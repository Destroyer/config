##########
# Win10 / WinServer2016 Initial Setup Script
##########



##########
# Custom tweaks
##########

# Disable Windows Update automatic restart
Function DisableWindowsUpdateRestart {
	Write-Output "Disabling Windows update auto-restarts..."
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" -Name "AutoDownload" -Type DWord -Value 1
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\WindowsUpdate\UX\Settings" -Name "UxOption" -Type DWord -Value 1
}

# Disable snap assist
Function DisableSnapAssist {
	Write-Output "Disabling snap assist..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SnapAssist" -Type DWord -Value 0
}

# Disable automatic pagefile management
Function DisablePageFile {
	Write-Output "Disabling pagefile..."
	$cs = gwmi Win32_ComputerSystem
	if ($cs.AutomaticManagedPagefile) {
		$cs.AutomaticManagedPagefile = $False
		$cs.Put()
	}
	# Disable a *single* pagefile if any
	$pg = gwmi win32_pagefilesetting
	if ($pg) {
		$pg.Delete()
	}
}

Function DisableMixedRealityPortal {
	Write-Output "Setting Mixed Reality Portal value to 0 so that you can uninstall it in Settings..."
    $Holo = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic'    
    If (Test-Path $Holo) {
        Set-ItemProperty $Holo -Name FirstRunSucceeded -Value 0 -Verbose
	}
}

Function EnableEmojiPanel {
	Write-Output "Enabling emoji panel"
	$Emoji = 'HKLM:\SOFTWARE\Microsoft\Input\Settings'
    If (Test-Path $Emoji) {
        Set-ItemProperty $Emoji -Name EnableExpressiveInputShellHotkey -Type DWord -Value 1
	}
}

Function EnableVerboseSystemMessages {
	Write-Output "Enabling verbose system messages."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "VerboseStatus" -Type DWord -Value 1
}

Function ChangeDefaultNTP {
	Write-Output "Changing default NTP to CESNET."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" -Name "0" -Type String -Value "ntp.cesnet.cz"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" -Name "(Default)" -Type String -Value "0"
	
}
