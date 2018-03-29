arithmetic primitive support
doPrimitiveMod: rcvr by: arg 
	| _gsSqueakTemp_integerResult _gsSqueakTemp_integerRcvr _gsSqueakTemp_integerArg |
	(objectMemory areIntegers: rcvr and: arg)
		ifTrue: [_gsSqueakTemp_integerRcvr := objectMemory integerValueOf: rcvr.
			_gsSqueakTemp_integerArg := objectMemory integerValueOf: arg.
			self success: _gsSqueakTemp_integerArg ~= 0]
		ifFalse: [self primitiveFail].
	self successful
		ifFalse: [^ 1"fail"].
	_gsSqueakTemp_integerResult := _gsSqueakTemp_integerRcvr \\ _gsSqueakTemp_integerArg.
	"ensure that the result has the same sign as the integerArg"
	_gsSqueakTemp_integerArg < 0
		ifTrue: [_gsSqueakTemp_integerResult > 0
				ifTrue: [_gsSqueakTemp_integerResult := _gsSqueakTemp_integerResult + _gsSqueakTemp_integerArg]]
		ifFalse: [_gsSqueakTemp_integerResult < 0
				ifTrue: [_gsSqueakTemp_integerResult := _gsSqueakTemp_integerResult + _gsSqueakTemp_integerArg]].
	self
		success: (objectMemory isIntegerValue: _gsSqueakTemp_integerResult).
	^ _gsSqueakTemp_integerResult