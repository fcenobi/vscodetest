
New-NetFirewallRule -Name "Block Rule (in)" `
                -Description "Bad IP'S" `
                -DisplayName "Block Rule (in)" `
                -Enabled True `
                -Profile Any `
                -Direction Inbound `
                -Action Block `
                -RemoteAddress ("13.54.0.0-13.54.0.255",
                                    "13.54.1.0-13.54.1.255",
                                    "13.54.2.0-13.54.2.255",
                                    "13.54.3.0-13.54.3.255" )



$name = @(Get-NetFirewallRule -Direction  Inbound  -Action Allow -Enabled True -Description *dhcp*)
#$#name = Get-NetFirewallRule -DisplayName "*dhcp*"
$ips = @("192.168.1.0/24")
foreach ($r in $name) { Set-NetFirewallRule -DisplayName $r.DisplayName -RemoteAddress $ips }




Get-NetFirewallRule -displayname *dhcp* | Get-NetFirewallAddressFilter | select -ExpandProperty RemoteAddress                                    
                                    
                                    
