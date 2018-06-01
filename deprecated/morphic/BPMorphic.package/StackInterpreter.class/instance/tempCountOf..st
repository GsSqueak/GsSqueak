compiled methods
tempCountOf: methodPointer 
	^ self
		temporaryCountOfMethodHeader: (objectMemory methodHeaderOf: methodPointer)