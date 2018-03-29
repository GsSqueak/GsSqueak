sista inline primitives - unary
unaryHashInlinePrimitive: primIndex 
	| _gsSqueakTemp_result _gsSqueakTemp_top |
	self
		assert: (primIndex between: 20 and: 23).
	_gsSqueakTemp_top := self internalStackTop.
	primIndex caseOf: {
		["1020	objectIdentityHash
		non-immediate and non-behavior => 22 bits strictly positive Smi"
		20] -> 
			[self
				deny: ((objectMemory isOopForwarded: _gsSqueakTemp_top)
						or: [(objectMemory isImmediate: _gsSqueakTemp_top)
								or: [objectMemory isInClassTable: _gsSqueakTemp_top]]).
			_gsSqueakTemp_result := objectMemory hashBitsOf: _gsSqueakTemp_top.
			self
				assert: (_gsSqueakTemp_result between: 1 and: 4194303).
			"1 << 22 - 1"
			self internalStackTopPutIntegerObjectOf: _gsSqueakTemp_result].
		["1021	smiIdentityHash
		Smi => Smi"
		21] -> [self
			assert: (objectMemory isIntegerObject: _gsSqueakTemp_top)].
		["1022	charIdentityHash
		Character => 22 bits strictly positive Smi"
		22] -> 
			[self
				assert: (objectMemory isImmediateCharacter: _gsSqueakTemp_top).
			_gsSqueakTemp_result := objectMemory integerObjectOfCharacterObject: _gsSqueakTemp_top.
			self
				assert: (_gsSqueakTemp_result between: 1 and: 4194303).
			"1 << 22 - 1"
			self internalStackTopPut: _gsSqueakTemp_result].
		["1023	smallfloatIdentityHash
		SmallFloat => Smi"
		23] -> 
			[objectMemory hasSixtyFourBitImmediates
				ifTrue: ["Needs to protect rotatedFloatBitsOf:"
					self
						assert: (objectMemory isImmediateFloat: _gsSqueakTemp_top).
					_gsSqueakTemp_result := objectMemory rotatedFloatBitsOf: _gsSqueakTemp_top.
					self
						assert: (objectMemory isIntegerObject: _gsSqueakTemp_result).
					self internalStackTopPutIntegerObjectOf: _gsSqueakTemp_result]
				ifFalse: [self unknownInlinePrimitive]].
		["1024	behaviorIdentityHash
		Behavior => 22 bits strictly positive Smi"
		24] -> 
			[self
				assert: ((objectMemory isNonImmediate: _gsSqueakTemp_top)
						and: [objectMemory objCouldBeClassObj: _gsSqueakTemp_top]).
			_gsSqueakTemp_result := objectMemory ensureBehaviorHash: _gsSqueakTemp_top.
			self
				assert: (_gsSqueakTemp_result between: 1 and: 4194303).
			"1 << 22 - 1"
			self internalStackTopPutIntegerObjectOf: _gsSqueakTemp_result]}