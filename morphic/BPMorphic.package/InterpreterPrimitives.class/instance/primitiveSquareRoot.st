arithmetic float primitives
primitiveSquareRoot
	"N.B. IMO we should be able to assume the receiver is a float because
	this primitive is specific to floats. eem 2/13/2017"
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := self stackFloatValue: 0.
	(self successful
			and: [_gsSqueakTemp_rcvr >= 0.0])
		ifTrue: [self
				stackTopPut: (objectMemory floatObjectOf: _gsSqueakTemp_rcvr sqrt)]
		ifFalse: [self primitiveFail]