Get-VM | ? State -eq 'Off' | Set-VMProcessor -ExposeVirtualizationExtensions $true
#Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true

#The Set-VMProcessor cmdlet also accepts pipeline input. Therefore, you can do things like:
#get-VM | ? State -eq 'Off' | Set-VMProcessor -ExposeVirtualizationExtensions $true

	
#Get-VM | ? State -eq 'Off' | Set-VMProcessor -ExposeVirtualizationExtensions $true
