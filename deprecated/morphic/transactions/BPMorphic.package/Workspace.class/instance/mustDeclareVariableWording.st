variable declarations
mustDeclareVariableWording
	^ mustDeclareVariables not
		ifTrue: ['<yes> automatically create variable declaration' translated]
		ifFalse: ['<no> automatically create variable declaration' translated]