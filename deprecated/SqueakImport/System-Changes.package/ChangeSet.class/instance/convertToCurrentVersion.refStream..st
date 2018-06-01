converting
convertToCurrentVersion: varDict refStream: smartRefStrm

	"major change - 4/4/2000"
	
	varDict at: 'classChanges' ifPresent: [ :x | | newish |
		newish := self convertApril2000: varDict using: smartRefStrm.
		newish == self ifFalse: [^ newish].
		].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

