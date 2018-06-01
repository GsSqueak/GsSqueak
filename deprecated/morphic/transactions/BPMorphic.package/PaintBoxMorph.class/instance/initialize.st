initialization
initialize
	super initialize.
	colorMemory
		ifNotNil: [colorMemory
				on: #mouseDown
				send: #takeColorEvt:from:
				to: self]