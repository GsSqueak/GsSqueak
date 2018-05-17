prefs - fonts
setEToysTitleFontTo: aFont 
	"change the font used in eToys environment"

	UserInterfaceTheme current
		set: #eToysTitleFont
		to: aFont;
		apply.