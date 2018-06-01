initialization
setDefaultParameters
	Preferences menuAppearance3d
		ifTrue: [self addDropShadow.
			self hasDropShadow: self isKeyWindow]
		ifFalse: [self hasDropShadow: false].
	self
		borderWidth: (self userInterfaceTheme borderWidth
				ifNil: [1]).
	label
		font: (self userInterfaceTheme titleFont
				ifNil: [TextStyle defaultFont])