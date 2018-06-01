squeaklet on server
squeakletDirectory

	| squeakletDirectoryName |
	squeakletDirectoryName := 'Squeaklets'.
	(FileDirectory default directoryExists: squeakletDirectoryName) ifFalse: [
		FileDirectory default createDirectory: squeakletDirectoryName
	].
	^FileDirectory default directoryNamed: squeakletDirectoryName