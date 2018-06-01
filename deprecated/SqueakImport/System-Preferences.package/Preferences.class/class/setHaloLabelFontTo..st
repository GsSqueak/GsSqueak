prefs - fonts
setHaloLabelFontTo: aFont 
	"change the font used in eToys environment"

	UserInterfaceTheme current
		set: #haloLabelFont
		to: aFont;
		apply.