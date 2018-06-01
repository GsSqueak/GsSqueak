message sending
activateNewMethod
	| newContext methodHeader initialIP tempCount nilOop where |

	methodHeader := self headerOf: newMethod.
	newContext := objectMemory allocateOrRecycleContext: (methodHeader bitAnd: LargeContextBit).

	initialIP := ((LiteralStart + (self literalCountOfHeader: methodHeader)) * objectMemory bytesPerWord) + 1.
	tempCount := (methodHeader >> 19) bitAnd: 16r3F.

	"Assume: newContext will be recorded as a root if necessary by the
	 call to newActiveContext: below, so we can use unchecked stores."

	where :=  newContext  + objectMemory baseHeaderSize.
	objectMemory longAt: where + (SenderIndex << objectMemory shiftForWord) put: activeContext.
	objectMemory longAt: where + (InstructionPointerIndex << objectMemory shiftForWord) put: (objectMemory integerObjectOf: initialIP).
	objectMemory longAt: where + (StackPointerIndex << objectMemory shiftForWord) put: (objectMemory integerObjectOf: tempCount).
	objectMemory longAt: where + (MethodIndex << objectMemory shiftForWord) put: newMethod.
	objectMemory longAt: where + (ClosureIndex << objectMemory shiftForWord) put: objectMemory getNilObj.

	"Copy the receiver and arguments..."
	0 to: argumentCount do:
		[:i | objectMemory longAt: where + ((ReceiverIndex+i) << objectMemory shiftForWord) put: (self stackValue: argumentCount-i)].

	"clear remaining temps to nil in case it has been recycled"
	nilOop := objectMemory getNilObj.
	argumentCount+1+ReceiverIndex to: tempCount+ReceiverIndex do:
		[:i | objectMemory longAt: where + (i << objectMemory shiftForWord) put: nilOop].

	self pop: argumentCount + 1.
	reclaimableContextCount := reclaimableContextCount + 1.
	self newActiveContext: newContext.