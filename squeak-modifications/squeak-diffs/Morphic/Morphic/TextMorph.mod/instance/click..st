event handling
click: evt

	self
		handleInteraction: [self editor click: evt]
		fromEvent: evt.