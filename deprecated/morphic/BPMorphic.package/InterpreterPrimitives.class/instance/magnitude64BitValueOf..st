primitive support
magnitude64BitValueOf: oop 
	"Convert the given object into an integer value.
	The object may be either a positive SmallInteger or an eight-byte
	LargeInteger. "
	| _gsSqueakTemp_sz _gsSqueakTemp_value _gsSqueakTemp_ok _gsSqueakTemp_smallIntValue |
	(objectMemory isIntegerObject: oop)
		ifTrue: [_gsSqueakTemp_smallIntValue := objectMemory integerValueOf: oop.
			_gsSqueakTemp_smallIntValue < 0
				ifTrue: [_gsSqueakTemp_smallIntValue := 0 - _gsSqueakTemp_smallIntValue].
			^ self cCoerce: _gsSqueakTemp_smallIntValue to: #usqLong].
	(objectMemory isNonIntegerImmediate: oop)
		ifTrue: [self primitiveFail.
			^ 0].
	_gsSqueakTemp_ok := objectMemory
				isClassOfNonImm: oop
				equalTo: (objectMemory splObj: ClassLargePositiveInteger)
				compactClassIndex: ClassLargePositiveIntegerCompactIndex.
	_gsSqueakTemp_ok
		ifFalse: [_gsSqueakTemp_ok := objectMemory
						isClassOfNonImm: oop
						equalTo: (objectMemory splObj: ClassLargeNegativeInteger)
						compactClassIndex: ClassLargeNegativeIntegerCompactIndex.
			_gsSqueakTemp_ok
				ifFalse: [self primitiveFail.
					^ 0]].
	_gsSqueakTemp_sz := objectMemory numBytesOfBytes: oop.
	_gsSqueakTemp_sz
			> (self sizeof: #sqLong)
		ifTrue: [self primitiveFail.
			^ 0].
	"self cppIf: SPURVM
	ifTrue:
	["
	"Memory is 8 byte aligned in Spur and oversized bytes are set to zero,
	so we can safely fetch 8 bytes"
	"
	value := objectMemory byteSwapped64IfBigEndian: (objectMemory
	fetchLong64: 0 ofObject: oop)]
	ifFalse:
	["
	_gsSqueakTemp_sz > 4
		ifTrue: [_gsSqueakTemp_value := objectMemory
						byteSwapped64IfBigEndian: (objectMemory fetchLong64: 0 ofObject: oop)]
		ifFalse: [_gsSqueakTemp_value := self
						cCoerceSimple: (objectMemory
								byteSwapped32IfBigEndian: (objectMemory fetchLong32: 0 ofObject: oop))
						to: #'unsigned int'
			"]"].
	^ _gsSqueakTemp_value