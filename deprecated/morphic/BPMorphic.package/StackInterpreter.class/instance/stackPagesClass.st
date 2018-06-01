initialization
stackPagesClass
	^ VMBIGENDIAN
		ifTrue: [InterpreterStackPagesMSB]
		ifFalse: [InterpreterStackPagesLSB]