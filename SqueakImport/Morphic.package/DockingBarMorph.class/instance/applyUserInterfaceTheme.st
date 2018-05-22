update
applyUserInterfaceTheme

	| colorToUse |
	gradientRamp := nil.
	
	super applyUserInterfaceTheme.
	
	self setDefaultParameters.
	
	"Update properties of separating lines."
	colorToUse := self userInterfaceTheme lineColor ifNil: [Color gray: 0.9].
	self submorphs
		select: [:ea | ea knownName = #line]
		thenDo: [:line |
			line
				color: colorToUse;
				extent: (self userInterfaceTheme lineWidth ifNil: [2]) asPoint;
				borderStyle: (self userInterfaceTheme lineStyle ifNil: [BorderStyle inset]);
				borderColor: colorToUse].