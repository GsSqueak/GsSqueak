prefs - fonts
standardCodeFont

	^ (UserInterfaceTheme current get: #standardCodeFont)
		ifNil: [TextStyle defaultFont]