code generation
emitCodeForValue: stack encoder: encoder 
	copiedValues
		do: [:copiedValue | copiedValue emitCodeForValue: stack encoder: encoder].
	closureCreationNode pc: encoder methodStreamPosition + 1.
	encoder
		genPushClosureCopyNumCopiedValues: copiedValues size
		numArgs: arguments size
		jumpSize: size.
	stack pop: copiedValues size;
		 push: 1.
	"Emit the body of the block"
	self emitCodeForEvaluatedClosureValue: stack encoder: encoder