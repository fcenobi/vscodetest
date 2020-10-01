$TargetLanguage = "it"


# Create a list object to store the finished translation in.

$Translation = New-Object System.Collections.Generic.List[System.Object]

$Text = @"
Translates text even even with special characters like " ' ` $ works without issue, though the API may mangle them a bit. Not sure what the limit of line length is, but it seems like you can get away with quite a bit.
It works fine for multiple lines as well.
You can inject code into this block too using the `$(code) format.
Here's the date as an example $(Get-Date).
Due to this you may want to escape the usual Powershell characters, like $ in certain cases like I did above.
If you're just going to have plain text here change the here-string to single quotes instead and anything goes.
Not sure if the API has a rate limit for how much it'll take, but I tried a whole bunch of lines (40+) with
success so at least shorter texts seems to work fine.
"@
<# # This can be used to instead use a text file as input.$Text = Get-Content C:\script\test\totranslate.txt -Raw#>

$Uri = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$($TargetLanguage)&dt=t&q=$Text"

# Get the response from the web request, then throw a bunch of regex at it to clean it up.

$RawResponse = (Invoke-WebRequest -Uri $Uri -Method Get).Content
$CleanResponse = $RawResponse -split '\\r\\n' -replace '^(","?)|(null.*?\[")|\[{3}"' -split '","'



<# Selecting every odd line and adding it to the $Translation list, we recreate the full translated text.Credit to: http://stuckinmypowershell.blogspot.com/2013/04/powershell-diy-reading-every-other-line.htmlfor the $Linenumber%2 method. Check it out to learn what's happening if it looks weird.#>


$LineNumber = 0
foreach ($Line in $CleanResponse)
{
	$LineNumber++
	if ($LineNumber % 2)
	{
		$Translation.Add($Line)
	}
}


$Translation


