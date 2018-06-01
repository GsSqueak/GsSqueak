events
mouseDownDefault: evt
	lastMouse := nil.
	formToEdit depth = 1 ifTrue:
		[self brushColor: (originalForm colorAt: (self pointGriddedFromEvent: evt)) negated]