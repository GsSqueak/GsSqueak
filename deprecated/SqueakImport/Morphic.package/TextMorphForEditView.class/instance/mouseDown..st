event handling
mouseDown: event

	event yellowButtonPressed ifTrue: [
		(self editor yellowButtonDown: event) ifTrue:[^self].
		^ editView yellowButtonActivity: event shiftPressed].
	^ super mouseDown: event
