*SqClasses-debugging-haltOnce
haltOnce
	"Halt unless we have already done it once."
	self haltOnceEnabled
		ifTrue: [self clearHaltOnce.
			^ self halt]
