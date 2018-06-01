character classification
isComposed: aCharacter
	"Answers true if the given character can be decomposed into a Unicode sequence."
	^Decompositions includesKey: aCharacter asInteger