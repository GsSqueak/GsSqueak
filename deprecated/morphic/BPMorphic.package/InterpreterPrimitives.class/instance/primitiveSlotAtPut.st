object access primitives
primitiveSlotAtPut
	"Assign a slot in an object. This numbers all slots from 1, ignoring the
	distinction between
	named and indexed inst vars. In objects with both named and
	indexed inst vars, the named
	inst vars precede the indexed ones. In non-object indexed objects
	(objects that contain
	bits, not object references) this primitive assigns a raw integral value
	at each slot."
	| _gsSqueakTemp_newValue _gsSqueakTemp_index _gsSqueakTemp_rcvr _gsSqueakTemp_fmt _gsSqueakTemp_numSlots _gsSqueakTemp_value |
	_gsSqueakTemp_newValue := self stackTop.
	_gsSqueakTemp_index := self stackValue: 1.
	_gsSqueakTemp_rcvr := self stackValue: 2.
	(objectMemory isIntegerObject: _gsSqueakTemp_index)
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	(objectMemory isImmediate: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrBadReceiver].
	(objectMemory isObjImmutable: _gsSqueakTemp_rcvr)
		ifTrue: [^ self primitiveFailFor: PrimErrNoModification].
	_gsSqueakTemp_fmt := objectMemory formatOf: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_index := (objectMemory integerValueOf: _gsSqueakTemp_index)
				- 1.
	_gsSqueakTemp_fmt <= objectMemory lastPointerFormat
		ifTrue: [_gsSqueakTemp_numSlots := objectMemory numSlotsOf: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [objectMemory
						storePointer: _gsSqueakTemp_index
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_newValue.
					self pop: argumentCount + 1 thenPush: _gsSqueakTemp_newValue.
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	_gsSqueakTemp_value := self positiveMachineIntegerValueOf: _gsSqueakTemp_newValue.
	self failed
		ifTrue: [primFailCode := PrimErrBadArgument.
			^ 0].
	_gsSqueakTemp_fmt >= objectMemory firstByteFormat
		ifTrue: [_gsSqueakTemp_fmt >= objectMemory firstCompiledMethodFormat
				ifTrue: [^ self primitiveFailFor: PrimErrUnsupported].
			(self asUnsigned: _gsSqueakTemp_value)
					> 255
				ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
			_gsSqueakTemp_numSlots := objectMemory numBytesOfBytes: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [objectMemory
						storeByte: _gsSqueakTemp_index
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_value.
					self pop: argumentCount + 1 thenPush: _gsSqueakTemp_newValue.
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	(objectMemory hasSpurMemoryManagerAPI
			and: [_gsSqueakTemp_fmt >= objectMemory firstShortFormat])
		ifTrue: [(self asUnsigned: _gsSqueakTemp_value)
					> 65535
				ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
			_gsSqueakTemp_numSlots := objectMemory num16BitUnitsOf: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [objectMemory
						storeShort16: _gsSqueakTemp_index
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_value.
					self pop: argumentCount + 1 thenPush: _gsSqueakTemp_newValue.
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	(objectMemory bytesPerOop = 8
			and: [_gsSqueakTemp_fmt = objectMemory sixtyFourBitIndexableFormat])
		ifTrue: [_gsSqueakTemp_numSlots := objectMemory num64BitUnitsOf: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [objectMemory
						storeLong64: _gsSqueakTemp_index
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_value.
					self pop: argumentCount + 1 thenPush: _gsSqueakTemp_newValue.
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	_gsSqueakTemp_fmt >= objectMemory firstLongFormat
		ifTrue: [(objectMemory wordSize > 4
					and: [(self asUnsigned: _gsSqueakTemp_value)
							> 4294967295])
				ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
			_gsSqueakTemp_numSlots := objectMemory num32BitUnitsOf: _gsSqueakTemp_rcvr.
			(self asUnsigned: _gsSqueakTemp_index)
					< _gsSqueakTemp_numSlots
				ifTrue: [objectMemory
						storeLong32: _gsSqueakTemp_index
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_value.
					self pop: argumentCount + 1 thenPush: _gsSqueakTemp_newValue.
					^ 0].
			^ self primitiveFailFor: PrimErrBadIndex].
	^ self primitiveFailFor: PrimErrBadReceiver