arithmetic primitive support
doPrimitiveDiv: rcvr by: arg 
	"Rounds negative results towards negative infinity, rather than zero."
	| _gsSqueakTemp_result _gsSqueakTemp_posArg _gsSqueakTemp_posRcvr _gsSqueakTemp_integerRcvr _gsSqueakTemp_integerArg |
	(objectMemory areIntegers: rcvr and: arg)
		ifTrue: [_gsSqueakTemp_integerRcvr := objectMemory integerValueOf: rcvr.
			_gsSqueakTemp_integerArg := objectMemory integerValueOf: arg.
			self success: _gsSqueakTemp_integerArg ~= 0]
		ifFalse: [self primitiveFail].
	self successful
		ifFalse: [^ 1"fail"].
	_gsSqueakTemp_integerRcvr > 0
		ifTrue: [_gsSqueakTemp_integerArg > 0
				ifTrue: [_gsSqueakTemp_result := _gsSqueakTemp_integerRcvr // _gsSqueakTemp_integerArg]
				ifFalse: ["round negative result toward negative infinity"
					_gsSqueakTemp_posArg := 0 - _gsSqueakTemp_integerArg.
					_gsSqueakTemp_result := 0 - (_gsSqueakTemp_integerRcvr + (_gsSqueakTemp_posArg - 1) // _gsSqueakTemp_posArg)]]
		ifFalse: [_gsSqueakTemp_posRcvr := 0 - _gsSqueakTemp_integerRcvr.
			_gsSqueakTemp_integerArg > 0
				ifTrue: ["round negative result toward negative infinity"
					_gsSqueakTemp_result := 0 - (_gsSqueakTemp_posRcvr + (_gsSqueakTemp_integerArg - 1) // _gsSqueakTemp_integerArg)]
				ifFalse: [_gsSqueakTemp_posArg := 0 - _gsSqueakTemp_integerArg.
					_gsSqueakTemp_result := _gsSqueakTemp_posRcvr // _gsSqueakTemp_posArg]].
	self
		success: (objectMemory isIntegerValue: _gsSqueakTemp_result).
	^ _gsSqueakTemp_result