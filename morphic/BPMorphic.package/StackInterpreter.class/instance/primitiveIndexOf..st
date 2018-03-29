compiled methods
primitiveIndexOf: methodPointer 
	^ self
		primitiveIndexOfMethod: methodPointer
		header: (objectMemory methodHeaderOf: methodPointer)