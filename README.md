cMonitorBrightness
==

This DSC resource is created as part of my learning excercise.

Example
--
Below example will set the display brightness of the monitor to 80%.
```
Configuration MonBrightness {
    Import-DscResource -Name MonitorBrightness
    MonitorBrightness Intensity {
        Level = '80'
    }
}

MonBrightness -OutputPath C:\Temp
Start-DscConfiguration -Path C:\Temp -Verbose -Wait -Force
```