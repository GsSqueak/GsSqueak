events-listening
removeKeyboardListener: anObject
	"Remove anObject from the current keyboard listeners."
	self keyboardListeners: (self removeListener: anObject from: self keyboardListeners).