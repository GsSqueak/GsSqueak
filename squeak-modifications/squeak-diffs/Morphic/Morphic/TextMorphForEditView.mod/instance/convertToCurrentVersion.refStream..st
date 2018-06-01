objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	acceptOnCR ifNil: [acceptOnCR := false].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

