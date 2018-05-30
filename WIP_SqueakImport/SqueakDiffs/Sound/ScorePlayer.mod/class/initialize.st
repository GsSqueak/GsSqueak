class initialization
initialize

	Smalltalk addToShutDownList: self.
	FileServices registerFileReader: self.