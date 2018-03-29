debug printing
printMethodFieldForPrintContext: aContext 
	self
		shortPrintOop: (objectMemory fetchPointer: MethodIndex ofObject: aContext)