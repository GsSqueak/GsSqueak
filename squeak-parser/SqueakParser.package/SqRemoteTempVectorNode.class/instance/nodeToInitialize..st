code generation
nodeToInitialize: encoder 
	^ SqAssignmentNode new
		variable: self
		value: (SqNewArrayNode new numElements: remoteTemps size)