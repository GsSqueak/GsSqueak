initialization
initForEvents
	mouseOverHandler := nil.
	lastMouseEvent := MouseEvent new setType: #mouseMove position: 0@0 buttons: 0 hand: self.
	lastEventBuffer := {1. 0. 0. 0. 0. 0. nil. nil}.
	self resetClickState.
	self addKeyboardCaptureFilter: self. "to convert unusual VM events"