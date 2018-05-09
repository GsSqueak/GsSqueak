class initialization
initialize
"
	self initialize
"


	CompoundTextSequence := String streamContents: [:s |
		s nextPut: Character escape.
		s nextPut: $(.
		s nextPut: $B.
	].

	RightHalfSequence := String streamContents: [:s |
		s nextPut: Character escape.
		s nextPut: $-.
		s nextPut: $A.
	].
