event handling
mouseUp: event

	dragOnOrOff := nil.  "So improperly started drags will have not effect"
	event hand newKeyboardFocus: self. 
	hasFocus := true.