function transfer { curl -Headers @{"Max-Days" = "$($args[1])"} -method put -infile .\$($args[0]) https://transfer.sh/$($args[0]) | Select-Object -Expand content | clip}


function opusconv($file)
{
	$output = $file + ".wav"
	$output2 = $file + ".opus"
	ffmpeg.exe -i $file $output
	opusenc.exe --bitrate 160 $output $output2
	rm $output
}
# dynamically run code in ahk
function ahk($script)
{
    $pipeName = "AHK_" + [System.Environment]::TickCount
    $pipeDir = [System.IO.Pipes.PipeDirection]::Out
    $maxNum = [Int]254
    $pipeTMode = [System.IO.Pipes.PipeTransmissionMode]::Message
    $pipeOptions = [System.IO.Pipes.PipeOptions]::None
    
    $ahkPath = [Environment]::GetFolderPath("ProgramFiles") + "\AutoHotkey\AutoHotkey.exe"
    
    $pipe_ga = new-object System.IO.Pipes.NamedPipeServerStream($pipeName, $pipeDir, $maxNum, $pipeTMode, $pipeOptions)
        
    $pipe = new-object System.IO.Pipes.NamedPipeServerStream($pipeName, $pipeDir, $maxNum, $pipeTMode, $pipeOptions)
    
    if ($pipe_ga -and $pipe) {
        Start-Process $ahkPath "\\.\pipe\$pipeName"
        $pipe_ga.WaitForConnection()
        $pipe_ga.Dispose()
        $pipe.WaitForConnection()
        $script = [char]65279 + $script
        $sw = new-object System.IO.StreamWriter($pipe)
        $sw.Write($script)
            
        $sw.Dispose()
        $pipe.Dispose()
    } else { Write-Host "Operation cancelled: Failed to create named pipe" }
}
function su {
	param([string]$a)
	if ($a -eq "-")
	{
		Start-Process powershell -Verb runAs
	}
	else
	{
		Start-Process powershell.exe -Credential $a
	}
}
function w {
	$uptime = (get-date) - (gcim Win32_OperatingSystem).LastBootUpTime
	Write-Host("up {0} days, {1}:{2}" -f $uptime.Days, $uptime.Hours, $uptime.Minutes)
	query user /server:$SERVER
}
function full-history {
	cat $ENV:UserProfile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
}

# Linux aliases
Set-Alias xdg-open Invoke-Item
Set-Alias ll Get-ChildItem
Set-Alias df Get-Volume

# Source: https://github.com/mikemaccana/powershell-profile/blob/master/Microsoft.PowerShell_profile.ps1
function sed($file, $find, $replace){
	(Get-Content $file).replace("$find", $replace) | Set-Content $file
}

function sed-recursive($filePattern, $find, $replace) {
	$files = ls . "$filePattern" -rec
	foreach ($file in $files) {
		(Get-Content $file.PSPath) |
		Foreach-Object { $_ -replace "$find", "$replace" } |
		Set-Content $file.PSPath
	}
}


function grep($regex, $dir) {
	if ( $dir ) {
		ls $dir | select-string $regex
		return
	}
	$input | select-string $regex
}

function grepv($regex) {
	$input | ? { !$_.Contains($regex) }
}

function which($name) {
	Get-Command $name | Select-Object -ExpandProperty Definition
}
function killall($name) {
	ps $name -ErrorAction SilentlyContinue | kill
}
function pgrep($name) {
	ps $name
}
function touch($file) {
	"" | Out-File $file -Encoding ASCII
}
function sudo {
	$file, [string]$arguments = $args;
	$psi = new-object System.Diagnostics.ProcessStartInfo $file;
	$psi.Arguments = $arguments;
	$psi.Verb = "runas";
	$psi.WorkingDirectory = get-location;
	[System.Diagnostics.Process]::Start($psi) >> $null
}

function pstree {
	$ProcessesById = @{}
	foreach ($Process in (Get-WMIObject -Class Win32_Process)) {
		$ProcessesById[$Process.ProcessId] = $Process
	}

	$ProcessesWithoutParents = @()
	$ProcessesByParent = @{}
	foreach ($Pair in $ProcessesById.GetEnumerator()) {
		$Process = $Pair.Value

		if (($Process.ParentProcessId -eq 0) -or !$ProcessesById.ContainsKey($Process.ParentProcessId)) {
			$ProcessesWithoutParents += $Process
			continue
		}

		if (!$ProcessesByParent.ContainsKey($Process.ParentProcessId)) {
			$ProcessesByParent[$Process.ParentProcessId] = @()
		}
		$Siblings = $ProcessesByParent[$Process.ParentProcessId]
		$Siblings += $Process
		$ProcessesByParent[$Process.ParentProcessId] = $Siblings
	}

	function Show-ProcessTree([UInt32]$ProcessId, $IndentLevel) {
		$Process = $ProcessesById[$ProcessId]
		$Indent = " " * $IndentLevel
		if ($Process.CommandLine) {
			$Description = $Process.CommandLine
		} else {
			$Description = $Process.Caption
		}

		Write-Output ("{0,6}{1} {2}" -f $Process.ProcessId, $Indent, $Description)
		foreach ($Child in ($ProcessesByParent[$ProcessId] | Sort-Object CreationDate)) {
			Show-ProcessTree $Child.ProcessId ($IndentLevel + 4)
		}
	}

	Write-Output ("{0,6} {1}" -f "PID", "Command Line")
	Write-Output ("{0,6} {1}" -f "---", "------------")

	foreach ($Process in ($ProcessesWithoutParents | Sort-Object CreationDate)) {
		Show-ProcessTree $Process.ProcessId 0
	}
}

function unzip ($file) {
	$dirname = (Get-Item $file).Basename
	echo("Extracting", $file, "to", $dirname)
	New-Item -Force -ItemType directory -Path $dirname
	expand-archive $file -OutputPath $dirname -ShowProgress
}
. ~\Documents\WindowsPowerShell\shelljump\shelljump.ps1


# ---

function Get-Time { return $(get-date | foreach { $_.ToLongTimeString() } ) }
function prompt
{
    # Write the time 
    write-host "[" -noNewLine
    write-host $(Get-Time) -foreground yellow -noNewLine
    write-host "] " -noNewLine
	write-host "$env:UserName@" -noNewLine
	write-host $env:UserDomain":" -noNewLine
    # Write the path
    write-host $($(Get-Location).Path.replace($home,"~")) -foreground green -noNewLine
	# write-host $($(Get-Location).Path.replace($home,"~").replace("\","/")) -foreground green -noNewLine
    write-host $(if ($nestedpromptlevel -ge 1) { '>>' }) -noNewLine
	If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    return "$ "
	}
	Else {
	return "# "
	}
}
Clear-Host
cd ~

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
