initialization
setDefaultParameters

	self
		borderWidth: (self userInterfaceTheme borderWidth ifNil: [0]);
		borderColor: (self userInterfaceTheme borderColor ifNil: [Color black]);
		color: (self userInterfaceTheme color ifNil: [TranslucentColor r: 0.92 g: 0.92 b: 0.706 alpha: 0.749]).