prefs - fonts
setEToysFontTo: aFont 
	"change the font used in eToys environment"

	UserInterfaceTheme current
		set: #eToysFont
		to: aFont;
		apply.