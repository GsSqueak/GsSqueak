prefs - fonts
standardSystemFont
	"Answer the standard system font "

	^ (UserInterfaceTheme current get: #standardSystemFont)
		ifNil: [TextStyle defaultFont]