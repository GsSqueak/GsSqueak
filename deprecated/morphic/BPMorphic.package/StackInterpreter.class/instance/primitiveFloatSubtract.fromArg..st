arithmetic float primitives
primitiveFloatSubtract: rcvrOop fromArg: argOop 
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg |
	_gsSqueakTemp_rcvr := objectMemory loadFloatOrIntFrom: rcvrOop.
	_gsSqueakTemp_arg := objectMemory loadFloatOrIntFrom: argOop.
	self successful
		ifTrue: [self pop: 2 thenPushFloat: _gsSqueakTemp_rcvr - _gsSqueakTemp_arg]