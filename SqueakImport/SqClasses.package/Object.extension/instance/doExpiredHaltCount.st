*SqClasses-debugging-haltOnce
doExpiredHaltCount
	self clearHaltOnce.
	self removeHaltCount.
	self halt
