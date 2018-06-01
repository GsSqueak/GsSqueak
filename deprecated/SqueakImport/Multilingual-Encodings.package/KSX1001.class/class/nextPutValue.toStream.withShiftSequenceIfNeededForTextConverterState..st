class methods
nextPutValue: ascii toStream: aStream withShiftSequenceIfNeededForTextConverterState: state

	| c1 c2 |
	state charSize: 2.
	(state g0Leading ~= self leadingChar) ifTrue: [
		state g0Leading: self leadingChar.
		state g0Size: 2.
		aStream basicNextPutAll: CompoundTextSequence.
	].
	c1 := ascii // 94 + 16r21.
	c2 := ascii \\ 94 + 16r21.
	^ aStream basicNextPut: (Character value: c1); basicNextPut: (Character value: c2).
