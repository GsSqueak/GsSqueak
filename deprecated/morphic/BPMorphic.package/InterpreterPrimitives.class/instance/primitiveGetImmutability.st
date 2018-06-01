object access primitives
primitiveGetImmutability
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := self stackValue: 0.
	self
		pop: argumentCount + 1
		thenPushBool: (objectMemory isOopImmutable: _gsSqueakTemp_rcvr)