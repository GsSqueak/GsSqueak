initialization
setDefaultParameters
	self
		color: (self userInterfaceTheme color
				ifNil: [Color black]);
		
		font: (self userInterfaceTheme font
				ifNil: [TextStyle defaultFont]);
		
		textColor: (self userInterfaceTheme textColor
				ifNil: [Color black])