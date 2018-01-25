testing
atEnd
	^ self isExecutingBlock
		ifTrue: [ self closure startpc + self closure size - 1 = self pc ]
		ifFalse: [ self pc >= self method endPC ]