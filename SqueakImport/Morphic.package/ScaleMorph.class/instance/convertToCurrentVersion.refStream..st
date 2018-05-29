objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	labelsAbove ifNil: [labelsAbove := true].
	captionAbove ifNil: [captionAbove := true].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.
