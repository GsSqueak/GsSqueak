arithmetic integer primitives
primitiveMod
	| _gsSqueakTemp_mod |
	_gsSqueakTemp_mod := self
				doPrimitiveMod: (self stackValue: 1)
				by: self stackTop.
	self pop2AndPushIntegerIfOK: _gsSqueakTemp_mod