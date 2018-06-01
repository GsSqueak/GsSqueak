code pane menu
shouldStyle
	^ shouldStyle
		ifNil: [self class shouldStyle]