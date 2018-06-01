objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	type ifNil: [type := #startSound].
	source ifNil: [source := varDict at: 'sourceHand'].
	argument ifNil: [argument := varDict at: 'sound' ifAbsent: [nil]].	"???"
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

