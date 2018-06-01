user interface
applyUserInterfaceTheme

	super applyUserInterfaceTheme.
	
	self
		setDefaultParameters;
		refreshWindowColor.

	self isLookingFocused
		ifTrue: [self lookUnfocused; lookFocused]
		ifFalse: [self lookFocused; lookUnfocused].
		
	self isCollapsed ifTrue: [self setProperty: #applyTheme toValue: true].