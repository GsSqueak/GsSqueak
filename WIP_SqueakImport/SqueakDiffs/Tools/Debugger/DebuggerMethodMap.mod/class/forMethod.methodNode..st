instance creation
forMethod: aMethod "<CompiledCode>" methodNode: methodNode "<MethodNode>"
	"Uncached instance creation method for private use or for tests.
	 Please consider using forMethod: instead."
	^(aMethod isBlueBookCompiled
			ifTrue: [DebuggerMethodMapForBlueBookMethods]
			ifFalse:
				[aMethod encoderClass supportsFullBlocks
					ifTrue: [DebuggerMethodMapForFullBlockCompiledMethods]
					ifFalse: [DebuggerMethodMapForClosureCompiledMethods]]) new
		forMethod: aMethod homeMethod
		methodNode: methodNode