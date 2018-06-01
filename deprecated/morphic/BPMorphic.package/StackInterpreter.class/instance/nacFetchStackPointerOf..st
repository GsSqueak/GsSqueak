internal interpreter access
nacFetchStackPointerOf: aContext 
	"A version of fetchStackPointerOf: for use when objects may be
	forwarded. Does not do an assert-check of the stack pointer being in
	bounds. "
	| _gsSqueakTemp_sp |
	_gsSqueakTemp_sp := objectMemory fetchPointer: StackPointerIndex ofObject: aContext.
	(objectMemory isIntegerObject: _gsSqueakTemp_sp)
		ifFalse: [^ 0].
	^ objectMemory integerValueOf: _gsSqueakTemp_sp