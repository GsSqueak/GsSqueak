event handling
mouseWheel: evt

	evt isWheelUp ifTrue: [scrollBar scrollUp: 3].
	evt isWheelDown ifTrue: [scrollBar scrollDown: 3].