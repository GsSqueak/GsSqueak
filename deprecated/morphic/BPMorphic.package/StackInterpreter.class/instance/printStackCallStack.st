debug printing
printStackCallStack
	self
		printStackCallStackOf: (localFP
				ifNil: [framePointer])