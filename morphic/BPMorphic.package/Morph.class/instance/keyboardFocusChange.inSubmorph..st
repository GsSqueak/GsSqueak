-widgets-events
keyboardFocusChange: aBoolean inSubmorph: aMorph 
	"Give the owner a chance to update appearance if child changes
	focus. "
	self eventHandler isEventHandler
		ifTrue: [self eventHandler
				keyboardFocusChange: aBoolean
				inSubmorph: aMorph
				fromMorph: self]
		ifFalse: [self owner
				ifNotNil: [:owner | owner keyboardFocusChange: aBoolean inSubmorph: aMorph]]