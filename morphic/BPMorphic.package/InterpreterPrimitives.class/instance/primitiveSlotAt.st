object access primitives
primitiveSlotAt
	"Answer a slot in an object. This numbers all slots from 1, ignoring the
	distinction between
	named and indexed inst vars. In objects with both named and
	indexed inst vars, the named
	inst vars precede the indexed ones. In non-object indexed objects
	(objects that contain
	bits, not object references) this primitive answers the raw integral
	value at each slot. 
	e.g. for Strings it answers the character code, not the Character
	object at each slot."
	| _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_fmt _gsSqueakTemp_numSlots |
	_gsSqueakTemp_index := self stackTop.
	_gsSqueakTemp_rcvr := self stackValue: 1.
	(objectMemory isIntegerObject: _gsSqueakTemp_index)
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory isImmediate: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	_gsSqueakTemp_fmt := objectMemory formatOf: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_index := (objectMemory integerValueOf: _gsSqueakTemp_index)
				- 1.
	_gsSqueakTemp_fmt <= objectMemory lastPointerFormat
		ifTrue: [_gsSqueakTemp_numSlots := objectMemory numSlotsOf: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [self
						pop: argumentCount + 1
						thenPush: (objectMemory fetchPointer: _gsSqueakTemp_index ofObject: _gsSqueakTemp_rcvr).
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	_gsSqueakTemp_fmt >= objectMemory firstByteFormat
		ifTrue: [_gsSqueakTemp_fmt >= objectMemory firstCompiledMethodFormat
				ifTrue: [^ self primitiveFailFor: PrimErrUnsupported].
			_gsSqueakTemp_numSlots := objectMemory numBytesOfBytes: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [self
						pop: argumentCount + 1
						thenPushInteger: (objectMemory fetchByte: _gsSqueakTemp_index ofObject: _gsSqueakTemp_rcvr).
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	(objectMemory hasSpurMemoryManagerAPI
			and: [_gsSqueakTemp_fmt >= objectMemory firstShortFormat])
		ifTrue: [_gsSqueakTemp_numSlots := objectMemory num16BitUnitsOf: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [self
						pop: argumentCount + 1
						thenPushInteger: (objectMemory fetchUnsignedShort16: _gsSqueakTemp_index ofObject: _gsSqueakTemp_rcvr).
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	_gsSqueakTemp_fmt = objectMemory sixtyFourBitIndexableFormat
		ifTrue: [_gsSqueakTemp_numSlots := objectMemory num64BitUnitsOf: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [self
						pop: argumentCount + 1
						thenPush: (self
								positive64BitIntegerFor: (objectMemory fetchLong64: _gsSqueakTemp_index ofObject: _gsSqueakTemp_rcvr)).
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	_gsSqueakTemp_fmt >= objectMemory firstLongFormat
		ifTrue: [_gsSqueakTemp_numSlots := objectMemory num32BitUnitsOf: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [self
						pop: argumentCount + 1
						thenPush: (objectMemory bytesPerOop = 8
								ifTrue: [objectMemory
										integerObjectOf: (objectMemory fetchLong32: _gsSqueakTemp_index ofObject: _gsSqueakTemp_rcvr)]
								ifFalse: [self
										positive32BitIntegerFor: (objectMemory fetchLong32: _gsSqueakTemp_index ofObject: _gsSqueakTemp_rcvr)]).
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	^ self primitiveFailFor: PrimErrBadReceiver