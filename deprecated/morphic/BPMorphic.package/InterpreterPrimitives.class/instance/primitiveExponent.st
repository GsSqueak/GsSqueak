arithmetic float primitives
primitiveExponent
	"Exponent part of this float.
	N.B. IMO we should be able to assume the receiver is a float because
	this primitive is specific to floats. eem 2/13/2017"
	| _gsSqueakTemp_rcvr _gsSqueakTemp_pwr |
	_gsSqueakTemp_rcvr := self stackFloatValue: 0.
	self successful
		ifTrue: ["rcvr = frac * 2^pwr, where frac is in [0.5..1.0)"
			self
				cCode: [self
						fr: _gsSqueakTemp_rcvr
						exp: (self addressOf: _gsSqueakTemp_pwr)]
				inSmalltalk: [_gsSqueakTemp_pwr := _gsSqueakTemp_rcvr exponent].
			self
				stackTopPut: (objectMemory integerObjectOf: _gsSqueakTemp_pwr - 1)]