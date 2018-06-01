initialize-release
initialize

	FileServices registerFileReader: self.
	EncodeAndDecodeStdioFiles := true.
	TheStdioHandles := Array new: 3.
	Smalltalk
		addToStartUpList: self after: SecurityManager; "the intent being before: AutoStart"
		addToShutDownList: self after: SecurityManager