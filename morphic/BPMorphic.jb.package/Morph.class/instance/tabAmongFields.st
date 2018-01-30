event handling
tabAmongFields
	^ Preferences tabAmongFields
		or: [self hasProperty: #tabAmongFields]