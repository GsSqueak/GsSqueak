compiled methods
argumentCountOf: methodPointer 
	^ self
		argumentCountOfMethodHeader: (objectMemory methodHeaderOf: methodPointer)