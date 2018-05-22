prefs - fonts
setCodeFontTo: aFont
	"Establish the code font."

	UserInterfaceTheme current
		set: #standardCodeFont
		to: aFont;
		apply.