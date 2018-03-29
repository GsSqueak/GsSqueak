sista inline primitives - unary
unaryConvertInlinePrimitive: primIndex 
	| _gsSqueakTemp_result _gsSqueakTemp_top |
	self
		assert: (primIndex between: 30 and: 32).
	_gsSqueakTemp_top := self internalStackTop.
	primIndex caseOf: {
		["1030	characterAsInteger
		Character => 22 bits strictly positive Smi (Unicode)"
		30] -> 
			[self
				assert: (objectMemory isImmediateCharacter: _gsSqueakTemp_top).
			_gsSqueakTemp_result := objectMemory characterValueOf: _gsSqueakTemp_top.
			self
				assert: (_gsSqueakTemp_result between: 1 and: 4194303).
			"1 << 22 - 1"
			self internalStackTopPutIntegerObjectOf: _gsSqueakTemp_result].
		["1031	smallFloatAsInteger
		SmallFloat => Smi"
		31] -> 
			[objectMemory hasSixtyFourBitImmediates
				ifTrue: ["Needs to protect rotatedFloatBitsOf:"
					self
						assert: (objectMemory isImmediateFloat: _gsSqueakTemp_top).
					_gsSqueakTemp_result := objectMemory rotatedFloatBitsOf: _gsSqueakTemp_top.
					self
						assert: (objectMemory isIntegerObject: _gsSqueakTemp_result).
					self internalStackTopPutIntegerObjectOf: _gsSqueakTemp_result]
				ifFalse: [self unknownInlinePrimitive]].
		["1032	smiAsFloat
		Smi => SmallFloat"
		32] -> 
			[self
				assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
			self pop: 1 thenPushFloat: (objectMemory integerValueOf: _gsSqueakTemp_top) asFloat]}