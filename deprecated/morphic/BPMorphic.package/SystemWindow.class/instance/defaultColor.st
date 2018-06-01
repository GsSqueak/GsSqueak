initialization
defaultColor
	^ self userInterfaceTheme color
		ifNil: [Color veryVeryLightGray]