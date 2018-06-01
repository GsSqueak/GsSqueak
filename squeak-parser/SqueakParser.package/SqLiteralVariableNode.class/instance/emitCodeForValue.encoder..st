code generation
emitCodeForValue: stack encoder: encoder 
	^ readNode
		ifNil: [stack push: 1.
			encoder genPushLiteralVar: index]
		ifNotNil: [readNode emitCodeForValue: stack encoder: encoder]