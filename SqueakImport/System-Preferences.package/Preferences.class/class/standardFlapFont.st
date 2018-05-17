prefs - fonts
standardFlapFont
	
	^ (UserInterfaceTheme current get: #standardFlapFont)
		ifNil: [self standardButtonFont]