event handling
mouseDown: evt 
	"Do nothing upon mouse-down except inform the hand to watch for a  
	double-click; wait until an ensuing click:, doubleClick:, or drag:  
	message gets dispatched"
	evt hand
		waitForClicksOrDrag: self
		event: evt
		selectors: #( #click: #doubleClick: #doubleClickTimeout: #startDrag:)
		threshold: HandMorph dragThreshold