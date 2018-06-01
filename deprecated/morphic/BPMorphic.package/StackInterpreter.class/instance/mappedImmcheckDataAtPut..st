sista bytecodes
mappedImmcheckDataAtPut: primIndex 
	| _gsSqueakTemp_argIntAdjusted _gsSqueakTemp_rec _gsSqueakTemp_result _gsSqueakTemp_arg1 |
	self
		assert: (primIndex between: 154 and: 157).
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
	self internalPop: 2;
		 internalStackTopPut: _gsSqueakTemp_result.
	(objectMemory isImmutable: _gsSqueakTemp_rec)
		ifTrue: [^ self
				cannotAssign: _gsSqueakTemp_result
				to: _gsSqueakTemp_rec
				withIndex: _gsSqueakTemp_argIntAdjusted].
	primIndex caseOf: {
		["154	immCheckByteAt:put:
		byte object, Smi, 8 bits unsigned Smi => arg2 (1-based,
		optimised if arg1 is a constant)"
		154] -> 
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
		["155	immCheckShortAt:put:
		short object, Smi, 16 bits unsigned Smi => arg2 (1-based,
		optimised if arg1 is a constant)"
		155] -> 
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
		["156	immCheckWordAt:put:
		word object, Smi, 32 bits unsigned Smi => arg2 (1-based,
		optimised if arg1 is a constant)"
		156] -> 
			[self
				assert: (objectMemory isWords: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory num32BitUnitsOf: _gsSqueakTemp_rec).
			objectMemory
				storeLong32: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: (objectMemory positive32BitValueOf: _gsSqueakTemp_result)].
		["157	immCheckDoubleWordAt:put:
		double word object, Smi, 64 bits unsigned Smi or
		LargePositiveInteger => arg2 (1-based, optimised if arg1 is a
		constant) "
		157] -> 
			[self
				assert: (objectMemory isLong64s: _gsSqueakTemp_rec).
			self assert: _gsSqueakTemp_argIntAdjusted
					< (objectMemory num64BitUnitsOf: _gsSqueakTemp_rec).
			objectMemory
				storeLong64: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: (objectMemory positive64BitValueOf: _gsSqueakTemp_result)]}