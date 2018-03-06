code generation
emitCodeForValue: stack encoder: encoder 
	fieldDef accessKey
		ifNil: [rcvrNode emitCodeForValue: stack encoder: encoder.
			readNode
				emitCode: stack
				args: 0
				encoder: encoder
				super: false]
		ifNotNil: [rcvrNode emitCodeForValue: stack encoder: encoder.
			super emitCodeForValue: stack encoder: encoder.
			readNode
				emitCode: stack
				args: 1
				encoder: encoder
				super: false]