C code generator
returnPrefixFromVariable: aName
	^((self globalsAsSet includes: aName) and: [self placeInStructure: aName])
		ifTrue: ['foo->',aName]
		ifFalse: [aName]