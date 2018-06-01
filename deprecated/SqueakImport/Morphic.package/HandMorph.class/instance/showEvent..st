events-debugging
showEvent: anEvent
	"Show details about the event on the display form. Useful for debugging."
	
	| message borderWidth |
	ShowEvents == true ifFalse: [^ self].
	
	borderWidth := 5.
	message := String streamContents: [:strm |
		strm
			nextPutAll: '[HandMorph >> #showEvent:]'; cr;
			nextPutAll: 'event'; tab; tab; tab; tab; nextPutAll: anEvent printString; cr;
			nextPutAll: 'keyboard focus'; tab; nextPutAll: self keyboardFocus printString; cr;
			nextPutAll: 'mouse focus'; tab; tab; nextPutAll: self mouseFocus printString].
		
	message := message asDisplayText
		foregroundColor: Color black
		backgroundColor: Color white.
	
	"Offset to support multiple hands debugging."
	Display fill: (0 @ 0 extent: message form extent + (borderWidth asPoint * 2)) rule: Form over fillColor: Color white.
	message displayOn: Display at: borderWidth asPoint + (0 @  ((owner hands indexOf: self) - 1 * message form height)).