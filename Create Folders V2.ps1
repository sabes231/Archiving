function Archive($directory){
	$blocks = 10
	cd $directory
	$files = (gci *.* | where { ! $_.PSIsContainer })
	if ($files.count -lt 1){
		echo "There are no files to move"
	}
	else{
		$times = ($files.count / $blocks)
		$count = 1
		$index = 0
		do{
			for ($i=$index; $i -lt ($blocks * $count); $i++){
				if (($files[$i]))
				{
					$newDirectory = $files[$i].lastwritetime.Date.ToString('yyyy') + "\" + $files[$i].lastwritetime.Date.ToString('MM') + "\" + $files[$i].lastwritetime.Date.ToString('dd')
					if (!(Test-Path $newDirectory)){
						mkdir $newDirectory
					}
					Move-Item $files[$i].fullname $newDirectory 
			}
			$index =+ $blocks
			echo "$count Round of $blocks Files moved"
			$count++
			}while($times -gt $count )
			#Archive $directory $count
	}
}