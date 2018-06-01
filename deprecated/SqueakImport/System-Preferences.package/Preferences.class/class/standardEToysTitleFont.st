prefs - fonts
standardEToysTitleFont

	^ (UserInterfaceTheme current get: #eToysTitleFont)
		ifNil: [self standardEToysFont]