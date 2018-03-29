internal interpreter access
internalStackTopPutIntegerObjectOf: aValue 
	^ self
		internalStackTopPut: (objectMemory integerObjectOf: aValue)