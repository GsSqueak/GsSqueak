update
applyUserInterfaceTheme
	| _gsSqueakTemp_colorToUse |
	super applyUserInterfaceTheme.
	self setDefaultParameters.
	"Update properties of separating lines."
	_gsSqueakTemp_colorToUse := self userInterfaceTheme lineColor
				ifNil: [Color gray: 0.9].
	self submorphs
		select: [:ea | ea knownName = #line]
		thenDo: [:line | line color: _gsSqueakTemp_colorToUse;
				
				height: (self userInterfaceTheme lineWidth
						ifNil: [2]);
				
				borderStyle: (self userInterfaceTheme lineStyle
						ifNil: [BorderStyle inset]);
				 borderColor: _gsSqueakTemp_colorToUse]