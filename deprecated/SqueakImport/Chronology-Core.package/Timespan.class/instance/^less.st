ansi protocol
< comparand
	^(self noTimezone or: [comparand noTimezone])
		ifTrue: [self start hasSmallerTicksThan: comparand asDateAndTime]
		ifFalse: [self start < comparand asDateAndTime]
