primitive support
signed64BitIntegerFor: integerValue 
	"Answer a Large Integer object for the given integer value. N.B. will
	*not* cause a GC."
	| _gsSqueakTemp_newLargeInteger _gsSqueakTemp_magnitude _gsSqueakTemp_largeClass _gsSqueakTemp_highWord _gsSqueakTemp_sz |
	integerValue < 0
		ifTrue: [integerValue >= objectMemory minSmallInteger
				ifTrue: [^ objectMemory integerObjectOf: integerValue asInteger].
			_gsSqueakTemp_largeClass := ClassLargeNegativeIntegerCompactIndex.
			_gsSqueakTemp_magnitude := 0
						- (self cCoerceSimple: integerValue to: #usqLong)]
		ifFalse: [integerValue <= objectMemory maxSmallInteger
				ifTrue: [^ objectMemory integerObjectOf: integerValue asInteger].
			_gsSqueakTemp_largeClass := ClassLargePositiveIntegerCompactIndex.
			_gsSqueakTemp_magnitude := integerValue].
	objectMemory wordSize = 8
		ifTrue: [_gsSqueakTemp_sz := 8]
		ifFalse: [(_gsSqueakTemp_highWord := _gsSqueakTemp_magnitude >> 32) = 0
				ifTrue: [_gsSqueakTemp_sz := 4]
				ifFalse: [_gsSqueakTemp_sz := 5.
					(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
						ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1.
							(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
								ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1.
									(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
										ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1]]]]].
	_gsSqueakTemp_newLargeInteger := objectMemory
				eeInstantiateSmallClassIndex: _gsSqueakTemp_largeClass
				format: (objectMemory byteFormatForNumBytes: _gsSqueakTemp_sz)
				numSlots: _gsSqueakTemp_sz + 3 // objectMemory bytesPerOop.
	SPURVM
		ifTrue: ["Memory is eight byte aligned in SPUR, so we are sure to have
			room for 64bits word whatever allocated sz"
			objectMemory
				storeLong64: 0
				ofObject: _gsSqueakTemp_newLargeInteger
				withValue: (objectMemory byteSwapped64IfBigEndian: _gsSqueakTemp_magnitude)]
		ifFalse: [_gsSqueakTemp_sz > 4
				ifTrue: [objectMemory
						storeLong64: 0
						ofObject: _gsSqueakTemp_newLargeInteger
						withValue: (objectMemory byteSwapped64IfBigEndian: _gsSqueakTemp_magnitude)]
				ifFalse: [objectMemory
						storeLong32: 0
						ofObject: _gsSqueakTemp_newLargeInteger
						withValue: (objectMemory byteSwapped32IfBigEndian: _gsSqueakTemp_magnitude)]].
	^ _gsSqueakTemp_newLargeInteger