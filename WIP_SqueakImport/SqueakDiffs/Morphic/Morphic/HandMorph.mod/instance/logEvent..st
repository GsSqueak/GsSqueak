events-debugging
logEvent: anEvent
	"Update statistics for processed events."
	
	EventStats ifNil:[EventStats := IdentityDictionary new].
	EventStats at: #count put: (EventStats at: #count ifAbsent:[0]) + 1.
	EventStats at: anEvent type put: (EventStats at: anEvent type ifAbsent:[0]) + 1.