events-listening
addKeyboardListener: anObject 
	"Make anObject a listener for keyboard events. All keyboard events will
	be reported to the object."
	self
		keyboardListeners: (self addListener: anObject to: self keyboardListeners)