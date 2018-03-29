primitive support
signedMachineIntegerValueOf: oop 
	"Answer a signed value of an integer up to the size of a machine word.
	The object may be either a positive SmallInteger or a LargeInteger of
	size <= word size."
	| _gsSqueakTemp_negative _gsSqueakTemp_ok _gsSqueakTemp_bs _gsSqueakTemp_value _gsSqueakTemp_limit _gsSqueakTemp_magnitude |
	(objectMemory isIntegerObject: oop)
		ifTrue: [^ objectMemory integerValueOf: oop].
	(objectMemory isNonIntegerImmediate: oop)
		ifTrue: [^ self primitiveFail].
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
				ifFalse: [^ self primitiveFail]].
	_gsSqueakTemp_bs := objectMemory numBytesOf: oop.
	_gsSqueakTemp_bs
			> (self sizeof: #'usqIntptr_t')
		ifTrue: [^ self primitiveFail].
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
	((self sizeof: #'sqIntptr_t')
				= 8
			and: [_gsSqueakTemp_bs > 4])
		ifTrue: [_gsSqueakTemp_magnitude := objectMemory
						byteSwapped64IfBigEndian: (objectMemory fetchLong64: 0 ofObject: oop)]
		ifFalse: [_gsSqueakTemp_magnitude := self
						cCoerceSimple: (objectMemory
								byteSwapped32IfBigEndian: (objectMemory fetchLong32: 0 ofObject: oop))
						to: #'unsigned int'
			"]"].
	_gsSqueakTemp_limit := 1 asUnsignedIntegerPtr << ((self sizeof: #'sqIntptr_t')
					* 8 - 1).
	(_gsSqueakTemp_negative
			ifTrue: [_gsSqueakTemp_magnitude > _gsSqueakTemp_limit]
			ifFalse: [_gsSqueakTemp_magnitude >= _gsSqueakTemp_limit])
		ifTrue: [self primitiveFail.
			^ 0].
	_gsSqueakTemp_negative
		ifTrue: [_gsSqueakTemp_value := 0 - _gsSqueakTemp_magnitude]
		ifFalse: [_gsSqueakTemp_value := _gsSqueakTemp_magnitude].
	^ _gsSqueakTemp_value