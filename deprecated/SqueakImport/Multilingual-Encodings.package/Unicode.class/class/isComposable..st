character classification
isComposable: aCharacter
	"Answers true if the given character has any composition sequences"
	^Compositions includesKey: aCharacter asInteger