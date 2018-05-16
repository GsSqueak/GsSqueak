prefs - fonts
setListFontTo: aFont
	"Set the list font as indicated"

	UserInterfaceTheme current
		set: #standardListFont
		to: aFont;
		apply.

	"Smalltalk at: #ListParagraph ifPresent: [:lp | lp initialize].
	Smalltalk at: #Flaps ifPresent: [:flaps | flaps replaceToolsFlap]"