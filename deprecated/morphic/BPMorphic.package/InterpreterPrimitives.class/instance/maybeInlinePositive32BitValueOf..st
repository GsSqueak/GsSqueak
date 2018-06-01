primitive support
maybeInlinePositive32BitValueOf: oop 
	"Convert the given object into an integer value.
	The object may be either a positive SmallInteger or a four-byte
	LargePositiveInteger. "
	| _gsSqueakTemp_value _gsSqueakTemp_ok _gsSqueakTemp_sz |
	(objectMemory isIntegerObject: oop)
		ifTrue: [_gsSqueakTemp_value := objectMemory integerValueOf: oop.
			_gsSqueakTemp_value < 0
				ifTrue: [self primitiveFail.
					_gsSqueakTemp_value := 0].
			^ _gsSqueakTemp_value].
	(objectMemory isNonIntegerImmediate: oop)
		ifTrue: [self primitiveFail.
			^ 0]
		ifFalse: [_gsSqueakTemp_ok := objectMemory
						isClassOfNonImm: oop
						equalTo: (objectMemory splObj: ClassLargePositiveInteger)
						compactClassIndex: ClassLargePositiveIntegerCompactIndex.
			_gsSqueakTemp_ok
				ifFalse: [self primitiveFail.
					^ 0].
			_gsSqueakTemp_sz := objectMemory numBytesOfBytes: oop.
			_gsSqueakTemp_sz > 4
				ifTrue: [self primitiveFail.
					^ 0].
			^ self
				cCoerceSimple: (objectMemory
						byteSwapped32IfBigEndian: (objectMemory fetchLong32: 0 ofObject: oop))
				to: #'unsigned int']