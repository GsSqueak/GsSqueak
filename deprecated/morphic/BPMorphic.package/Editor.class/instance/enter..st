typing/selecting keys
enter: aKeyboardEvent 
	"Enter / return key was pressed"
	"Process the various Enter / Return keystrokes"
	morph acceptOnCR
		ifTrue: [self closeTypeIn.
			^ true].
	aKeyboardEvent controlKeyPressed
		ifTrue: [^ self cr: aKeyboardEvent].
	aKeyboardEvent shiftPressed
		ifTrue: [^ self lf: aKeyboardEvent].
	aKeyboardEvent commandAltKeyPressed
		ifTrue: [^ self crlf: aKeyboardEvent].
	^ self crWithIndent: aKeyboardEvent