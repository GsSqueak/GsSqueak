keystroke helpers
showKeyboardHelp
	| _gsSqueakTemp_help |
	_gsSqueakTemp_help := self balloonMorphClass
				string: 'Enter text to narrow selection\down to matching items ' withCRs
				for: self
				corner: #topLeft.
	_gsSqueakTemp_help popUpAt: self topCenter forHand: self activeHand