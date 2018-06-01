compiled methods
isOptimizedMethod: methodObj 
	^ self
		isOptimizedMethodHeader: (objectMemory methodHeaderOf: methodObj)