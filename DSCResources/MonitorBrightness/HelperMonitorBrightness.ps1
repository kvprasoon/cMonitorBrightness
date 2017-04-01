Function Get-MonitorBrightness
{
[OutPutType([Int])]    
    $WMIObject =Get-WmiObject -Class WMIMonitorBrightness -Namespace Root\WMI

    Return $WMIObject.CurrentBrightness

}

Function Set-MonitorBrightness
{

Param(
[Parameter(Mandatory)]
[Int]$Level,

$TimeOut = 5
)
    $WMIObject =Get-WmiObject -Class WMIMonitorBrightnessMethods -Namespace Root\WMI

    $WMIObject.WmiSetBrightness($TimeOut,$Level)
}

Function Test-MonitorBritghness
{
[OutPutType([Bool])]
Param(
[Parameter(Mandatory)]
[Int]$Level
)
    try{$WMIObject =Get-WmiObject -Class WMIMonitorBrightness -Namespace Root\WMI

    if( $WMIObject.CurrentBrightness -eq $Level )
    {
        Return $true
    }
    else
    {
        Return $true
    }
    }
    catch{
        return $false
    }
}

