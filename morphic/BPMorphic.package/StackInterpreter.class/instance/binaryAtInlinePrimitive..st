sista inline primitives - binary
binaryAtInlinePrimitive: primIndex 
	| _gsSqueakTemp_result _gsSqueakTemp_rec _gsSqueakTemp_argIntAdjusted _gsSqueakTemp_top |
	_gsSqueakTemp_rec := self internalStackValue: 1.
	_gsSqueakTemp_top := self internalStackTop.
	self
		deny: ((objectMemory isOopForwarded: _gsSqueakTemp_rec)
				or: [objectMemory isImmediate: _gsSqueakTemp_rec]).
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	_gsSqueakTemp_argIntAdjusted := (objectMemory integerValueOf: _gsSqueakTemp_top)
				- 1.
	self assert: _gsSqueakTemp_argIntAdjusted >= 0.
	primIndex caseOf: {
		["2064	pointerAt:
		Pointer object (Fixed sized or not) and not a context, Smi =>
		(1-based, optimised if arg1 is a constant)"
		64] -> 
			[self
				assert: (objectMemory isPointers: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory numSlotsOfAny: _gsSqueakTemp_rec).
			_gsSqueakTemp_result := objectMemory fetchPointer: _gsSqueakTemp_argIntAdjusted ofObject: _gsSqueakTemp_rec].
		["2065	maybeContextPointerAt:
		Pointer object (Fixed sized or not), Smi => (1-based, optimised if
		arg1 is a constant)"
		65] -> 
			[((objectMemory isContextNonImm: _gsSqueakTemp_rec)
					and: [self isMarriedOrWidowedContext: _gsSqueakTemp_rec])
				ifTrue: [self externalizeIPandSP.
					_gsSqueakTemp_result := self externalInstVar: _gsSqueakTemp_argIntAdjusted ofContext: _gsSqueakTemp_rec.
					self internalizeIPandSP]
				ifFalse: [_gsSqueakTemp_result := objectMemory fetchPointer: _gsSqueakTemp_argIntAdjusted ofObject: _gsSqueakTemp_rec]].
		["2066	byteAt:
		byte object, Smi => 8 bits unsigned Smi (1-based, optimised if
		arg1 is a constant)"
		66] -> 
			[self
				assert: (objectMemory isBytes: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory numBytesOf: _gsSqueakTemp_rec).
			_gsSqueakTemp_result := objectMemory
						integerObjectOf: (objectMemory fetchByte: _gsSqueakTemp_argIntAdjusted ofObject: _gsSqueakTemp_rec)].
		["2067	shortAt:
		short object, Smi => 16 bits unsigned Smi (1-based, optimised if
		arg1 is a constant)"
		67] -> 
			[self
				assert: (objectMemory isShorts: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory num16BitUnitsOf: _gsSqueakTemp_rec).
			_gsSqueakTemp_result := objectMemory
						integerObjectOf: (objectMemory fetchShort16: _gsSqueakTemp_argIntAdjusted ofObject: _gsSqueakTemp_rec)].
		["2068	wordAt:
		word object, Smi => 32 bits unsigned Smi (1-based, optimised if
		arg1 is a constant)."
		68] -> 
			[self
				assert: (objectMemory isWords: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory num32BitUnitsOf: _gsSqueakTemp_rec).
			_gsSqueakTemp_result := self
						positive32BitIntegerFor: (objectMemory fetchLong32: _gsSqueakTemp_argIntAdjusted ofObject: _gsSqueakTemp_rec)].
		["2069	doubleWordAt:
		double word object, Smi => 64 bits unsigned Smi or
		LargePositiveInteger (1-based, optimised if arg1 is a constant)"
		69] -> 
			[self
				assert: (objectMemory isLong64s: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory num64BitUnitsOf: _gsSqueakTemp_rec).
			_gsSqueakTemp_result := self
						positive64BitIntegerFor: (objectMemory fetchLong64: _gsSqueakTemp_argIntAdjusted ofObject: _gsSqueakTemp_rec)]}.
	self internalPop: 1;
		 internalStackTopPut: _gsSqueakTemp_result