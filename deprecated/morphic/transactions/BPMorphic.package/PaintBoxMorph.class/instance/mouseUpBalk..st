user interface
mouseUpBalk: evt 
	"A button I own got a mouseDown, but the user moved out before
	letting up. Prevent this for the current tool. Some tool must stay
	selected. "
	tool state: #on.
	"keep current one, even if user balked on it"
	currentBrush
		ifNotNil: [currentBrush state: #on]