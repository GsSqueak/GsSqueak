sista inline primitives - unary
unaryPossibleRootInlinePrimitive
	"1041	possibleRoot
	non-immediate, not a forwarder => receiver is returned (should be
	effect-only) (If old, becomes gray and remembered to allow many
	unchecked stores in a row afterwards)"
	| _gsSqueakTemp_top |
	_gsSqueakTemp_top := self internalStackTop.
	self
		deny: (objectMemory isImmediate: _gsSqueakTemp_top).
	self
		deny: (objectMemory isOopForwarded: _gsSqueakTemp_top).
	(objectMemory isYoungObject: _gsSqueakTemp_top)
		ifFalse: [objectMemory possibleRootStoreInto: _gsSqueakTemp_top]