prefs - fonts
standardEToysFont

	^ (UserInterfaceTheme current get: #eToysFont)
		ifNil: [self standardButtonFont]