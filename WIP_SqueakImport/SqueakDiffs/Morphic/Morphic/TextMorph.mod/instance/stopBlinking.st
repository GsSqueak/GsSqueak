blinking
stopBlinking
	self stopSteppingSelector: #onBlinkCursor.
	self resetBlinkCursor. "Ensure caret visible."