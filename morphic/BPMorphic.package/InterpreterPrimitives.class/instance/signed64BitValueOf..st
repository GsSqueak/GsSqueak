primitive support
signed64BitValueOf: oop 
	"Convert the given object into an integer value.
	The object may be either a positive SmallInteger or a eight-byte
	LargeInteger. "
	| _gsSqueakTemp_sz _gsSqueakTemp_value _gsSqueakTemp_negative _gsSqueakTemp_ok _gsSqueakTemp_magnitude |
	(objectMemory isIntegerObject: oop)
		ifTrue: [^ self
				cCoerce: (objectMemory integerValueOf: oop)
				to: #sqLong].
	(objectMemory isNonIntegerImmediate: oop)
		ifTrue: [self primitiveFail.
			^ 0].
	_gsSqueakTemp_ok := objectMemory
				isClassOfNonImm: oop
				equalTo: (objectMemory splObj: ClassLargePositiveInteger)
				compactClassIndex: ClassLargePositiveIntegerCompactIndex.
	_gsSqueakTemp_ok
		ifTrue: [_gsSqueakTemp_negative := false]
		ifFalse: [_gsSqueakTemp_negative := true.
			_gsSqueakTemp_ok := objectMemory
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
	magnitude := objectMemory byteSwapped64IfBigEndian:
	(objectMemory fetchLong64: 0 ofObject: oop)]
	ifFalse:
	["
	_gsSqueakTemp_sz > 4
		ifTrue: [_gsSqueakTemp_magnitude := objectMemory
						byteSwapped64IfBigEndian: (objectMemory fetchLong64: 0 ofObject: oop)]
		ifFalse: [_gsSqueakTemp_magnitude := self
						cCoerceSimple: (objectMemory
								byteSwapped32IfBigEndian: (objectMemory fetchLong32: 0 ofObject: oop))
						to: #'unsigned int'
			"]"].
	(_gsSqueakTemp_negative
			ifTrue: [_gsSqueakTemp_magnitude > 9223372036854775808]
			ifFalse: [_gsSqueakTemp_magnitude >= 9223372036854775808])
		ifTrue: [self primitiveFail.
			^ 0].
	_gsSqueakTemp_negative
		ifTrue: [_gsSqueakTemp_value := 0 - _gsSqueakTemp_magnitude]
		ifFalse: [_gsSqueakTemp_value := _gsSqueakTemp_magnitude].
	^ _gsSqueakTemp_value