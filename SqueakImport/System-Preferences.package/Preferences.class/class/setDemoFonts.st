prefs - fonts
setDemoFonts
	"Preferences setDemoFonts"

	| theme base |
	self inform: 'The current UI theme will be copied\and larger fonts be installed.' translated withCRs.
	
	(UserInterfaceTheme current name beginsWith: 'Demo')
		ifFalse: [
			"Create DEMO version of current theme."
			theme := UserInterfaceTheme named: 'Demo'.
			theme merge: UserInterfaceTheme current overwrite: true.
			theme apply].

	base := (TextStyle defaultFont name beginsWith: 'Darkmap')
		ifTrue: ['Darkmap DejaVu Sans'] ifFalse: ['Bitmap DejaVu Sans'].

	self setDefaultFonts: {
		{#setSystemFontTo:. base. 14}.
		{#setFixedFontTo:. 'BitstreamVeraSansMono'. 16}.
		{#setListFontTo:. base. 14}.
		{#setFlapsFontTo:. base. 12}.
		{#setEToysFontTo:. base. 14}.
		{#setPaintBoxButtonFontTo:. base. 14}.
		{#setMenuFontTo:. base	. 14}.
		{#setWindowTitleFontTo:. base, ' B'. 	14}.
		{#setBalloonHelpFontTo:. base. 12}.
		{#setCodeFontTo:. base. 14}.
		{#setButtonFontTo:. base. 	12}.
	}
