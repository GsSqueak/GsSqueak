code generation
emitCodeForStore: stack encoder: encoder 
	fieldDef accessKey
		ifNil: [writeNode
				emitCode: stack
				args: 1
				encoder: encoder
				super: false]
		ifNotNil: [writeNode
				emitCode: stack
				args: 2
				encoder: encoder
				super: false]