primitive support
positive64BitValueOf: oop 
	"Convert the given object into an integer value.
	The object may be either a positive SmallInteger or an eight-byte
	LargePositiveInteger. "
	| _gsSqueakTemp_sz _gsSqueakTemp_value _gsSqueakTemp_ok |
	(objectMemory isIntegerObject: oop)
		ifTrue: [(objectMemory integerValueOf: oop)
					< 0
				ifTrue: [^ self primitiveFail].
			^ objectMemory integerValueOf: oop].
	(objectMemory isNonIntegerImmediate: oop)
		ifTrue: [self primitiveFail.
			^ 0].
	_gsSqueakTemp_ok := objectMemory
				isClassOfNonImm: oop
				equalTo: (objectMemory splObj: ClassLargePositiveInteger)
				compactClassIndex: ClassLargePositiveIntegerCompactIndex.
	_gsSqueakTemp_ok
		ifFalse: [self primitiveFail.
			^ 0].
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