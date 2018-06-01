prefs - fonts
chooseFixedFont
	self 
		chooseFontWithPrompt: 'Default fixed font...' translated
		andSendTo: self 
		withSelector: #setFixedFontTo: 
		highlightSelector: #standardFixedFont