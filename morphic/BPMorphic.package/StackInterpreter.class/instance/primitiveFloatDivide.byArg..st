arithmetic float primitives
primitiveFloatDivide: rcvrOop byArg: argOop 
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg |
	_gsSqueakTemp_rcvr := objectMemory loadFloatOrIntFrom: rcvrOop.
	_gsSqueakTemp_arg := objectMemory loadFloatOrIntFrom: argOop.
	self success: _gsSqueakTemp_arg ~= 0.0.
	self successful
		ifTrue: [self pop: 2 thenPushFloat: _gsSqueakTemp_rcvr / _gsSqueakTemp_arg]