sista inline primitives - unary
unaryClassPrimitive
	"1000	rawClass
	not a forwarder => Behavior (Same as class special send, but receiver
	is not a forwarder)"
	| _gsSqueakTemp_result _gsSqueakTemp_top |
	_gsSqueakTemp_top := self internalStackTop.
	self
		deny: (objectMemory isOopForwarded: _gsSqueakTemp_top).
	_gsSqueakTemp_result := objectMemory fetchClassOf: _gsSqueakTemp_top.
	self internalStackTopPut: _gsSqueakTemp_result