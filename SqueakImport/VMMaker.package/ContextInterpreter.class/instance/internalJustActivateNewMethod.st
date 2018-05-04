message sending
internalJustActivateNewMethod
	"Activate the new method but *do not* copy receiver or arguments from activeContext."
	| methodHeader initialIP newContext tempCount needsLarge where |
	<inline: true>

	methodHeader := self headerOf: newMethod.
	needsLarge := methodHeader bitAnd: LargeContextBit.
	(needsLarge = 0 and: [objectMemory getFreeContexts ~= objectMemory  nilContext])
		ifTrue: [newContext := objectMemory getFreeContexts.
				objectMemory setFreeContextsAfter: newContext]
		ifFalse: ["Slower call for large contexts or empty free list"
				newContext := objectMemory allocateOrRecycleContext: needsLarge].
	initialIP := ((LiteralStart + (self literalCountOfHeader: methodHeader)) * objectMemory bytesPerWord) + 1.
	tempCount := (methodHeader >> 19) bitAnd: 16r3F.

	"Assume: newContext will be recorded as a root if necessary by the
	 call to newActiveContext: below, so we can use unchecked stores."
	where := newContext + objectMemory baseHeaderSize.
	objectMemory longAt: where + (SenderIndex << objectMemory shiftForWord) put: activeContext.
	objectMemory longAt: where + (InstructionPointerIndex << objectMemory shiftForWord) put: (objectMemory integerObjectOf: initialIP).
	objectMemory longAt: where + (StackPointerIndex << objectMemory shiftForWord) put: (objectMemory integerObjectOf: tempCount).
	objectMemory longAt: where + (MethodIndex << objectMemory shiftForWord) put: newMethod.

	"Set the receiver..."
	objectMemory longAt: where + (ReceiverIndex << objectMemory shiftForWord) put: receiver.

	"clear all args and temps to nil in case it has been recycled"
	needsLarge := objectMemory getNilObj.  "needsLarge here used just as faster (register?) temp"
	ReceiverIndex + 1 to: tempCount + ReceiverIndex do:
		[:i | objectMemory longAt: where + (i << objectMemory shiftForWord) put: needsLarge].
	reclaimableContextCount := reclaimableContextCount + 1.

	activeContext := newContext.