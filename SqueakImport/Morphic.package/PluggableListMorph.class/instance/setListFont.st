menus
setListFont
	"set the font for the list"

	Preferences 
		chooseFontWithPrompt: 'Choose the font for this list' translated 
		andSendTo: self 
		withSelector: #font: 
		highlightSelector: #font