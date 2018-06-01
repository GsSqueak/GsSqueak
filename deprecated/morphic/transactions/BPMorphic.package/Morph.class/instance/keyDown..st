event handling
keyDown: anEvent 
	"Handle a key down event. The default response is to let my
	eventHandler, if any, handle it."
	self eventHandler
		ifNotNil: [self eventHandler keyDown: anEvent fromMorph: self]