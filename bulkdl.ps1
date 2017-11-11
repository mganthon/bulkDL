# This is a script for bulk downloading files from websites
clear;
$baseURL =  "http://yourURLhere/folderOfInterest/"
$destinationFolder = '.\Destination-Folder-Name'
$source = Get-Content .\test.txt
try {

    New-Item -ItemType "directory" -Path $destinationFolder
			
} catch [System.Exception] { 
	continue;
}


for ($i=0; $i -lt $source.Length; $i++)
{
    $DirectoryParts = $source[$i].Split("/");
    $Position = $destinationFolder + "\";
	for ($j=0; $j -lt $DirectoryParts.Length - 1; $j++){
		$Position += $DirectoryParts[$j] + "\"
		
		try {
            New-Item -ItemType "directory" $Position
		} catch [System.Exception] { 
			continue;
		}
	}
    Invoke-WebRequest -Uri ($baseURL+$source[$i]) -OutFile ($destinationFolder+"\\"+$source[$i])

}

# check the source count 
Write-Host ("Source: " + $source.Length)
