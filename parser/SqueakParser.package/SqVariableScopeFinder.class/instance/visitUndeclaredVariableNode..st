visiting
visitUndeclaredVariableNode: aVariableNode 
	^ theVariable name = aVariableNode name
		ifTrue: [theVariable]