New-NetFirewallRule -Name Allow93.151.134.253 -DisplayName 'Allow from 93.151.134.253' -Enabled True -Direction Inbound -Protocol ANY -Action Allow -Profile ANY -RemoteAddress 93.151.134.253
New-NetFirewallRule -Name Allow2.38.58.4 -DisplayName 'Allow from 2.38.58.4' -Enabled True -Direction Inbound -Protocol ANY -Action Allow -Profile ANY -RemoteAddress 2.38.58.4
New-NetFirewallRule -Name Allow93.151.134.253OUT -DisplayName 'Allow from 93.151.134.253OUT' -Enabled True -Direction OUTBOUNT -Protocol ANY -Action Allow -Profile ANY -RemoteAddress 93.151.134.253
New-NetFirewallRule -Name Allow2.38.58.4OUT -DisplayName 'Allow from 2.38.58.4OUT' -Enabled True -Direction OUTBOUND -Protocol ANY -Action Allow -Profile ANY -RemoteAddress 2.38.58.4
