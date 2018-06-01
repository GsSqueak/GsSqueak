accessing
localCacheDir: aString
	self cacheDir:
		(FileDirectory default pathName,
		FileDirectory slash,
		aString,
		FileDirectory slash)