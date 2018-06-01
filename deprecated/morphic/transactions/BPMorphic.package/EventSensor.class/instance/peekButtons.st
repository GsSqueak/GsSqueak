accessing
peekButtons
	self fetchMoreEvents.
	self flushNonKbdEvents.
	^ mouseButtons