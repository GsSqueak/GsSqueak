updating
applyUserInterfaceTheme

	super applyUserInterfaceTheme.
	
	self
		changed: #okColor;
		changed: #cancelColor;
		changed: #addColor.