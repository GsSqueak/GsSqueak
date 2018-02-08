private events
sendFocusEvent: anEvent to: focusHolder clear: aBlock 
	"Send the event to the morph currently holding the focus"
	| _gsSqueakTemp_result _gsSqueakTemp_w |
	_gsSqueakTemp_w := focusHolder world
				ifNil: [aBlock value.
					^ anEvent].
	_gsSqueakTemp_w
		becomeActiveDuring: [self
				becomeActiveDuring: [anEvent
						becomeActiveDuring: [_gsSqueakTemp_result := focusHolder processFocusEvent: anEvent]]].
	^ _gsSqueakTemp_result == #rejected
		ifTrue: [anEvent]
		ifFalse: ["filtered event"
			_gsSqueakTemp_result]