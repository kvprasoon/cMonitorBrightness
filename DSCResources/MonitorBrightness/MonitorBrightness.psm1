
Function Get-TargetResource{
    [OutPutType([System.Collections.HashTable])]
    param(
        [Parameter(Mandatory)]
        [Int]$Level
    )
    $WMIObject = Get-WmiObject -Class WMIMonitorBrightness -Namespace Root\WMI
    Return @{ Level = $WMIObject.CurrentBrightness }
}

Function Set-TargetResource{
    param(
        [Parameter(Mandatory)]
        [Int]$Level,

        [Parameter(Mandatory=$false)]
        [Int]$TimeOut = 5
    )
    $WMIObject =Get-WmiObject -Class WMIMonitorBrightnessMethods -Namespace Root\WMI
    $WMIObject.WmiSetBrightness($TimeOut,$Level)
}

Function Test-TargetResource{
    param(
    [Parameter(Mandatory)]
    [Int]$Level,

    [Parameter(Mandatory=$false)]
    [int]$Timeout
    )
    $WMIObject = Get-WmiObject -Class WMIMonitorBrightness -Namespace Root\WMI

    if( $WMIObject.CurrentBrightness -ne $Level ){
        Return $false
    }
    else{
        Return $true
    }
}

Export-ModuleMember -Function *-TargetResource
