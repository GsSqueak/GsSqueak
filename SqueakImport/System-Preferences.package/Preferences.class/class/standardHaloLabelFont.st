prefs - fonts
standardHaloLabelFont

	^ (UserInterfaceTheme current get: #haloLabelFont)
		ifNil: [TextStyle defaultFont]