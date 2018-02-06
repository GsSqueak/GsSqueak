mouse
createMouseEvent
	"create and return a new mouse event from the current mouse 
	position; this is useful for restarting normal event queue 
	processing after manual polling"
	| _gsSqueakTemp_buttons _gsSqueakTemp_modifiers _gsSqueakTemp_pos _gsSqueakTemp_mapped _gsSqueakTemp_eventBuffer |
	_gsSqueakTemp_eventBuffer := Array new: 8.
	_gsSqueakTemp_buttons := self peekButtons.
	_gsSqueakTemp_pos := self peekPosition.
	_gsSqueakTemp_modifiers := _gsSqueakTemp_buttons bitShift: -3.
	_gsSqueakTemp_buttons := _gsSqueakTemp_buttons bitAnd: 7.
	_gsSqueakTemp_mapped := self mapButtons: _gsSqueakTemp_buttons modifiers: _gsSqueakTemp_modifiers.
	_gsSqueakTemp_eventBuffer at: 1 put: EventTypeMouse;
		 at: 2 put: Time eventMillisecondClock;
		 at: 3 put: _gsSqueakTemp_pos x;
		 at: 4 put: _gsSqueakTemp_pos y;
		 at: 5 put: _gsSqueakTemp_mapped;
		 at: 6 put: _gsSqueakTemp_modifiers.
	^ _gsSqueakTemp_eventBuffer