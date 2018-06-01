prefs - fonts
standardFixedFont
	"Answer the standard fixed font "

	^ (UserInterfaceTheme current get: #standardFixedFont)
		ifNil: [TextStyle defaultFixedFont]