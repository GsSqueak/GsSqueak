return bytecodes
commonReturn
	"Note: Assumed to be inlined into the dispatch loop."

	| nilOop thisCntx contextOfCaller localCntx localVal unwindMarked |
	<inline: true>
	self sharedCodeNamed: 'commonReturn' inCase: 120.

	nilOop := objectMemory getNilObj. "keep in a register"
	thisCntx := activeContext.
	localCntx := localReturnContext.
	localVal := localReturnValue.

	"make sure we can return to the given context"
	((localCntx = nilOop) or:
	 [(objectMemory fetchPointer: InstructionPointerIndex ofObject: localCntx) = nilOop]) ifTrue: [
		"error: sender's instruction pointer or context is nil; cannot return"
		^self internalCannotReturn: localVal].

	"If this return is not to our immediate predecessor (i.e. from a method to its sender, or from a block to its caller), scan the stack for the first unwind marked context and inform this context and let it deal with it. This provides a chance for ensure unwinding to occur."
	thisCntx := objectMemory fetchPointer: SenderIndex ofObject: activeContext.

	"Just possibly a faster test would be to compare the homeContext and activeContext - they are of course different for blocks. Thus we might be able to optimise a touch by having a different returnTo for the blockreteurn (since we know that must return to caller) and then if active ~= home we must be doing a non-local return. I think. Maybe."
	[thisCntx = localCntx] whileFalse: [
		thisCntx = nilOop ifTrue:[
			"error: sender's instruction pointer or context is nil; cannot return"
			^self internalCannotReturn: localVal].
		"Climb up stack towards localCntx. Break out to a send of #aboutToReturn:through: if an unwind marked context is found"
		unwindMarked := self isUnwindMarked: thisCntx.
		unwindMarked ifTrue:[
			"context is marked; break out"
			^self internalAboutToReturn: localVal through: thisCntx].
		thisCntx := objectMemory fetchPointer: SenderIndex ofObject: thisCntx.
 ].

	"If we get here there is no unwind to worry about. Simply terminate the stack up to the localCntx - often just the sender of the method"
	thisCntx := activeContext.
	[thisCntx = localCntx]
		whileFalse:
		["climb up stack to localCntx"
		contextOfCaller := objectMemory fetchPointer: SenderIndex ofObject: thisCntx.

		"zap exited contexts so any future attempted use will be caught"
		objectMemory storePointerUnchecked: SenderIndex ofObject: thisCntx withValue: nilOop.
		objectMemory storePointerUnchecked: InstructionPointerIndex ofObject: thisCntx withValue: nilOop.
		reclaimableContextCount > 0 ifTrue:
			["try to recycle this context"
			reclaimableContextCount := reclaimableContextCount - 1.
			objectMemory recycleContextIfPossible: thisCntx].
		thisCntx := contextOfCaller].

	activeContext := thisCntx.
	(objectMemory oop: thisCntx isLessThan: objectMemory getYoungStart) ifTrue: [ objectMemory beRootIfOld: thisCntx ].

	self internalFetchContextRegisters: thisCntx.  "updates local IP and SP"
	self fetchNextBytecode.
	self internalPush: localVal.
