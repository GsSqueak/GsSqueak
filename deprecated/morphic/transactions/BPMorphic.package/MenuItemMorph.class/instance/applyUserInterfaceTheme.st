updating
applyUserInterfaceTheme
	super applyUserInterfaceTheme.
	self
		color: (self userInterfaceTheme textColor
				ifNil: [Color black]);
		
		font: (self userInterfaceTheme font
				ifNil: [TextStyle defaultFont])