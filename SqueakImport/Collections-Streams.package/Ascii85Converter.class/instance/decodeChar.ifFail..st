conversion
decodeChar: char ifFail: failBlock

	char = $z ifTrue: [^ self decodeZIfFail: failBlock].
	
	(char between: $! and: $u) ifFalse: [^ failBlock value].

	self incrementTupleSize.
	self incrementNumber85: char asInteger - 33 * (self pow85 at: self tupleSize).
	self tupleSize = 5 ifTrue:
		[self isBinary
			ifTrue: [self writeBytes255: self number85 atMax: 4]
			ifFalse: [self writeChars255: self number85 atMax: 4].
		self resetDecoderState]