prefs - fonts
setFlapFontTo: aFont

	UserInterfaceTheme current
		set: #standardFlapFont
		to: aFont;
		apply.	
		
	"FlapTab allSubInstancesDo:
		[:aFlapTab | aFlapTab reformatTextualTab]"