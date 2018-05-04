control primitives
closureNumArgs: numArgs instructionPointer: initialIP numCopiedValues: numCopied
	| newClosure |
	<inline: true>
	newClosure := objectMemory
					instantiateSmallClass: (objectMemory splObj: ClassBlockClosure)
					sizeInBytes: (objectMemory bytesPerWord * (ClosureFirstCopiedValueIndex + numCopied)) + objectMemory baseHeaderSize.
	"Assume: have just allocated a new closure; it must be young. Thus, can use unchecked stores."
	objectMemory storePointerUnchecked: ClosureStartPCIndex ofObject: newClosure withValue: (objectMemory integerObjectOf: initialIP).
	objectMemory storePointerUnchecked: ClosureNumArgsIndex ofObject: newClosure withValue: (objectMemory integerObjectOf: numArgs).
	"It is up to the caller to store the outer context and copiedValues."
	^newClosure