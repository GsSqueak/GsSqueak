objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	simpleMode ifNil: [simpleMode := false].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

