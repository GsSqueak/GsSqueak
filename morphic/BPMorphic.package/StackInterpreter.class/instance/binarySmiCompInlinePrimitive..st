sista inline primitives - binary
binarySmiCompInlinePrimitive: primIndex 
	| _gsSqueakTemp_result _gsSqueakTemp_top _gsSqueakTemp_rcvr |
	self
		assert: (primIndex between: 32 and: 37).
	_gsSqueakTemp_rcvr := self internalStackValue: 1.
	_gsSqueakTemp_top := self internalStackTop.
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_rcvr).
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	primIndex caseOf: {
		["2032	>
		Smi, Smi => Boolean (optimised if one operand is a constant,
		Pipelined with ifTrue:ifFalse:)"
		32] -> [_gsSqueakTemp_result := _gsSqueakTemp_rcvr > _gsSqueakTemp_top].
		["2033	<
		Smi, Smi => Boolean (optimised if one operand is a constant,
		Pipelined with ifTrue:ifFalse:)"
		33] -> [_gsSqueakTemp_result := _gsSqueakTemp_rcvr < _gsSqueakTemp_top].
		["2034	>=
		Smi, Smi => Boolean (optimised if one operand is a constant,
		Pipelined with ifTrue:ifFalse:)"
		34] -> [_gsSqueakTemp_result := _gsSqueakTemp_rcvr >= _gsSqueakTemp_top].
		["2035	<=
		Smi, Smi => Boolean (optimised if one operand is a constant,
		Pipelined with ifTrue:ifFalse:)"
		35] -> [_gsSqueakTemp_result := _gsSqueakTemp_rcvr <= _gsSqueakTemp_top].
		["2036	=
		Smi, Smi => Boolean (optimised if one operand is a constant,
		Pipelined with ifTrue:ifFalse:)"
		36] -> [_gsSqueakTemp_result := _gsSqueakTemp_rcvr = _gsSqueakTemp_top].
		["2037	~=
		Smi, Smi => Boolean (optimised if one operand is a constant,
		Pipelined with ifTrue:ifFalse:)"
		37] -> [_gsSqueakTemp_result := _gsSqueakTemp_rcvr ~= _gsSqueakTemp_top]}.
	self internalPop: 1;
		
		internalStackTopPut: (objectMemory booleanObjectOf: _gsSqueakTemp_result)