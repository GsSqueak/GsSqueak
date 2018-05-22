initialization
defaultColor

	^complexContents
		ifNil: [ super defaultColor ]
		ifNotNil: [ complexContents preferredColor ]