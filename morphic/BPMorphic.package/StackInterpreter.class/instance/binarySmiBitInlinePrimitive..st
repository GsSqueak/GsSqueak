sista inline primitives - binary
binarySmiBitInlinePrimitive: primIndex 
	| _gsSqueakTemp_result _gsSqueakTemp_recInt _gsSqueakTemp_argInt _gsSqueakTemp_rcvr _gsSqueakTemp_top |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	_gsSqueakTemp_top := self internalStackTop.
	self
		assert: (primIndex between: 16 and: 20).
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_rcvr).
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	_gsSqueakTemp_recInt := objectMemory integerValueOf: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_argInt := objectMemory integerValueOf: _gsSqueakTemp_top.
	primIndex caseOf: {
		["2016	bitAnd:
		Smi, Smi => Smi (optimised if one operand is a constant)"
		16] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt bitAnd: _gsSqueakTemp_argInt].
		["2017	bitOr:
		Smi, Smi => Smi (optimised if one operand is a constant)"
		17] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt bitOr: _gsSqueakTemp_argInt].
		["2018	bitXor:
		Smi, Smi => Smi (optimised if one operand is a constant)"
		18] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt bitXor: _gsSqueakTemp_argInt].
		["2019	bitShiftLeft:
		Smi greater or equal to 0, Smi greater or equal to 0 => Smi (no
		overflow, optimised if arg1 is a constant)"
		19] -> 
			[self assert: _gsSqueakTemp_recInt >= 0.
			self assert: _gsSqueakTemp_argInt >= 0.
			_gsSqueakTemp_result := _gsSqueakTemp_recInt << _gsSqueakTemp_argInt].
		["2020	bitShiftRight:
		Smi, Smi greater or equal to 0 => Smi (optimised if arg1 is a
		constant) "
		20] -> 
			[self assert: _gsSqueakTemp_argInt >= 0.
			_gsSqueakTemp_result := _gsSqueakTemp_recInt >> _gsSqueakTemp_argInt]}.
	self internalPop: 1;
		 internalStackTopPutIntegerObjectOf: _gsSqueakTemp_result