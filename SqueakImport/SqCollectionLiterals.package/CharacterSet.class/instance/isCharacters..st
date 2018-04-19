*SqCollectionLiterals-*SqCollectionLiterals-testing
isCharacters: aCollection
	"Answer whether this collection contains characters"
	^self species = aCollection species or: [aCollection isString or: [aCollection allSatisfy: [:e | e isCharacter]]]
