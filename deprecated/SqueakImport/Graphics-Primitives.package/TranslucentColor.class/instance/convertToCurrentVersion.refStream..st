object fileIn
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	"1/13/1999 -- old versions did not have alpha??"
	varDict at: 'alpha' ifAbsent: [^ Color transparent].

	^super convertToCurrentVersion: varDict refStream: smartRefStrm.
	