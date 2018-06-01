sista bytecodes
trinaryAtPutInlinePrimitive: primIndex 
	| _gsSqueakTemp_result _gsSqueakTemp_rec _gsSqueakTemp_argIntAdjusted _gsSqueakTemp_arg1 |
	_gsSqueakTemp_arg1 := self internalStackValue: 1.
	_gsSqueakTemp_rec := self internalStackValue: 2.
	self
		deny: ((objectMemory isOopForwarded: _gsSqueakTemp_rec)
				or: [objectMemory isImmediate: _gsSqueakTemp_rec]).
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_arg1).
	_gsSqueakTemp_argIntAdjusted := (objectMemory integerValueOf: _gsSqueakTemp_arg1)
				- 1.
	self assert: _gsSqueakTemp_argIntAdjusted >= 0.
	_gsSqueakTemp_result := self internalStackTop.
	primIndex caseOf: {
		["3000	pointerAt:put:
		Mutable pointer object (Fixed sized or not) and not a context,
		Smi, Anything => arg2 (1-based, optimised if arg1 is a constant)"
		0] -> 
			[self
				assert: (objectMemory isPointers: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory numSlotsOfAny: _gsSqueakTemp_rec).
			objectMemory
				storePointerUnchecked: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: _gsSqueakTemp_result].
		["3001	storeCheckPointerAt:put:
		Mutable pointer object (Fixed sized or not) and not a context,
		Smi, Anything => arg2 (1-based, optimised if arg1 is a constant)"
		1] -> 
			[self
				assert: (objectMemory isPointers: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory numSlotsOfAny: _gsSqueakTemp_rec).
			objectMemory
				storePointer: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: _gsSqueakTemp_result].
		["3002	maybeContextPointerAt:put:
		Mutable pointer object (Fixed sized or not), Smi, Anything =>
		arg2 (1-based, optimised if arg1 is a constant)"
		2] -> 
			[((objectMemory isContextNonImm: _gsSqueakTemp_rec)
					and: [self isMarriedOrWidowedContext: _gsSqueakTemp_rec])
				ifTrue: [self externalizeIPandSP.
					self
						externalInstVar: _gsSqueakTemp_argIntAdjusted
						ofContext: _gsSqueakTemp_rec
						put: _gsSqueakTemp_result.
					self internalizeIPandSP]
				ifFalse: [objectMemory
						storePointer: _gsSqueakTemp_argIntAdjusted
						ofObject: _gsSqueakTemp_rec
						withValue: _gsSqueakTemp_result]].
		["3003	maybeContextStoreCheckPointerAt:put:
		Mutable pointer object (Fixed sized or not), Smi, Anything =>
		arg2 (1-based, optimised if arg1 is a constant)"
		3] -> 
			[((objectMemory isContextNonImm: _gsSqueakTemp_rec)
					and: [self isMarriedOrWidowedContext: _gsSqueakTemp_rec])
				ifTrue: [self externalizeIPandSP.
					self
						externalInstVar: _gsSqueakTemp_argIntAdjusted
						ofContext: _gsSqueakTemp_rec
						put: _gsSqueakTemp_result.
					self internalizeIPandSP]
				ifFalse: [objectMemory
						storePointer: _gsSqueakTemp_argIntAdjusted
						ofObject: _gsSqueakTemp_rec
						withValue: _gsSqueakTemp_result]].
		["3004	byteAt:put:
		Mutable byte object, Smi, 8 bits unsigned Smi => arg2 (1-based,
		optimised if arg1 is a constant)"
		4] -> 
			[self
				assert: (objectMemory isBytes: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory numBytesOf: _gsSqueakTemp_rec).
			self
				assert: (objectMemory isIntegerObject: _gsSqueakTemp_result).
			objectMemory
				storeByte: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: (objectMemory integerValueOf: _gsSqueakTemp_result)].
		["3005	shortAt:put:
		Mutable short object, Smi, 16 bits unsigned Smi => arg2
		(1-based, optimised if arg1 is a constant)"
		5] -> 
			[self
				assert: (objectMemory isShorts: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory num16BitUnitsOf: _gsSqueakTemp_rec).
			self
				assert: (objectMemory isIntegerObject: _gsSqueakTemp_result).
			objectMemory
				storeShort16: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: (objectMemory integerValueOf: _gsSqueakTemp_result)].
		["3006	wordAt:put:
		Mutable word object, Smi, 32 bits unsigned Smi => arg2
		(1-based, optimised if arg1 is a constant)"
		6] -> 
			[self
				assert: (objectMemory isWords: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory num32BitUnitsOf: _gsSqueakTemp_rec).
			objectMemory
				storeLong32: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: (objectMemory positive32BitValueOf: _gsSqueakTemp_result)].
		["3007	doubleWordAt:put:
		Mutable double word object, Smi, 64 bits unsigned Smi or
		LargePositiveInteger => arg2 (1-based, optimised if arg1 is a
		constant) "
		7] -> 
			[self
				assert: (objectMemory isLong64s: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory num64BitUnitsOf: _gsSqueakTemp_rec).
			objectMemory
				storeLong64: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: (objectMemory positive64BitValueOf: _gsSqueakTemp_result)]}.
	self internalPop: 2;
		 internalStackTopPut: _gsSqueakTemp_result