objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	scalePoint ifNil: [scalePoint := 1.0@1.0].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

