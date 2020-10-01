#display ip and macaddress
function localmac {
Get-WmiObject win32_networkadapterconfiguration `
| Select-Object -Property @{name='IPAddress';Expression={($_.IPAddress[0])}},MacAddress `
| Where IPAddress -NE $null
}

function dischivm {
 param ( [string] $path)
 (Get-VM | Get-VMHardDiskDrive  |? Path -Like *$disco*) | Select-Object -Property  VMName,Path
 }

function ad-computer {
$computer =@($(Get-ADComputer -Filter * | Select-Object -Property name))
}

function localmac {

& getmac.exe /fo table /nh /v

}
