keystroke helpers
showKeyboardHelp

	| help |
	help := self balloonMorphClass 
		string: 'Enter text to narrow selection\down to matching items ' withCRs
		for: self 
		corner: #topLeft.
	help popUpAt: self topCenter forHand: self activeHand