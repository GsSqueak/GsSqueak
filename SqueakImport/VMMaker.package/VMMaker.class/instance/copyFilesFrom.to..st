private - copying files
copyFilesFrom: srcDir to: dstDir
"This really ought to be a facility in file system. The major annoyance here is that file types and permissions are not handled by current Squeak code"
	[srcDir fileNames do: [:filenm | 
		self copyFileNamed: (srcDir fullNameFor: filenm) to: (dstDir fullNameFor: filenm)]] on: InvalidDirectoryError do:["do nothing if the directory is invalid"]
