initialization
setDefaultParameters

	self
		borderWidth: (self userInterfaceTheme borderWidth ifNil: [1]);
		borderColor: (self userInterfaceTheme borderColor ifNil: [Color r: 0.46 g: 0.46 b: 0.353]);
		color: (self userInterfaceTheme color ifNil: [Color r: 0.92 g: 0.92 b: 0.706]);
		cornerStyle: (MenuMorph roundedMenuCorners ifTrue: [#rounded] ifFalse: [#square]).
		
	self updateGradient.