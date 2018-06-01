public
nextPut: aCharacter

	aCharacter isInteger ifTrue: [^ super nextPut: aCharacter asCharacter].
	self converter nextPut: aCharacter toStream: self.
	^aCharacter
