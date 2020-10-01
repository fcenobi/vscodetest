Test-NetConnection -ComputerName $1 -Port 3389 | Format-Table -AutoSize -Property Computername -HideTableHeaders
