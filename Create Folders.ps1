#echo Create directories for files
#echo ls | get-date -Uformat "%m_%Y" | mkdir $val
#[int]$mont = 1

#while ($mont -ne 13)
#{
#	$Udir = [convert]::ToString($mont) + "_2014"
#	if(!(Test-Path $Udir)){
#		mkdir $Udir
#	}
#	$mont++
#}

echo "Move files to their respective directory"

echo "get date and move to respective folder"
#(Get-ChildItem "C:\Users\slara\Desktop\Toll's Files" -recurse -ea 0 | Format-Wide -column 1 ) > all.txt
#(Get-ChildItem "C:\Users\slara\Desktop\Toll's Files" -recurse -ea 0 | Format-Wide -property lastwritentime)

#$strArray = (Get-ChildItem "C:\Users\slara\Desktop\Toll's Files" -recurse -ea 0 | Format-Wide -column 1)

CD "C:\Users\slara\Desktop\Toll's Files\"
#$extensionType = (Get-ChildItem -recurse | Select-Object Extension -Unique)
#echo $extensionType

#foreach ($ex in $extensionType){
#    [String]$ex = "*" + [String]$ex
#    $files = ls $ex
    $files = ls "*.hkg"
    if([bool]$files){
        foreach ($file in $files){
        	$directory = $file.lastwritetime.Date.ToString('yyyy') + "\" + $file.lastwritetime.Date.ToString('MM') + "\" + $file.lastwritetime.Date.ToString('dd')
        	if (!(Test-Path $directory)){
        		mkdir $directory
        		}
        	Move-Item $file.fullname $directory 
        	echo "Files moved"
        }
	}
    else{
       echo "There are no files to move"
    }
#}