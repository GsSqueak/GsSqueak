initialization
setDefaultParameters

	Preferences menuAppearance3d
		ifFalse: [self hasDropShadow: false]
		ifTrue: [
			self addDropShadow.
			self hasDropShadow: self isKeyWindow. "maybe turn off again"].
	
	self borderWidth: (self userInterfaceTheme borderWidth ifNil: [1]).
	label font: (self userInterfaceTheme titleFont ifNil: [TextStyle defaultFont]).