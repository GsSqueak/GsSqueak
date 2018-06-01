arithmetic float primitives
primitiveFractionalPart
	"Fractional part of this float.
	N.B. IMO we should be able to assume the receiver is a float because
	this primitive is specific to floats. eem 2/13/2017"
	| _gsSqueakTemp_rcvr _gsSqueakTemp_trunc |
	_gsSqueakTemp_rcvr := self stackFloatValue: 0.
	self successful
		ifTrue: [self
				stackTopPut: (objectMemory
						floatObjectOf: (self
								cCode: [self
										mod: _gsSqueakTemp_rcvr
										f: (self addressOf: _gsSqueakTemp_trunc)]
								inSmalltalk: [_gsSqueakTemp_rcvr fractionPart]))]