sista inline primitives - unary
unaryUnforwardInlinePrimitive: primIndex 
	"1039	unforwardNonImmediate
	non immediate => Not a forwarder
	1040	unforward
	Anything => Not a forwarder"
	"Only perf in jitted code matters, don't remove the immediate check"
	| _gsSqueakTemp_top |
	_gsSqueakTemp_top := self internalStackTop.
	self
		assert: (primIndex = 40
				or: [objectMemory isNonImmediate: _gsSqueakTemp_top]).
	(objectMemory isOopForwarded: _gsSqueakTemp_top)
		ifTrue: [self
				internalStackTopPut: (objectMemory followForwarded: _gsSqueakTemp_top)]