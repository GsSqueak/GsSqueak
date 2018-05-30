initialization
setDefaultParameters

	super setDefaultParameters.
	
	self
		font: (self userInterfaceTheme font ifNil: [TextStyle defaultFont]);
		textColor: (self userInterfaceTheme textColor ifNil: [Color black]).
		
	self setListParameters.