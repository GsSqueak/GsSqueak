debugging-haltOnce
toggleHaltOnce
	self haltOnceEnabled
		ifTrue: [self clearHaltOnce]
		ifFalse: [self setHaltOnce]