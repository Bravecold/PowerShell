## The *install-power-toys.ps1* Script

This PowerShell script installs the Microsoft Powertoys.

## Parameters
```powershell
/home/mf/Repos/PowerShell/Scripts/install-power-toys.ps1 [<CommonParameters>]

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Example
```powershell
PS> ./install-power-toys

```

## Notes
Author: Markus Fleschutz | License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

## Source Code
```powershell
<#
.SYNOPSIS
	Installs Microsoft Powertoys
.DESCRIPTION
	This PowerShell script installs the Microsoft Powertoys.
.EXAMPLE
	PS> ./install-power-toys
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	"Installing Microsoft Powertoys, please wait..."

	& winget install Microsoft.Powertoys --accept-package-agreements --accept-source-agreements
	if ($lastExitCode -ne "0") { throw "'winget install' failed" }

	"Microsoft Powertoys installed successfully."
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```

*Generated by convert-ps2md.ps1 using the comment-based help of install-power-toys.ps1*
