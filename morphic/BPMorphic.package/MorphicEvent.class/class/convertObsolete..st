instance creation
convertObsolete: anEvent 
	"ar 10/25/2000: This method is used to convert OLD MorphicEvents
	into new ones."
	| _gsSqueakTemp_type _gsSqueakTemp_cursorPoint _gsSqueakTemp_buttons _gsSqueakTemp_keyValue _gsSqueakTemp_sourceHand |
	_gsSqueakTemp_type := anEvent type.
	_gsSqueakTemp_cursorPoint := anEvent cursorPoint.
	_gsSqueakTemp_buttons := anEvent buttons.
	_gsSqueakTemp_keyValue := anEvent keyValue.
	_gsSqueakTemp_sourceHand := anEvent hand.
	_gsSqueakTemp_type == #mouseMove
		ifTrue: [^ MouseMoveEvent new
				setType: #mouseMove
				startPoint: _gsSqueakTemp_cursorPoint
				endPoint: _gsSqueakTemp_cursorPoint
				trail: #()
				buttons: _gsSqueakTemp_buttons
				hand: _gsSqueakTemp_sourceHand
				stamp: nil].
	_gsSqueakTemp_type == #mouseDown | (_gsSqueakTemp_type == #mouseUp)
		ifTrue: [^ MouseButtonEvent new
				setType: _gsSqueakTemp_type
				position: _gsSqueakTemp_cursorPoint
				which: 0
				buttons: _gsSqueakTemp_buttons
				hand: _gsSqueakTemp_sourceHand
				stamp: nil].
	_gsSqueakTemp_type == #keystroke | (_gsSqueakTemp_type == #keyDown) | (_gsSqueakTemp_type == #keyUp)
		ifTrue: [^ KeyboardEvent new
				setType: _gsSqueakTemp_type
				buttons: _gsSqueakTemp_buttons
				position: _gsSqueakTemp_cursorPoint
				keyValue: _gsSqueakTemp_keyValue
				hand: _gsSqueakTemp_sourceHand
				stamp: nil].
	^ nil