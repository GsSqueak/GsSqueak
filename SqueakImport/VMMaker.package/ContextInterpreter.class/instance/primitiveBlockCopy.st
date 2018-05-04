control primitives
primitiveBlockCopy

	| context methodContext contextSize newContext initialIP |
	context := self stackValue: 1.
	(objectMemory isIntegerObject: (objectMemory fetchPointer: MethodIndex ofObject: context))
		ifTrue: ["context is a block; get the context of its enclosing method"
				methodContext := objectMemory fetchPointer: HomeIndex ofObject: context]
		ifFalse: [methodContext := context].
	contextSize := objectMemory sizeBitsOf: methodContext.  "in bytes, including header"
	context := nil.  "context is no longer needed and is not preserved across allocation"

	"remap methodContext in case GC happens during allocation"
	objectMemory pushRemappableOop: methodContext.
	newContext := objectMemory instantiateContext: (objectMemory splObj: ClassBlockContext) sizeInBytes: contextSize.
	methodContext := objectMemory popRemappableOop.

	initialIP := objectMemory integerObjectOf: (instructionPointer+1+3) - (method + objectMemory baseHeaderSize).
	"Was instructionPointer + 3, but now it's greater by 1 due to preIncrement"

	"Assume: have just allocated a new context; it must be young.
	 Thus, can use uncheck stores. See the comment in fetchContextRegisters."

	objectMemory storePointerUnchecked: InitialIPIndex ofObject: newContext withValue: initialIP.
	objectMemory storePointerUnchecked: InstructionPointerIndex ofObject: newContext withValue: initialIP.
	self storeStackPointerValue: 0 inContext: newContext.
	objectMemory storePointerUnchecked: BlockArgumentCountIndex ofObject: newContext withValue: (self stackValue: 0).
	objectMemory storePointerUnchecked: HomeIndex ofObject: newContext withValue: methodContext.
	objectMemory storePointerUnchecked: SenderIndex ofObject: newContext withValue: objectMemory getNilObj.

	self pop: 2 thenPush: newContext.