event handling
mouseMove: evt

	evt redButtonPressed ifFalse: [
		self editor updateCursorForEvent: evt.
		self enterClickableRegion: evt.
		^ self].

	self
		handleInteraction: [self editor mouseMove: evt]
		fromEvent: evt.