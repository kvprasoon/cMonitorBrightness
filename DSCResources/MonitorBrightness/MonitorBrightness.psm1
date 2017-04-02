. $PSScriptRoot\HelperMonitorBrightness.ps1

Function Get-TargetResource
{
[OutPutType([System.Collections.HashTable])]
param(
[Parameter(Mandatory)]
[Int]$Level
)

    Return @{ Level = Get-MonitorBrightness }

}

Function Set-TargetResource
{
    param(
    [Parameter(Mandatory)]
    [Int]$Level,

    [Int]$TimeOut = 5
    )

    Set-MonitorBrightness -Level $Level -TimeOut $TimeOut
}

Function Test-TargetResource
{
    param(
    [Parameter(Mandatory)]
    [Int]$Level,
    
    $Timeout
    )
    
    Return Test-MonitorBritghness -Level $Level
}

Export-ModuleMember -Function *-TargetResource


