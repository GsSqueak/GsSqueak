construction
addKeyboard
	keyboard := PianoKeyboardMorph new soundPrototype: sound.
	keyboard align: keyboard bounds bottomCenter with: bounds bottomCenter - (0@4).
	self addMorph: keyboard