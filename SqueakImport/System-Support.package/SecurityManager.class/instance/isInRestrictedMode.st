testing
isInRestrictedMode
	"Return true if we're in restricted mode"
	^(self canWriteImage 
		or:[self hasFileAccess 
		"or:[self hasSocketAccess]"]) not