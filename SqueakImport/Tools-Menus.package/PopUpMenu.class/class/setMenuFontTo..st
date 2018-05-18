class initialization
setMenuFontTo: aFont
	"Set the menu font as indicated"

	MenuStyle := TextStyle fontArray: { aFont }.
	MenuStyle 
		gridForFont: 1 withLead: 0;
		centered.
	self allSubInstancesDo: [:m | m rescan]