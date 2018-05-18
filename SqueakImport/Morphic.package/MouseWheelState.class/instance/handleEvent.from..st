event processing
handleEvent: aMouseWheelEvent from: aHand
	"Every 120 units, raise the wheel flags for convenient mouse wheel programming. We choose not to send multiple mouse-wheel events for multiples of 120 because applications can always react to the actual delta values if they want to do more scrolling or zooming."
	
	| sign |
	currentDelta := currentDelta + aMouseWheelEvent wheelDelta.

	sign := currentDelta sign.
	currentDelta := currentDelta abs.

	(currentDelta x // 120) > 0 ifTrue: [
		sign x = 1
			ifTrue: [aMouseWheelEvent setWheelRight]
			ifFalse: [aMouseWheelEvent setWheelLeft]].

	(currentDelta y // 120) > 0 ifTrue: [
		sign y = 1
			ifTrue: [aMouseWheelEvent setWheelUp]
			ifFalse: [aMouseWheelEvent setWheelDown]].
		
	currentDelta := currentDelta \\ 120.
	currentDelta := currentDelta * sign.

	"Finally, send the event."
	HandMorph sendMouseWheelToKeyboardFocus
		ifFalse: [aHand sendMouseEvent: aMouseWheelEvent]
		ifTrue: [aHand sendEvent: aMouseWheelEvent focus: aHand keyboardFocus clear: [aHand keyboardFocus: nil]].
