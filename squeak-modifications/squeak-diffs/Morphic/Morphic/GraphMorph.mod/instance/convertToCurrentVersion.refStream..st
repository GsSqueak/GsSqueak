objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	hasChanged ifNil: [hasChanged := false].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

