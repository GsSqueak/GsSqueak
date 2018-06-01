colors
paneColorToUseWhenNotActive
	^ (self userInterfaceTheme unfocusedWindowColorModifier
		ifNil: [[:color | color darker]])
		value: self paneColorToUse