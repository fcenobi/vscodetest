echo . > C:\tools\scan1.txt
$ips = @(arp -a)

$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"

$host2scan =@($regex.Matches($ips) | %{ $_.value }|findstr 192.)

#$host2scan

foreach ($element in $host2scan ) {
	& 'C:\Program Files (x86)\Nmap\nmap.exe' $element  -Pn -n -v  -p 22,3389,80,443,5900 -oG C:\tools\$element.scan | out-null
 $array = @("open")
get-content C:\tools\$element.scan | where { foreach($item in $array) { $_.contains($item) } } >> C:\tools\scan1.txt

}


$rdphost1 = @(type C:\tools\scan1.txt | findstr "3389/open/tcp//ms-wbt-server///") 
$sshhost1 = @(type C:\tools\scan1.txt | findstr "22/open/tcp//ssh///")
$httphost1 = @(type C:\tools\scan1.txt | findstr "80/open/tcp//http///")
$httpshost1 = @(type C:\tools\scan1.txt | findstr "443/open/tcp//https///")
$vnchost1 = @(type C:\tools\scan1.txt | findstr "5900/open/tcp//vnc///")

$rdphost   =@($regex.Matches($rdphost1) | %{ $_.value })
$sshhost   =@($regex.Matches($sshhost1) | %{ $_.value })
$httphost  =@($regex.Matches($httphost1) | %{ $_.value })
$httpshost =@($regex.Matches($httpshost1) | %{ $_.value })
$vnchost   =@($regex.Matches($vnchost1) | %{ $_.value })

echo rdp
$rdphost
echo sshhost
$sshhost  
echo http
$httphost 
echo https
$httpshost
echo vnc
$vnchost  
foreach ($rdps in $rdphost ) {
	$rdps
}
