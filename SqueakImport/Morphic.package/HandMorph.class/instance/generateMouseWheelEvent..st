private events
generateMouseWheelEvent: evtBuf
	"Generate the appropriate mouse wheel event for the given raw event buffer"

	| buttons modifiers deltaX deltaY stamp |
	stamp := evtBuf second.
	stamp = 0 ifTrue: [stamp := Time eventMillisecondClock].
	deltaX := evtBuf third.
	deltaY := evtBuf fourth.
	modifiers := evtBuf fifth.
	buttons := (modifiers bitShift: 3) bitOr: (lastMouseEvent buttons bitAnd: 7).
	^ MouseWheelEvent new
		setType: #mouseWheel
		position: self position
		delta: deltaX@deltaY
		direction: 2r0000
		buttons: buttons	
		hand: self
		stamp: stamp