file directory
directoryNames
	"Return a collection of names for the subdirectories of this 
	directory. "
	^ self entries
		select: [:entry | entry isDirectory]
		thenCollect: [:entry | entry name]