adding
add: aCharacter
	self block: [:c | c = aCharacter or: [block value: c]].
	^aCharacter