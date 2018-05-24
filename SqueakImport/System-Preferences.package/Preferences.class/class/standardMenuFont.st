prefs - fonts
standardMenuFont

	^ (UserInterfaceTheme current get: #standardMenuFont)
		ifNil: [TextStyle defaultFont]