typing/selecting keys
cr: aKeyboardEvent 
	"Append a carriage return character to the stream of characters."
	self addString: Character cr asString.
	^ false