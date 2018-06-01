frame access
withSmallIntegerTags: value 
	self assert: ((self oopForPointer: value)
			bitAnd: objectMemory wordSize - 1)
			= 0.
	^ (self
		cCode: [self oopForPointer: value]
		inSmalltalk: [value bitAnd: objectMemory maxCInteger])
		+ objectMemory smallIntegerTag