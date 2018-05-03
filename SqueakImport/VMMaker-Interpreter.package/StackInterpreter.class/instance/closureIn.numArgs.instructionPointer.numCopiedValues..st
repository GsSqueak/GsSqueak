control primitives
closureIn: context numArgs: numArgs instructionPointer: initialIP numCopiedValues: numCopied
	| newClosure |
	<inline: true>
	self assert: (objectMemory bytesPerWord * (ClosureFirstCopiedValueIndex + numCopied)) + objectMemory baseHeaderSize <= 252.
	newClosure := objectMemory
					eeInstantiateSmallClass: (objectMemory splObj: ClassBlockClosure)
					sizeInBytes: (objectMemory bytesPerWord * (ClosureFirstCopiedValueIndex + numCopied)) + objectMemory baseHeaderSize.
	"Assume: have just allocated a new closure; it must be young. Thus, can use unchecked stores."
	objectMemory storePointerUnchecked: ClosureOuterContextIndex ofObject: newClosure withValue: context.
	objectMemory storePointerUnchecked: ClosureStartPCIndex ofObject: newClosure withValue: (objectMemory integerObjectOf: initialIP).
	objectMemory storePointerUnchecked: ClosureNumArgsIndex ofObject: newClosure withValue: (objectMemory integerObjectOf: numArgs).
	^newClosure