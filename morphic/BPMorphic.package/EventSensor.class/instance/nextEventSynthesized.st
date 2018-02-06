private
nextEventSynthesized
	"Return a synthesized event. This method is called if an event driven
	client wants to receive events but the primary user interface is not
	event-driven (e.g., the receiver does not have an event queue but
	only updates its state). This can, for instance, happen if a Morphic
	World is run in an MVC window. To simplify the clients work this
	method will always return all available keyboard events first, and then
	(repeatedly) the mouse events. Since mouse events come last, the
	client can assume that after one mouse event has been received
	there are no more to come. Note that it is impossible for EventSensor
	to determine if a mouse event has been issued before so the client
	must be aware of the possible problem of getting repeatedly the same
	mouse events. See HandMorph>>processEvents for an example on
	how to deal with this."
	"First check for keyboard"
	| _gsSqueakTemp_kbd _gsSqueakTemp_array _gsSqueakTemp_buttons _gsSqueakTemp_pos _gsSqueakTemp_modifiers _gsSqueakTemp_mapped |
	_gsSqueakTemp_array := Array new: 8.
	_gsSqueakTemp_kbd := self primKbdNext.
	_gsSqueakTemp_kbd
		ifNotNil: ["simulate keyboard event"
			_gsSqueakTemp_array at: 1 put: EventTypeKeyboard.
			"evt type"
			_gsSqueakTemp_array at: 2 put: Time eventMillisecondClock.
			"time stamp"
			_gsSqueakTemp_array
				at: 3
				put: (_gsSqueakTemp_kbd bitAnd: 255).
			"char code"
			_gsSqueakTemp_array at: 4 put: EventKeyChar.
			"key press/release"
			_gsSqueakTemp_array
				at: 5
				put: (_gsSqueakTemp_kbd bitShift: -8).
			"modifier keys"
			^ _gsSqueakTemp_array].
	"Then check for mouse"
	_gsSqueakTemp_pos := self peekPosition.
	_gsSqueakTemp_buttons := mouseButtons.
	_gsSqueakTemp_modifiers := _gsSqueakTemp_buttons bitShift: -3.
	_gsSqueakTemp_buttons := _gsSqueakTemp_buttons bitAnd: 7.
	_gsSqueakTemp_mapped := self mapButtons: _gsSqueakTemp_buttons modifiers: _gsSqueakTemp_modifiers.
	_gsSqueakTemp_array at: 1 put: EventTypeMouse;
		 at: 2 put: Time eventMillisecondClock;
		 at: 3 put: _gsSqueakTemp_pos x;
		 at: 4 put: _gsSqueakTemp_pos y;
		 at: 5 put: _gsSqueakTemp_mapped;
		 at: 6 put: _gsSqueakTemp_modifiers.
	^ _gsSqueakTemp_array