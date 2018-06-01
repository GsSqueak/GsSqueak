contexts
fetchStackPointerOf: aContext
	"Return the stackPointer of a Context or BlockContext."
	| sp |
	<inline: true>
	sp := objectMemory fetchPointer: StackPointerIndex ofObject: aContext.
	(objectMemory isIntegerObject: sp) ifFalse: [^0].
	^objectMemory integerValueOf: sp