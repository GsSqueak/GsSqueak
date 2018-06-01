accessing
ascentOf: aCharacter

"	(self hasGlyphFor: aCharacter) ifFalse: [
		fallbackFont ifNotNil: [
			^ fallbackFont ascentOf: aCharacter.
		].
	].
"
	^ self ascent.
