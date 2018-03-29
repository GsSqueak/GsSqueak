indexing primitive support
asciiOfCharacter: characterObj 
	"Returns an integer object"
	(objectMemory isCharacterObject: characterObj)
		ifTrue: [^ CharacterTable
				ifNil: [objectMemory integerObjectOfCharacterObject: characterObj]
				ifNotNil: [objectMemory fetchPointer: CharacterValueIndex ofObject: characterObj]].
	self primitiveFailFor: PrimErrBadArgument.
	^ ConstZero"in case some code needs an int"