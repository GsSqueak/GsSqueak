private events
generateKeyboardEvent: evtBuf
	"Generate the appropriate mouse event for the given raw event buffer"

	| buttons modifiers type pressType stamp keyValue |
	stamp := evtBuf second.
	stamp = 0 ifTrue: [stamp := Time eventMillisecondClock].
	pressType := evtBuf fourth.
	pressType = EventKeyDown ifTrue: [type := #keyDown].
	pressType = EventKeyUp ifTrue: [type := #keyUp].
	pressType = EventKeyChar ifTrue: [type := #keystroke].
	modifiers := evtBuf fifth.
	buttons := (modifiers bitShift: 3) bitOr: (lastMouseEvent buttons bitAnd: 7).
	type = #keystroke
		ifTrue: [keyValue := (self keyboardInterpreter nextCharFrom: Sensor firstEvt: evtBuf) asInteger]
		ifFalse: [keyValue := evtBuf third].
	^ KeyboardEvent new
		setType: type
		buttons: buttons
		position: self position
		keyValue: keyValue
		hand: self
		stamp: stamp.
