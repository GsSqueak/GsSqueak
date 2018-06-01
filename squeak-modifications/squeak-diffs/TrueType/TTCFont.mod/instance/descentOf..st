accessing
descentOf: aCharacter

"	(self hasGlyphFor: aCharacter) ifFalse: [
		fallbackFont ifNotNil: [
			^ fallbackFont descentOf: aCharacter.
		].
	]."
	^ self descent.
