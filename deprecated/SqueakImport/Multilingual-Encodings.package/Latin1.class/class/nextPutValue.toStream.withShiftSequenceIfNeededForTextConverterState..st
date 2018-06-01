class methods
nextPutValue: ascii toStream: aStream withShiftSequenceIfNeededForTextConverterState: state

	(ascii <= 16r7F and: [state g0Leading ~= 0]) ifTrue: [
		state charSize: 1.
		state g0Leading: 0.
		state g0Size: 1.
		aStream basicNextPutAll: CompoundTextSequence.
		aStream basicNextPut: (Character value: ascii).
		^ self.
	].

	((16r80 <= ascii and: [ascii <= 16rFF]) and: [state g1Leading ~= 0]) ifTrue: [
		^ self nextPutRightHalfValue: ascii toStream: aStream withShiftSequenceIfNeededForTextConverterState: state.
	].

	aStream basicNextPut: (Character value: ascii).
	^ self.
