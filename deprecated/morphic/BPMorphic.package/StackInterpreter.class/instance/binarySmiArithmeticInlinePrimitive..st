sista inline primitives - binary
binarySmiArithmeticInlinePrimitive: primIndex 
	| _gsSqueakTemp_result _gsSqueakTemp_recInt _gsSqueakTemp_argInt _gsSqueakTemp_rcvr _gsSqueakTemp_top |
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	_gsSqueakTemp_top := self internalStackTop.
	self assert: primIndex <= 6.
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_rcvr).
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	_gsSqueakTemp_recInt := objectMemory integerValueOf: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_argInt := objectMemory integerValueOf: _gsSqueakTemp_top.
	primIndex caseOf: {
		["2000	+
		Smi, Smi => Smi (no overflow, optimised if one operand is a
		constant) "
		0] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt + _gsSqueakTemp_argInt].
		["2001	-
		Smi, Smi => Smi (no overflow, optimised if one operand is a
		constant) "
		1] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt - _gsSqueakTemp_argInt].
		["2002	*
		Smi, Smi => Smi (no overflow, optimised if one operand is a
		constant) "
		2] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt * _gsSqueakTemp_argInt].
		["2003	/
		Smi, Smi => Smi (no overflow, optimised if one operand is a
		constant) "
		3] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt / _gsSqueakTemp_argInt].
		["2004	//
		Smi, Smi => Smi (no overflow, optimised if one operand is a
		constant) "
		4] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt // _gsSqueakTemp_argInt].
		["2005	\
		Smi, Smi => Smi (no overflow, optimised if one operand is a
		constant) "
		5] -> [_gsSqueakTemp_result := _gsSqueakTemp_recInt \\ _gsSqueakTemp_argInt].
		["2006	quo:
		Smi, Smi => Smi (no overflow, optimised if one operand is a
		constant) "
		6] -> [_gsSqueakTemp_result := self quot: _gsSqueakTemp_recInt ient: _gsSqueakTemp_argInt]}.
	self internalPop: 1;
		 internalStackTopPutIntegerObjectOf: _gsSqueakTemp_result