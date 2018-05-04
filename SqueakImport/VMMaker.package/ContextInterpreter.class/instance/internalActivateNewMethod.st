message sending
internalActivateNewMethod
	| methodHeader newContext tempCount argCount2 needsLarge where |
	<inline: true>

	methodHeader := self headerOf: newMethod.
	needsLarge := methodHeader bitAnd: LargeContextBit.
	(needsLarge = 0 and: [objectMemory getFreeContexts ~= objectMemory nilContext])
		ifTrue: [newContext := objectMemory getFreeContexts.
				objectMemory setFreeContextsAfter: newContext]
		ifFalse: ["Slower call for large contexts or empty free list"
				self externalizeIPandSP.
				newContext := objectMemory allocateOrRecycleContext: needsLarge.
				self internalizeIPandSP].
	tempCount := (methodHeader >> 19) bitAnd: 16r3F.

	"Assume: newContext will be recorded as a root if necessary by the
	 call to newActiveContext: below, so we can use unchecked stores."
	where :=   newContext + objectMemory baseHeaderSize.
	objectMemory longAt: where + (SenderIndex << objectMemory shiftForWord) put: activeContext.
	objectMemory longAt: where + (InstructionPointerIndex << objectMemory shiftForWord)
		put: (objectMemory integerObjectOf: (((LiteralStart + (self literalCountOfHeader: methodHeader)) * objectMemory bytesPerWord) + 1)).
	objectMemory longAt: where + (StackPointerIndex << objectMemory shiftForWord) put: (objectMemory integerObjectOf: tempCount).
	objectMemory longAt: where + (MethodIndex << objectMemory shiftForWord) put: newMethod.
	objectMemory longAt: where + (ClosureIndex << objectMemory shiftForWord) put: objectMemory getNilObj.

	"Copy the receiver and arguments..."
	argCount2 := argumentCount.
	0 to: argCount2 do:
		[:i | objectMemory longAt: where + ((ReceiverIndex+i) << objectMemory shiftForWord) put: (self internalStackValue: argCount2-i)].

	"clear remaining temps to nil in case it has been recycled"
	methodHeader := objectMemory getNilObj.  "methodHeader here used just as faster (register?) temp"
	argCount2+1+ReceiverIndex to: tempCount+ReceiverIndex do:
		[:i | objectMemory longAt: where + (i << objectMemory shiftForWord) put: methodHeader].

	self internalPop: argCount2 + 1.
	reclaimableContextCount := reclaimableContextCount + 1.
	self internalNewActiveContext: newContext.
 