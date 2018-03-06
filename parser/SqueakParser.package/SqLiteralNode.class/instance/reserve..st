code generation
reserve: encoder 
	"If this is a yet unused literal of type -code, reserve it."
	code < 0
		ifTrue: [index := key isVariableBinding
						ifTrue: ["true if sending value[:] to a special binding"
							encoder sharableLitIndex: key]
						ifFalse: [encoder litIndex: key].
			code := self code: index type: 0 - code]