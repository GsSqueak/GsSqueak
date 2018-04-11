pop up
popUpFor: morph at: position hand: hand 
	super
		popUpFor: morph
		at: position
		hand: hand.
	self startStepping.
	(Preferences haloTransitions
			or: [self isMagicHalo])
		ifTrue: [self magicAlpha: 0.0.
			self startSteppingSelector: #fadeInInitially]