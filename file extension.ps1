CD "C:\Users\slara\Desktop\Toll's Files\"
#$extensionType = (ls *.* | Select-Object Extension -Unique)
$extensionType = ls *.*
#echo (( $extensionType | Select-Object Extension | Get-Unique -asString))
foreach ($ex in $extensionType){
    
    echo  ($ex | Select-Object Extension | Get-Unique -asString)
    }
    