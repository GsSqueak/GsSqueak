*SqClasses-debugging-haltOnce
checkHaltCountExpired
	| counter |
	counter := Smalltalk at: #HaltCount ifAbsent: [0].
	^counter = 0
