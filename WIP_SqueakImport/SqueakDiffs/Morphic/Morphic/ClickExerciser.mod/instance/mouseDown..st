event handling
mouseDown: evt 
	"Do nothing upon mouse-down except inform the hand to watch for a  
	double-click; wait until an ensuing click:, doubleClick:, or drag:  
	message gets dispatched"
	Preferences disable: #NewClickTest .
	evt hand
		waitForClicksOrDrag: self
		event: evt
		selectors: self selectors
		threshold: HandMorph dragThreshold