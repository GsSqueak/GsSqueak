mouse
createMouseEvent
	"create and return a new mouse event from the current mouse 
	position; this is useful for restarting normal event queue 
	processing after manual polling"

	| buttons modifiers pos mapped eventBuffer |
	eventBuffer := Array new: 8.
	buttons := self peekButtons.
	pos := self peekPosition.
	modifiers := buttons bitShift: -3.
	buttons := buttons bitAnd: 7.
	mapped := self mapButtons: buttons modifiers: modifiers.
	eventBuffer
		at: 1
		put: EventTypeMouse;
		 at: 2 put: Time eventMillisecondClock;
		 at: 3 put: pos x;
		 at: 4 put: pos y;
		 at: 5 put: mapped;
		 at: 6 put: modifiers.
	^ eventBuffer