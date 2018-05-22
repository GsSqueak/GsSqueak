class initialization
initialize  "PopUpMenu initialize"
	(MenuStyle := TextStyle default copy)
		gridForFont: TextStyle default defaultFontIndex withLead: 0;
		centered.
	PopUpMenu allSubInstancesDo: [:m | m rescan]