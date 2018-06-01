arithmetic integer primitives
primitiveDiv
	| _gsSqueakTemp_quotient |
	_gsSqueakTemp_quotient := self
				doPrimitiveDiv: (self stackValue: 1)
				by: self stackTop.
	self pop2AndPushIntegerIfOK: _gsSqueakTemp_quotient