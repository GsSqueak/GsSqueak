object fileIn
convertToCurrentVersion: varDict refStream: smartRefStrm 
	acceptDroppedMorphs
		ifNil: [acceptDroppedMorphs := false].
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm