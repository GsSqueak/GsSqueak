indexing primitive support
subscript: array with: index storing: oopToStore format: fmt 
	"Note: This method assumes that the index is within bounds!"
	| _gsSqueakTemp_signedValueToStore _gsSqueakTemp_unsignedValueToStore |
	fmt <= objectMemory lastPointerFormat
		ifTrue: [objectMemory
				storePointer: index - 1
				ofObject: array
				withValue: oopToStore.
			^ self].
	fmt >= objectMemory firstByteFormat
		ifTrue: [(objectMemory isIntegerObject: oopToStore)
				ifFalse: [primFailCode := PrimErrBadArgument.
					^ self].
			_gsSqueakTemp_signedValueToStore := objectMemory integerValueOf: oopToStore.
			(_gsSqueakTemp_signedValueToStore >= 0
					and: [_gsSqueakTemp_signedValueToStore <= 255])
				ifFalse: [primFailCode := PrimErrBadArgument.
					^ self].
			objectMemory
				storeByte: index - 1
				ofObject: array
				withValue: _gsSqueakTemp_signedValueToStore.
			^ self].
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [fmt >= objectMemory firstShortFormat
				ifTrue: [(objectMemory isIntegerObject: oopToStore)
						ifFalse: [primFailCode := PrimErrBadArgument.
							^ self].
					_gsSqueakTemp_signedValueToStore := objectMemory integerValueOf: oopToStore.
					(_gsSqueakTemp_signedValueToStore >= 0
							and: [_gsSqueakTemp_signedValueToStore <= 65535])
						ifFalse: [primFailCode := PrimErrBadArgument.
							^ self].
					objectMemory
						storeShort16: index - 1
						ofObject: array
						withValue: _gsSqueakTemp_signedValueToStore.
					^ self].
			fmt = objectMemory sixtyFourBitIndexableFormat
				ifTrue: [| unsigned64BitValueToStore |
					unsigned64BitValueToStore := self positive64BitValueOf: oopToStore.
					self successful
						ifTrue: [objectMemory
								storeLong64: index - 1
								ofObject: array
								withValue: unsigned64BitValueToStore].
					^ self]].
	"32bit-word type objects"
	_gsSqueakTemp_unsignedValueToStore := self positive32BitValueOf: oopToStore.
	self successful
		ifTrue: [objectMemory
				storeLong32: index - 1
				ofObject: array
				withValue: _gsSqueakTemp_unsignedValueToStore]