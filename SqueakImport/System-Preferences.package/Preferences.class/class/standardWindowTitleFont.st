prefs - fonts
standardWindowTitleFont
	"Answer the standard font to use for window titles"

	^ (UserInterfaceTheme current get: #windowTitleFont)
		ifNil: [TextStyle defaultFont]