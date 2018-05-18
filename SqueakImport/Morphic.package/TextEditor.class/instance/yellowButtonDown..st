events
yellowButtonDown: event
	"Process a yellow button event. Answer true if the event was handled, false otherwise."
	(paragraph attributesAt: event cursorPoint) do:[:attr|
		attr menu ifNotNil:[
			attr menu openAt: event cursorPoint.
			^true]].
	^false