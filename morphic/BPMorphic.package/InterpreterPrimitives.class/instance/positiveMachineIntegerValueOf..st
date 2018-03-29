primitive support
positiveMachineIntegerValueOf: oop 
	"Answer a value of an integer in address range, i.e up to the size of a
	machine word.
	The object may be either a positive SmallInteger or a
	LargePositiveInteger of size <= word size."
	"only two callers & one is primitiveNewWithArg"
	| _gsSqueakTemp_value _gsSqueakTemp_bs _gsSqueakTemp_ok |
	(objectMemory isIntegerObject: oop)
		ifTrue: [_gsSqueakTemp_value := objectMemory integerValueOf: oop.
			_gsSqueakTemp_value < 0
				ifTrue: [^ self primitiveFail].
			^ _gsSqueakTemp_value].
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
	_gsSqueakTemp_bs := objectMemory numBytesOfBytes: oop.
	_gsSqueakTemp_bs
			> (self sizeof: #'usqIntptr_t')
		ifTrue: [self primitiveFail.
			^ 0].
	"self cppIf: SPURVM
	ifTrue: ["
	"Memory is 8 byte aligned in Spur and oversized bytes are set to zero,
	so we can safely fetch 8 bytes"
	"
	^objectMemory byteSwapped64IfBigEndian: (objectMemory
	fetchLong64: 0 ofObject: oop)]
	ifFalse: ["
	((self sizeof: #'usqIntptr_t')
				= 8
			and: [_gsSqueakTemp_bs > 4])
		ifTrue: [^ objectMemory
				byteSwapped64IfBigEndian: (objectMemory fetchLong64: 0 ofObject: oop)]
		ifFalse: [^ self
				cCoerceSimple: (objectMemory
						byteSwapped32IfBigEndian: (objectMemory fetchLong32: 0 ofObject: oop))
				to: #'unsigned int'"]"]