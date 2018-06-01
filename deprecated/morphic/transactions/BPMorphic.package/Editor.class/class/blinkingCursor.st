preferences
blinkingCursor
	<preference: 'Blinking Text Cursor' category: 'Morphic' description: 'When true, the text cursor will blink.' type: #Boolean>
	^ BlinkingCursor
		ifNil: [true]