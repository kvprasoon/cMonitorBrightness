$Property1 = New-xDscResourceProperty -Name Level -Type Sint16 -Attribute Key
#$Property2 = New-xDscResourceProperty -Name TimeOut -Type Sint32 -Attribute Read

New-xDscResource -Name MonitorBrightness -Property $Property1 -Path 'C:\Program Files\WindowsPowerShell\Modules\cMonitorBrightness' -FriendlyName MonitorBrightness -Force