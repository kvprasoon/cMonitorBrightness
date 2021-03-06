
Function Get-TargetResource{
    [OutPutType([System.Collections.HashTable])]
    param(
        [Parameter(Mandatory)]
        [Int]$Level
    )
    $CIMObject = Get-CimInstance -Class WMIMonitorBrightness -Namespace Root\WMI
    Return @{ Level = $CIMObject.CurrentBrightness }
}

Function Set-TargetResource{
    param(
        [Parameter(Mandatory)]
        [Int]$Level,

        [Parameter(Mandatory=$false)]
        [Int]$TimeOut = 5
    )

    Get-CimInstance -Class WMIMonitorBrightnessMethods -Namespace Root\WMI |
    Invoke-CimMethod -Name WmiSetBrightness -Arguments @{Timeout = $TimeOut;Brightness = $Level}
}

Function Test-TargetResource{
    param(
        [Parameter(Mandatory)]
        [Int]$Level,

        [Parameter(Mandatory=$false)]
        [int]$Timeout
    )
    $CIMObject = Get-CimInstance -Class WMIMonitorBrightness -Namespace Root\WMI

    if( $CIMObject.CurrentBrightness -ne $Level ){
        Return $false
    }
    else{
        Return $true
    }
}

Export-ModuleMember -Function *-TargetResource
