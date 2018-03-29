arithmetic integer primitives
primitiveQuo
	"Rounds negative results towards zero."
	| _gsSqueakTemp_integerRcvr _gsSqueakTemp_integerArg _gsSqueakTemp_integerResult |
	_gsSqueakTemp_integerRcvr := self stackIntegerValue: 1.
	_gsSqueakTemp_integerArg := self stackIntegerValue: 0.
	self success: _gsSqueakTemp_integerArg ~= 0.
	self successful
		ifTrue: [_gsSqueakTemp_integerResult := self quot: _gsSqueakTemp_integerRcvr ient: _gsSqueakTemp_integerArg].
	self pop2AndPushIntegerIfOK: _gsSqueakTemp_integerResult