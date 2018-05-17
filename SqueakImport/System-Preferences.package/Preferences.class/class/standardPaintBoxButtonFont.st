prefs - fonts
standardPaintBoxButtonFont

	^ (UserInterfaceTheme current get: #paintBoxButtonFont)
		ifNil: [self standardButtonFont]