file reader services
fileReaderServicesForFile: fullName suffix: suffix
	"Answer services for the given file"

	"Check whether the given path points to a directory or file."
	(FileDirectory default directoryExists: fullName) ifTrue: [^ #()].
		
	^ self servicesWithSuffixes
		select: [:spec | spec key anySatisfy: [:pattern | suffix = '*' or: [pattern match: suffix]]]
		thenCollect: [:spec | spec value]