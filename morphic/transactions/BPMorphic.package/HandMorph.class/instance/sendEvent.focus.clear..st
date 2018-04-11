private events
sendEvent: anEvent focus: focusHolder clear: aBlock 
	"Send the event to the morph currently holding the focus, or if none to
	the owner of the hand."
	| _gsSqueakTemp_result _gsSqueakTemp_w |
	focusHolder
		ifNotNil: [^ self
				sendFocusEvent: anEvent
				to: focusHolder
				clear: aBlock].
	_gsSqueakTemp_w := self world.
	_gsSqueakTemp_w
		becomeActiveDuring: [self
				becomeActiveDuring: [anEvent
						becomeActiveDuring: [_gsSqueakTemp_result := _gsSqueakTemp_w processEvent: anEvent]]].
	^ _gsSqueakTemp_result == #rejected
		ifTrue: [anEvent]
		ifFalse: ["filtered event"
			_gsSqueakTemp_result]