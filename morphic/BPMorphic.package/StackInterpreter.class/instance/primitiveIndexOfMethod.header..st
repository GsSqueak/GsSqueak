compiled methods
primitiveIndexOfMethod: theMethod header: methodHeader 
	"Note: With the Squeak V3 format we now have 10 bits of primitive
	index, but they are
	in two places for temporary backward compatibility. The time to
	unpack is negligible,
	since the derived primitive function pointer is stored in the method
	cache. With the
	Spur format we assume a 3-byte CallPrimitive with a little-endian
	16-bit primitive index."
	| _gsSqueakTemp_firstBytecode |
	^ objectMemory hasSpurMemoryManagerAPI
		ifTrue: [(self alternateHeaderHasPrimitiveFlag: methodHeader)
				ifTrue: [_gsSqueakTemp_firstBytecode := self firstBytecodeOfAlternateHeader: methodHeader method: theMethod.
					(objectMemory byteAt: _gsSqueakTemp_firstBytecode + 1)
						+ ((objectMemory byteAt: _gsSqueakTemp_firstBytecode + 2)
								<< 8)]
				ifFalse: [0]]
		ifFalse: [MULTIPLEBYTECODESETS
				ifTrue: [(objectMemory headerIndicatesAlternateBytecodeSet: methodHeader)
						ifTrue: [(self alternateHeaderHasPrimitiveFlag: methodHeader)
								ifTrue: [_gsSqueakTemp_firstBytecode := self firstBytecodeOfAlternateHeader: methodHeader method: theMethod.
									(objectMemory byteAt: _gsSqueakTemp_firstBytecode + 1)
										+ ((objectMemory byteAt: _gsSqueakTemp_firstBytecode + 2)
												<< 8)]
								ifFalse: [0]]
						ifFalse: [| primBits |
							primBits := objectMemory integerValueOf: methodHeader.
							(primBits bitAnd: 511)
								+ (primBits >> 19 bitAnd: 512)]]
				ifFalse: [| primBits |
					primBits := objectMemory integerValueOf: methodHeader.
					(primBits bitAnd: 511)
						+ (primBits >> 19 bitAnd: 512)]]