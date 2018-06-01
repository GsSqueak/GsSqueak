file reader registration
registeredFileReaderClasses
	FileReaderRegistry := nil. "wipe it out"
	^FileServices registeredFileReaderClasses
	