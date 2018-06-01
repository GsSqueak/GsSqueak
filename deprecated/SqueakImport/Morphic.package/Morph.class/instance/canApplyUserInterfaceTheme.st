visual properties
canApplyUserInterfaceTheme
	^ self isInWorld and: [(self hasProperty: #noUserInterfaceTheme) not]