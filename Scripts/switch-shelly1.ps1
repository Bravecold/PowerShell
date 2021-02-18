#!/bin/powershell
<#
.SYNTAX         ./switch-shelly1.ps1 [<IP-address>] [<turn-mode>] [<timer>]
.DESCRIPTION	switches a Shelly1 device in the local network
.LINK		https://github.com/fleschutz/PowerShell
.NOTES		Author:	Markus Fleschutz / License: CC0
#>

param($IPaddress = "", $TurnMode = "", [int]$Timer = -999)

try {
	if ($IPaddress -eq "") {
		$IPaddress = read-host "Enter IP address of the Shelly1 device"
	}
	if ($TurnMode -eq "") {
		$TurnMode = read-host "Enter turn mode (on/off/toggle)"
	}
	if ($Timer -eq -999) {
		[int]$Timer = read-host "Enter timer in seconds (0=endless)"
	}

	$Result = Invoke-RestMethod "http://$($IPaddress)/relay/0?turn=$($TurnMode)&timer=$($Timer)"
	
	write-host -foregroundColor green "Done - switched Shelly1 device at $IPaddress to $TurnMode for $Timer second(s)"
	exit 0
} catch {
	write-error "ERROR: line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
