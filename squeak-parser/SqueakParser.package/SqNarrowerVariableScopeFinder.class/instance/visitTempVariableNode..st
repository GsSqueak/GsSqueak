visiting
visitTempVariableNode: aVariableNode 
	^ theVariable = aVariableNode
		ifTrue: [theVariable]