event handling
mouseMove: evt 
	evt redButtonPressed
		ifFalse: [^ self enterClickableRegion: evt].
	self
		handleInteraction: [self editor mouseMove: evt]
		fromEvent: evt