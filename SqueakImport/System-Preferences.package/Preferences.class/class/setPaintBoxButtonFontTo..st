prefs - fonts
setPaintBoxButtonFontTo: aFont 
	"change the font used in the buttons in PaintBox."

	UserInterfaceTheme current
		set: #paintBoxButtonFont
		to: aFont;
		apply.