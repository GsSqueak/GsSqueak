event handling
keyStroke: anEvent 
	"Handle a keystroke event. The default response is to let my
	eventHandler, if any, handle it."
	self eventHandler
		ifNotNil: [self eventHandler keyStroke: anEvent fromMorph: self]