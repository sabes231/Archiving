function Archive($directory){
	cd $directory
	$files = (gci *.* | where { ! $_.PSIsContainer } | select -first 50)
	if ($files.count -lt 1){
		echo "There are no files to move"
	}
	else{
		foreach ($file in $files){
			$newDirectory = $file.lastwritetime.Date.ToString('yyyy') + "\" + $file.lastwritetime.Date.ToString('MM') + "\" + $file.lastwritetime.Date.ToString('dd')
			if (!(Test-Path $newDirectory)){
				mkdir $newDirectory
			}
			Move-Item $file.fullname $newDirectory 
		}
		$count = $files.count
		echo "$count Files moved"
		
		Archive $directory $count
	}
}