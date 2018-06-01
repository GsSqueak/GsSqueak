transforming
newRectButtonPressedDo: newRectBlock 
	"Track the outline of a new rectangle until mouse button 
	changes. newFrameBlock produces each new rectangle from the 
	previous. Only tracks while mouse is down."
	| rect newRect buttonNow delay |
	delay := Delay forMilliseconds: 10.
	buttonNow := Sensor anyButtonPressed.
	rect := self.
	Display
		border: rect
		width: 2
		rule: Form reverse
		fillColor: Color gray.
	[buttonNow]
		whileTrue: [delay wait.
			buttonNow := Sensor anyButtonPressed.
			newRect := newRectBlock value: rect.
			newRect = rect
				ifFalse: [Display
						border: rect
						width: 2
						rule: Form reverse
						fillColor: Color gray.
					Display
						border: newRect
						width: 2
						rule: Form reverse
						fillColor: Color gray.
					rect := newRect]].
	Display
		border: rect
		width: 2
		rule: Form reverse
		fillColor: Color gray.
	Project current pointerMoved. 
	Sensor processEvent: Sensor createMouseEvent.
	^ rect