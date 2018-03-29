primitive support
magnitude64BitIntegerFor: magnitude neg: isNegative 
	"Return a Large Integer object for the given integer magnitude and
	sign "
	| _gsSqueakTemp_newLargeInteger _gsSqueakTemp_largeClass _gsSqueakTemp_highWord _gsSqueakTemp_sz _gsSqueakTemp_isSmall _gsSqueakTemp_smallVal |
	_gsSqueakTemp_isSmall := isNegative
				ifTrue: [magnitude <= (objectMemory maxSmallInteger + 1)]
				ifFalse: [magnitude <= objectMemory maxSmallInteger].
	_gsSqueakTemp_isSmall
		ifTrue: [_gsSqueakTemp_smallVal := self cCoerceSimple: magnitude to: #sqInt.
			isNegative
				ifTrue: [_gsSqueakTemp_smallVal := 0 - _gsSqueakTemp_smallVal].
			^ objectMemory integerObjectOf: _gsSqueakTemp_smallVal].
	_gsSqueakTemp_largeClass := isNegative
				ifTrue: [objectMemory classLargeNegativeInteger]
				ifFalse: [objectMemory classLargePositiveInteger].
	objectMemory wordSize = 8
		ifTrue: [_gsSqueakTemp_sz := 8]
		ifFalse: [(_gsSqueakTemp_highWord := magnitude >> 32) = 0
				ifTrue: [_gsSqueakTemp_sz := 4]
				ifFalse: [_gsSqueakTemp_sz := 5.
					(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
						ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1.
							(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
								ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1.
									(_gsSqueakTemp_highWord := _gsSqueakTemp_highWord >> 8) = 0
										ifFalse: [_gsSqueakTemp_sz := _gsSqueakTemp_sz + 1]]]]].
	_gsSqueakTemp_newLargeInteger := objectMemory instantiateClass: _gsSqueakTemp_largeClass indexableSize: _gsSqueakTemp_sz.
	SPURVM
		ifTrue: ["Memory is eight byte aligned in SPUR, so we are sure to have
			room for 64bits word whatever allocated sz"
			objectMemory
				storeLong64: 0
				ofObject: _gsSqueakTemp_newLargeInteger
				withValue: (objectMemory byteSwapped64IfBigEndian: magnitude)]
		ifFalse: [_gsSqueakTemp_sz > 4
				ifTrue: [objectMemory
						storeLong64: 0
						ofObject: _gsSqueakTemp_newLargeInteger
						withValue: (objectMemory byteSwapped64IfBigEndian: magnitude)]
				ifFalse: [objectMemory
						storeLong32: 0
						ofObject: _gsSqueakTemp_newLargeInteger
						withValue: (objectMemory byteSwapped32IfBigEndian: magnitude)]].
	^ _gsSqueakTemp_newLargeInteger