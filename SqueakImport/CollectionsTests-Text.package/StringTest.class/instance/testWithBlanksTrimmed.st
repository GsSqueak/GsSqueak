tests - converting
testWithBlanksTrimmed

	| s |
	self assert: ' abc  d   ' withBlanksTrimmed = 'abc  d'.
	self assert: 'abc  d   ' withBlanksTrimmed = 'abc  d'.
	self assert: ' abc  d' withBlanksTrimmed = 'abc  d'.
	self assert: (((0 to: 255) collect: [ :each | each asCharacter ] thenSelect: [ :each | each isSeparator ]) as: String) withBlanksTrimmed = ''.
	s := 'abcd'.
	self assert: s withBlanksTrimmed = s.
	self assert: s withBlanksTrimmed ~~ s.