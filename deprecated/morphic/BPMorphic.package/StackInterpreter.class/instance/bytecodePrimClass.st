common selector sends
bytecodePrimClass
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := self internalStackTop.
	(objectMemory isOopForwarded: _gsSqueakTemp_rcvr)
		ifTrue: [_gsSqueakTemp_rcvr := self handleSpecialSelectorSendFaultFor: _gsSqueakTemp_rcvr].
	self
		internalStackTopPut: (objectMemory fetchClassOf: _gsSqueakTemp_rcvr).
	self fetchNextBytecode