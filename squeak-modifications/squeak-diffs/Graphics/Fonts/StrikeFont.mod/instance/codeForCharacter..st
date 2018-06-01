private
codeForCharacter: aCharacter
	| code |
	code := aCharacter charCode.
	(self characterToGlyphMap isNil
		or: [	characterToGlyphMap size <= code ])
			ifTrue: [^code].
	^characterToGlyphMap at: code + 1