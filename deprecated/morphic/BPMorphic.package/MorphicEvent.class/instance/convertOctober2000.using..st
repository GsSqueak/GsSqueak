object fileIn
convertOctober2000: varDict using: smartRefStrm 
	"ar 10/25/2000: This method is used to convert OLD MorphicEvents
	into new ones."
	"These are going away #('type' 'cursorPoint' 'buttons' 'keyValue'
	'sourceHand'). Possibly store their info in another variable?"
	| _gsSqueakTemp_type _gsSqueakTemp_cursorPoint _gsSqueakTemp_buttons _gsSqueakTemp_keyValue _gsSqueakTemp_sourceHand |
	_gsSqueakTemp_type := varDict at: 'type'.
	_gsSqueakTemp_cursorPoint := varDict at: 'cursorPoint'.
	_gsSqueakTemp_buttons := varDict at: 'buttons'.
	_gsSqueakTemp_keyValue := varDict at: 'keyValue'.
	_gsSqueakTemp_sourceHand := varDict at: 'sourceHand'.
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
	"All others will be handled there"
	^ MorphicUnknownEvent new