accessing
hasGlyphWithFallbackOf: aCharacter

	| index f |
	index := aCharacter leadingChar +1.
	fontArray size < index ifTrue: [^ false].
	(f := fontArray at: index) ifNil: [^ false].

	^ f hasGlyphWithFallbackOf: aCharacter.
