*SqClasses-debugging-haltOnce
decrementAndCheckHaltCount
	self decrementHaltCount.
	^self checkHaltCountExpired
