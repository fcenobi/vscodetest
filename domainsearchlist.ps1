$domainSearchList = Read-Host "Please enter a list of domain suffixes separated by semicolons (e.g. domain.local;domain.tld;int.domain.tld)"
$scopeToConfigure = Read-Host "Please enter the scope id of the scope to be configured (e.g. 192.168.1.0)"

$splittedDomainSearchList = $domainSearchList -split "\;"
$domainSearchListHexArray = @();

Foreach ($domain in $splittedDomainSearchList) 
{
    $splittedDomainParts = $domain -split "\."
    Foreach ($domainPart in $splittedDomainParts) 
    {
        $domainPartHexArray = @()
        $domainPartHexArray += $domainPart.Length
        $domainPartHexArray += $domainPart.ToCharArray();
        Foreach ($item in $domainPartHexArray) 
        {
            $domainSearchListHexArray += [System.Convert]::ToUInt32($item)
        }
    }
    $domainSearchListHexArray+= 0x00
}


Set-DhcpServerv4OptionValue -ScopeId $scopeToConfigure -OptionId 119 -Value $domainSearchListHexArray
