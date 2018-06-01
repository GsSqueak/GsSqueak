private events
sendListenEvents: anEvent 
	"Send the given event to all registered event listeners."
	self sendListenEvent: anEvent to: self eventListeners.
	anEvent isKeyboard
		ifTrue: [self sendListenEvent: anEvent to: self keyboardListeners].
	anEvent isMouse
		ifTrue: [self sendListenEvent: anEvent to: self mouseListeners]