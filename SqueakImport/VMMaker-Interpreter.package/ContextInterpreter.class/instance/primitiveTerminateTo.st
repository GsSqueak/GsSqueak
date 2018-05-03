process primitives
primitiveTerminateTo
	"Primitive. Terminate up the context stack from the receiver up to but not including the argument, if previousContext is on my Context stack. Make previousContext my sender. This prim has to shadow the code in ContextPart>terminateTo: to be correct"
	| thisCntx currentCntx aContext nextCntx nilOop |
	aContext := self popStack.
	thisCntx := self popStack.

	"make sure that aContext is in my chain"
	(self context: thisCntx hasSender: aContext) ifTrue:[
		nilOop := objectMemory getNilObj.
		currentCntx := objectMemory fetchPointer: SenderIndex ofObject: thisCntx.
		[currentCntx = aContext] whileFalse: [
			nextCntx := objectMemory fetchPointer: SenderIndex ofObject: currentCntx.
			objectMemory storePointer: SenderIndex ofObject: currentCntx withValue: nilOop.
			objectMemory storePointer: InstructionPointerIndex ofObject: currentCntx withValue: nilOop.
			currentCntx := nextCntx]].

	objectMemory storePointer: SenderIndex ofObject: thisCntx withValue: aContext.
	^self push: thisCntx