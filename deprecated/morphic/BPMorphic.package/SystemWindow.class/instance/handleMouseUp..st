events
handleMouseUp: evt 
	"Some widgets grab the keyboard focus only on mouse-up. Hence, we
	need to update our looks."
	self updateFocusLookForKeyboardFocus.
	^ super handleMouseUp: evt