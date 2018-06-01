object fileIn
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	timeOfLastListUpdate ifNil: [timeOfLastListUpdate := 0].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

