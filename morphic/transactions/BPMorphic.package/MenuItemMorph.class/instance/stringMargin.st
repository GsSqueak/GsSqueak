layout
stringMargin
	^ Preferences tinyDisplay
		ifTrue: [1]
		ifFalse: [6]