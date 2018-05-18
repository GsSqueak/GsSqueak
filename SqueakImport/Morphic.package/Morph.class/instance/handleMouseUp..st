events-processing
handleMouseUp: anEvent
	"System level event handling."
	anEvent wasHandled ifTrue:[^self]. "not interested"
	anEvent hand mouseFocus == self ifFalse:[^self]. "Not interested in other parties"
	anEvent hand releaseMouseFocus: self.
	anEvent wasHandled: true.
	self mouseUp: anEvent.
	self stopSteppingSelector: #handleMouseStillDown:.