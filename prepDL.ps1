clear;
$rawURL =  "http://www.americanradiohistory.com/Modern_Electrics_Magazine.htm"
$output = './test.txt'
Invoke-WebRequest -Uri $rawURL | Select-String -Pattern 'href="([\S]+[\s\S]pdf)' -AllMatches |% { $_.Matches } | % { $_.Value } |  Out-File $output