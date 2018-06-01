debug printing
printMethodDictionaryOf: behavior 
	self
		printMethodDictionary: (objectMemory fetchPointer: MethodDictionaryIndex ofObject: behavior)