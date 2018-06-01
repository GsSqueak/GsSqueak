objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	smoothCurve ifNil: [smoothCurve := false].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

