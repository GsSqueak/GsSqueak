comparison float primitives
primitiveFloatLess: rcvrOop thanArg: argOop 
	| _gsSqueakTemp_rcvr _gsSqueakTemp_arg |
	_gsSqueakTemp_rcvr := objectMemory loadFloatOrIntFrom: rcvrOop.
	_gsSqueakTemp_arg := objectMemory loadFloatOrIntFrom: argOop.
	^ _gsSqueakTemp_rcvr < _gsSqueakTemp_arg