debugging-haltOnce
halt: aString onCount: int 
	self haltOnceEnabled
		ifTrue: [self hasHaltCount
				ifTrue: [self decrementAndCheckHaltCount
						ifTrue: [self doExpiredHaltCount: aString]]
				ifFalse: [int = 1
						ifTrue: [self doExpiredHaltCount: aString]
						ifFalse: [self setHaltCountTo: int - 1]]]
