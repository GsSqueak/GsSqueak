events-processing
rejectsEvent: anEvent
	"Return true to reject the given event. Rejecting an event means neither the receiver nor any of it's submorphs will be given any chance to handle it."
	^self isLocked or:[self visible not]