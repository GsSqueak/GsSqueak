composing
decompose: aCharacter
	"Answers the decomposed sequence for the given character if such a sequence
	exists. If there is no decomposition for the character, answer nil."
	^String withAll: ((Decompositions at: aCharacter asInteger ifAbsent:[^nil]) 
		collect:[:v| Character value: v]).