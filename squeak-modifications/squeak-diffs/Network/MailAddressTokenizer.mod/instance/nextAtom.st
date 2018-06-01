tokenizing
nextAtom
	| start end |
	start := pos.
	pos := text indexOfAnyOf: self class nonAtomSet startingAt: start ifAbsent: [ text size + 1].
	end := pos - 1.
	^MailAddressToken
		type: #Atom
		text: (text copyFrom: start to: end)