object fileIn
convertToCurrentVersion: varDict refStream: smartRefStrm

	"From Squeak3.5 [latest update: #5180] on 17 June 2003"
	varDict  at: 'defaultTextColor' put: Color black.
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm