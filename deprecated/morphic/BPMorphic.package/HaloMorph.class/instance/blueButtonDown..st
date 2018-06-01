events
blueButtonDown: event 
	self isMagicHalo
		ifTrue: [self isMagicHalo: false.
			self magicAlpha: 1.0]
		ifFalse: [super blueButtonDown: event]