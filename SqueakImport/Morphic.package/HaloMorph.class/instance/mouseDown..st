events
mouseDown: event

	self isMagicHalo ifTrue: [
		self isMagicHalo: false.
		self magicAlpha: 1.0].
		
	super mouseDown: event.