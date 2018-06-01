menu
changeFont
	
	| chooser originalFont |
	originalFont := self fontToUse.
	self openModal: (
		Cursor wait showWhile: [
			| window |
			window := UIManager default 
				chooseFont: 'Choose a Font' 
				for: self 
				setSelector: #font: 
				getSelector: originalFont.
			"We have to save the model here, because it will be gone when the window is closed."
			chooser := window model. 
			window ]).
	originalFont = self fontToUse ifFalse: [
		"Ensure that we restore the original font in case it was changed, but Cancel was clicked."
		self font: (chooser result ifNil: [ originalFont ]) ]