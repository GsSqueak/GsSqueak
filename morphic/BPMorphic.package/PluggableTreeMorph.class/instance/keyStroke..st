event handling
keyStroke: event 
	^ (super keyStroke: event)
		or: [self basicKeyPressed: event keyCharacter]