code generation
emitCodeForStorePop: stack encoder: encoder 
	writeNode
		ifNil: [stack pop: 1.
			^ encoder genStorePopLiteralVar: index].
	writeNode
		emitCode: stack
		args: 1
		encoder: encoder
		super: false.
	stack pop: 1.
	encoder genPop