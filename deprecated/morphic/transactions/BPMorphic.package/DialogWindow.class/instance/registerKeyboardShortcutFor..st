constructing
registerKeyboardShortcutFor: button 
	"Take the first alpha-numeric character that is not already used as a
	shortcut, and use it as a shortcut."
	(button valueOfProperty: #normalLabel) asString
		in: [:normalLabel | normalLabel
				do: [:char | char isAlphaNumeric
						ifTrue: [keyMap
								at: char asLowercase
								ifPresent: [:ea | "Ignore"
									nil]
								ifAbsent: [button
										setProperty: #normalLabel
										toValue: ('{1} ({2})' format: {normalLabel. char asLowercase}).
									button
										label: (button valueOfProperty: #normalLabel).
									^ keyMap at: char asLowercase put: button]]]]