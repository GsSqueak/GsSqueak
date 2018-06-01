primitive support
noInlineSigned32BitValueGutsOf: oop 
	"Convert the given object into an integer value.
	The object may be a four-byte LargeInteger."
	| _gsSqueakTemp_value _gsSqueakTemp_negative _gsSqueakTemp_ok _gsSqueakTemp_magnitude |
	self deny: objectMemory hasSixtyFourBitImmediates.
	self
		deny: (objectMemory isIntegerObject: oop).
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
	(objectMemory numBytesOfBytes: oop)
			> 4
		ifTrue: [^ self primitiveFail].
	_gsSqueakTemp_magnitude := self
				cCoerceSimple: (objectMemory
						byteSwapped32IfBigEndian: (objectMemory fetchLong32: 0 ofObject: oop))
				to: #'unsigned int'.
	(_gsSqueakTemp_negative
			ifTrue: [_gsSqueakTemp_magnitude > 2147483648]
			ifFalse: [_gsSqueakTemp_magnitude >= 2147483648])
		ifTrue: [self primitiveFail.
			^ 0].
	_gsSqueakTemp_negative
		ifTrue: [_gsSqueakTemp_value := 0 - _gsSqueakTemp_magnitude]
		ifFalse: [_gsSqueakTemp_value := _gsSqueakTemp_magnitude].
	^ _gsSqueakTemp_value