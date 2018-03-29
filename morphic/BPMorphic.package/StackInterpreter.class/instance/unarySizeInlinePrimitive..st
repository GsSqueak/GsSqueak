sista inline primitives - unary
unarySizeInlinePrimitive: primIndex 
	| _gsSqueakTemp_result _gsSqueakTemp_top |
	self
		assert: (primIndex between: 1 and: 6).
	_gsSqueakTemp_top := self internalStackTop.
	primIndex caseOf: {
		["1001	numSlots
		pointer object => Smi between 0 and SmallInteger maxVal // 4 -
		1 (Answers total size in pointer-sized slots)"
		1] -> 
			[self
				assert: (objectMemory isPointers: _gsSqueakTemp_top).
			_gsSqueakTemp_result := objectMemory numSlotsOfAny: _gsSqueakTemp_top.
			self
				assert: (_gsSqueakTemp_result between: 0 and: objectMemory maxSmallInteger // 4 - 1)].
		["1002	numBytes
		byte object => Smi between 0 and SmallInteger maxVal - 9
		(Includes compiled code)"
		2] -> 
			[self
				assert: (objectMemory isBytes: _gsSqueakTemp_top).
			_gsSqueakTemp_result := objectMemory numBytesOf: _gsSqueakTemp_top].
		["1003	numShorts
		short object => Smi between 0 and SmallInteger maxVal - 9"
		3] -> 
			[self
				assert: (objectMemory isShorts: _gsSqueakTemp_top).
			_gsSqueakTemp_result := objectMemory num16BitUnitsOf: _gsSqueakTemp_top].
		["1004	numWords
		word object => Smi between 0 and SmallInteger maxVal - 9"
		5] -> 
			[self
				assert: (objectMemory isWords: _gsSqueakTemp_top).
			_gsSqueakTemp_result := objectMemory num32BitUnitsOf: _gsSqueakTemp_top].
		["1005	numDoubleWords 
		double word object => Smi between 0 and SmallInteger maxVal -
		9 "
		6] -> 
			[self
				assert: (objectMemory isLong64s: _gsSqueakTemp_top).
			_gsSqueakTemp_result := objectMemory num64BitUnitsOf: _gsSqueakTemp_top]}.
	self
		assert: (_gsSqueakTemp_result between: 0 and: objectMemory maxSmallInteger - 9).
	self
		internalStackTopPut: (objectMemory integerObjectOf: _gsSqueakTemp_result)