menu
setTarget
	
	| newLabel |
	newLabel := UIManager default request: 'Enter an expression that create the target' translated initialAnswer: 'World'.
	newLabel isEmpty
		ifFalse: [self target: (Compiler evaluate: newLabel)]