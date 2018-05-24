*SqClasses-debugging-haltOnce
removeHaltCount
	(self class environment includesKey: #HaltCount) ifTrue: [
		self class environment removeKey: #HaltCount]
