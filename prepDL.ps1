clear;
$rawURL =  "http://yourURLhere/pageOfInterest.htm"
$outputFile = './test.txt'
Invoke-WebRequest -Uri $rawURL | Select-String -Pattern 'href="([\S]+[\s\S]pdf)' -AllMatches |% { $_.Matches } | % { $_.Value } |  Out-File $outputFile
