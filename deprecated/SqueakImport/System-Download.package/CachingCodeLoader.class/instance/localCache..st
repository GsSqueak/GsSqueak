accessing
localCache: stringArray
	| fd |
	fd := FileDirectory default.
	stringArray do:[:part|
		(fd directoryNames includes: part) 
			ifFalse:[fd createDirectory: part].
		fd := fd directoryNamed: part].
	self cacheDir: (fd pathName copyWith: fd pathNameDelimiter).