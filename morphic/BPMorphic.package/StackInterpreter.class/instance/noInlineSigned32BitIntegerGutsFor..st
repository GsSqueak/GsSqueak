primitive support
noInlineSigned32BitIntegerGutsFor: integerValue 
	"Answer a full 32 bit integer object for the given integer value which
	is known not to be a SmallInteger value. This serves to share the
	code for creating a four byte LargeInteger in one place."
	| _gsSqueakTemp_newLargeInteger _gsSqueakTemp_magnitude _gsSqueakTemp_largeClass |
	self deny: objectMemory hasSixtyFourBitImmediates.
	self
		deny: (objectMemory isIntegerValue: integerValue).
	integerValue < 0
		ifTrue: [_gsSqueakTemp_largeClass := ClassLargeNegativeIntegerCompactIndex.
			_gsSqueakTemp_magnitude := 0 asUnsignedInteger - integerValue]
		ifFalse: [_gsSqueakTemp_largeClass := ClassLargePositiveIntegerCompactIndex.
			_gsSqueakTemp_magnitude := integerValue].
	_gsSqueakTemp_newLargeInteger := objectMemory
				eeInstantiateSmallClassIndex: _gsSqueakTemp_largeClass
				format: (objectMemory byteFormatForNumBytes: 4)
				numSlots: 1.
	objectMemory
		storeLong32: 0
		ofObject: _gsSqueakTemp_newLargeInteger
		withValue: (objectMemory byteSwapped32IfBigEndian: _gsSqueakTemp_magnitude).
	SPURVM
		ifTrue: ["Memory is 8 byte aligned in Spur, make sure that oversized
			bytes are set to zero"
			"eem 4/28/2016 questionable; they should never be read"
			objectMemory
				storeLong32: 1
				ofObject: _gsSqueakTemp_newLargeInteger
				withValue: 0].
	^ _gsSqueakTemp_newLargeInteger