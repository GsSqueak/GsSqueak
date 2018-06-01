events
mouseEnter: anEvent 
	"Handle a mouseEnter event, meaning the mouse just entered my bounds with no button pressed. The default response is to let my eventHandler, if any, handle it."
	super mouseEnter: anEvent.

	(self isActive and: [Preferences mouseOverForKeyboardFocus])
		ifTrue: [self lookFocused].