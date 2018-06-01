private events
generateMouseWheelEvent: keystrokeEvent direction: direction
	"Generate the appropriate mouse wheel event from the keystrokeEvent. Before calling this, ensure that the control key is pressed.
	
	This method can be discarded once the VM produces real mouse wheel events."
	
	^ MouseWheelEvent new
		setType: #mouseWheel
		position: keystrokeEvent position
		delta: 0 @ ((direction anyMask: 2r1000 "wheel up") ifTrue: [120] ifFalse: [-120])
		direction: direction
		buttons: (keystrokeEvent buttons bitAnd: 2r01111) "drop control key pressed for this conversion"
		hand: keystrokeEvent hand
		stamp: keystrokeEvent timeStamp