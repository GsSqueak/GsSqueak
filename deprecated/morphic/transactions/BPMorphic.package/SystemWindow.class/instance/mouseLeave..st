events
mouseLeave: anEvent 
	"Handle a mouseEnter event, meaning the mouse just entered my
	bounds with no button pressed. The default response is to let my
	eventHandler, if any, handle it."
	super mouseLeave: anEvent.
	(model windowActiveOnFirstClick
			and: [Preferences mouseOverForKeyboardFocus
					or: [anEvent hand keyboardFocus notNil
							and: [anEvent hand keyboardFocus containingWindow ~= self]]])
		ifTrue: [self lookUnfocused]