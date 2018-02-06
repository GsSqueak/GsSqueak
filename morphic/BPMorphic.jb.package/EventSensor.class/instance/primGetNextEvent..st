private-I/O
primGetNextEvent: array 
	"Store the next OS event available into the provided array.
	Essential. If the VM is not event driven the ST code will fall
	back to the old-style mechanism and use the state based
	primitives instead."
	| _gsSqueakTemp_kbd _gsSqueakTemp_buttons _gsSqueakTemp_modifiers _gsSqueakTemp_pos _gsSqueakTemp_mapped |
	"Simulate the events"
	self halt.
	array at: 1 put: EventTypeNone.
	"assume no more events"
	"First check for keyboard"
	_gsSqueakTemp_kbd := self oldPrimKbdNext.
	_gsSqueakTemp_kbd = nil
		ifFalse: ["simulate keyboard event"
			array at: 1 put: EventTypeKeyboard.
			"evt type"
			array at: 2 put: Time eventMillisecondClock.
			"time stamp"
			array
				at: 3
				put: (_gsSqueakTemp_kbd bitAnd: 255).
			"char code"
			array at: 4 put: EventKeyChar.
			"key press/release"
			array
				at: 5
				put: (_gsSqueakTemp_kbd bitShift: -8).
			"modifier keys"
			^ self].
	"Then check for mouse"
	_gsSqueakTemp_buttons := self oldPrimMouseButtons.
	_gsSqueakTemp_pos := self oldPrimMousePt.
	_gsSqueakTemp_modifiers := _gsSqueakTemp_buttons bitShift: -3.
	_gsSqueakTemp_buttons := _gsSqueakTemp_buttons bitAnd: 7.
	_gsSqueakTemp_mapped := self mapButtons: _gsSqueakTemp_buttons modifiers: _gsSqueakTemp_modifiers.
	(_gsSqueakTemp_pos = mousePosition
			and: [(_gsSqueakTemp_mapped
					bitOr: (_gsSqueakTemp_modifiers bitShift: 3))
					= mouseButtons])
		ifTrue: [^ self].
	array at: 1 put: EventTypeMouse;
		 at: 2 put: Time eventMillisecondClock;
		 at: 3 put: _gsSqueakTemp_pos x;
		 at: 4 put: _gsSqueakTemp_pos y;
		 at: 5 put: _gsSqueakTemp_mapped;
		 at: 6 put: _gsSqueakTemp_modifiers