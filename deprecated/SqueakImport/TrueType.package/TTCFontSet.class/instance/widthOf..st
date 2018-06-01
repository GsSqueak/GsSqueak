measuring
widthOf: aCharacter

	| encoding font |
	encoding := aCharacter leadingChar.
	encoding >= fontArray size ifFalse: [
		font := (fontArray at: encoding + 1).
		font ifNotNil: [^ font widthOf: aCharacter].
	].
	^ (fontArray at: 1) widthOf: aCharacter.
