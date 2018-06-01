arithmetic float primitives
primitiveArctan
	"N.B. IMO we should be able to assume the receiver is a float because
	this primitive is specific to floats. eem 2/13/2017"
	| _gsSqueakTemp_rcvr |
	_gsSqueakTemp_rcvr := self stackFloatValue: 0.
	self successful
		ifTrue: [self
				stackTopPut: (objectMemory
						floatObjectOf: (self
								cCode: [_gsSqueakTemp_rcvr atan]
								inSmalltalk: [_gsSqueakTemp_rcvr = _gsSqueakTemp_rcvr
										ifTrue: [_gsSqueakTemp_rcvr arcTan]
										ifFalse: [Float nan]]))]