control primitives
activateNewClosureMethod: blockClosure
	"Similar to activateNewMethod but for Closure and newMethod."
	| theBlockClosure closureMethod newContext methodHeader numCopied where outerContext |

	DoAssertionChecks ifTrue:
		[objectMemory okayOop: blockClosure].
	outerContext := objectMemory fetchPointer: ClosureOuterContextIndex ofObject: blockClosure.
	DoAssertionChecks ifTrue:
		[objectMemory okayOop: outerContext].
	closureMethod := objectMemory fetchPointer: MethodIndex ofObject: outerContext.
	methodHeader := self headerOf: closureMethod.
	objectMemory pushRemappableOop: blockClosure.
	newContext := objectMemory allocateOrRecycleContext: (methodHeader bitAnd: LargeContextBit). "All for one, and one for all!"

	"allocateOrRecycleContext: may cause a GC; restore blockClosure and refetch outerContext et al"
	theBlockClosure := objectMemory popRemappableOop.
	outerContext := objectMemory fetchPointer: ClosureOuterContextIndex ofObject: theBlockClosure.
	numCopied := (objectMemory fetchWordLengthOf: theBlockClosure) - ClosureFirstCopiedValueIndex.

	"Assume: newContext will be recorded as a root if necessary by the
	 call to newActiveContext: below, so we can use unchecked stores."
	where :=  newContext + objectMemory baseHeaderSize.
	objectMemory longAt: where + (SenderIndex << objectMemory shiftForWord)
		put: activeContext.
	objectMemory longAt: where + (InstructionPointerIndex << objectMemory shiftForWord)
		put: (objectMemory fetchPointer: ClosureStartPCIndex ofObject: theBlockClosure).
	objectMemory longAt: where + (StackPointerIndex << objectMemory shiftForWord)
		put: (objectMemory integerObjectOf: argumentCount + numCopied).
	objectMemory longAt: where + (MethodIndex << objectMemory shiftForWord)
		put: (objectMemory fetchPointer: MethodIndex ofObject: outerContext).
	objectMemory longAt: where + (ClosureIndex << objectMemory shiftForWord)
		put: theBlockClosure.
	objectMemory longAt: where + (ReceiverIndex << objectMemory shiftForWord)
		put: (objectMemory fetchPointer: ReceiverIndex ofObject: outerContext).

	"Copy the arguments..."
	1 to: argumentCount do:
		[:i | objectMemory longAt: where + ((ReceiverIndex+i) << objectMemory shiftForWord)
				put: (self stackValue: argumentCount-i)].

	"Copy the copied values..."
	where := newContext + objectMemory baseHeaderSize + ((ReceiverIndex + 1 + argumentCount) << objectMemory shiftForWord).
	0 to: numCopied - 1 do:
		[:i| objectMemory longAt: where + (i << objectMemory shiftForWord)
				put: (objectMemory fetchPointer: i + ClosureFirstCopiedValueIndex
						  ofObject: theBlockClosure)].

	"The initial instructions in the block nil-out remaining temps."

	self pop: argumentCount + 1.
	self newActiveContext: newContext