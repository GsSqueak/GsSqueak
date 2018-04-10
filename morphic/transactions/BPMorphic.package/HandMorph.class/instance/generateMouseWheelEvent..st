private events
generateMouseWheelEvent: evtBuf 
	"Generate the appropriate mouse wheel event for the given raw event
	buffer "
	| _gsSqueakTemp_buttons _gsSqueakTemp_modifiers _gsSqueakTemp_deltaX _gsSqueakTemp_deltaY _gsSqueakTemp_stamp |
	_gsSqueakTemp_stamp := evtBuf second.
	_gsSqueakTemp_stamp = 0
		ifTrue: [_gsSqueakTemp_stamp := Time eventMillisecondClock].
	_gsSqueakTemp_deltaX := evtBuf third.
	_gsSqueakTemp_deltaY := evtBuf fourth.
	_gsSqueakTemp_modifiers := evtBuf fifth.
	_gsSqueakTemp_buttons := (_gsSqueakTemp_modifiers bitShift: 3)
				bitOr: (lastMouseEvent buttons bitAnd: 7).
	^ MouseWheelEvent new
		setType: #mouseWheel
		position: self position
		delta: _gsSqueakTemp_deltaX @ _gsSqueakTemp_deltaY
		direction: 0
		buttons: _gsSqueakTemp_buttons
		hand: self
		stamp: _gsSqueakTemp_stamp