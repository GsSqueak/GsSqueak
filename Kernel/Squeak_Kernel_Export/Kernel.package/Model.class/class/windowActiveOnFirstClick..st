preferences
windowActiveOnFirstClick: aBoolean

	WindowActiveOnFirstClick := aBoolean.
	(Smalltalk classNamed: #SystemWindow) ifNotNil: [:c | c reconfigureWindowsForFocus].