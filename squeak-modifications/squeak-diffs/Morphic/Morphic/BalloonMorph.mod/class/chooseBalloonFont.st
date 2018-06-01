utility
chooseBalloonFont
	"BalloonMorph chooseBalloonFont"

	Preferences 
		chooseFontWithPrompt:  'Ballon Help font...' translated
		andSendTo: self 
		withSelector: #setBalloonFontTo: 
		highlightSelector: #balloonFont