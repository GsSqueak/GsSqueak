event handling
mouseUp: evt 
	self
		handleInteraction: [editor mouseUp: evt]
		fromEvent: evt