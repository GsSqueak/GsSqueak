primitive support
positive64BitIntegerFor: integerValue 
	"Answer a Large Positive Integer object for the given integer value.
	N.B. will *not* cause a GC."
	| _gsSqueakTemp_newLargeInteger _gsSqueakTemp_highWord _gsSqueakTemp_sz |
	objectMemory hasSixtyFourBitImmediates
		ifTrue: [(self
					cCode: [integerValue]
					inSmalltalk: [integerValue bitAnd: 1 << 64 - 1])
					<= objectMemory maxSmallInteger
				ifTrue: [^ objectMemory integerObjectOf: integerValue].
			_gsSqueakTemp_sz := 8]
		ifFalse: [(_gsSqueakTemp_highWord := integerValue >> 32) = 0
				ifTrue: [^ self positive32BitIntegerFor: integerValue].
			_gsSqueakTemp_sz := 5.
			(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
				ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1.
					(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
						ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1.
							(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
								ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1]]]].
	_gsSqueakTemp_newLargeInteger := objectMemory
				eeInstantiateSmallClassIndex: ClassLargePositiveIntegerCompactIndex
				format: (objectMemory byteFormatForNumBytes: _gsSqueakTemp_sz)
				numSlots: 8 / objectMemory bytesPerOop.
	objectMemory
		storeLong64: 0
		ofObject: _gsSqueakTemp_newLargeInteger
		withValue: (objectMemory byteSwapped64IfBigEndian: integerValue).
	^ _gsSqueakTemp_newLargeInteger