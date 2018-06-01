internal interpreter access
fetchStackPointerOf: aContext 
	"Return the stackPointer of a Context or BlockContext.
	Does not deal with married contexts. Use only for debug
	printing or object tracing functions. To obtain an accurate
	stack pointer use stackPointerForMaybeMarriedContext:"
	| _gsSqueakTemp_sp |
	_gsSqueakTemp_sp := objectMemory fetchPointer: StackPointerIndex ofObject: aContext.
	(objectMemory isIntegerObject: _gsSqueakTemp_sp)
		ifFalse: [^ 0].
	self assert: ReceiverIndex
			+ (objectMemory integerValueOf: _gsSqueakTemp_sp)
			< (objectMemory lengthOf: aContext).
	^ objectMemory integerValueOf: _gsSqueakTemp_sp