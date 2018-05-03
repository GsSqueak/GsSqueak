arithmetic primitive support
checkIntegerResult: integerResult
	(self successful and: [objectMemory isIntegerValue: integerResult])
		ifTrue: [self pushInteger: integerResult]
		ifFalse: [self unPop: 2]