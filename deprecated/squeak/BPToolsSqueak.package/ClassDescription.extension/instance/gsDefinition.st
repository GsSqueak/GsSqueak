*BPToolsSqueak
gsDefinition

	| aStream |
	aStream := WriteStream on: (String new: 300).
	aStream
		nextPut: $(;
		nextPutAll: superclass name;
		nextPutAll: self kindOfSubclass;
		store: self name.
	(self hasTraitComposition and: [self traitComposition notEmpty]) ifTrue: [
		aStream cr; tab; nextPutAll: 'uses: ';
			nextPutAll: self traitCompositionString].
	aStream cr; tab; nextPutAll: 'instVarNames: ';
			nextPutAll: self instVarNames fullPrintString.
	aStream cr; tab; nextPutAll: 'classVars: ';
			nextPutAll: self classVarNames fullPrintString.
	aStream cr; tab; nextPutAll: 'classInstVars: ';
			nextPutAll: self class instVarNames fullPrintString.
	aStream cr; tab; nextPutAll: 'poolDictionaries: { '.
	self sharedPools asStringOn: aStream delimiter: ' . '.
	aStream nextPutAll: ' }'.
	aStream cr; tab; nextPutAll: 'inDictionary: Smalltalk'.
	aStream cr; tab; nextPutAll: 'newVersionOf: nil'.
	aStream cr; tab; nextPutAll: 'description: ''0'''.
	aStream cr; tab; nextPutAll: 'options: #()'.
	aStream cr; tab; nextPutAll: ') category: ';
			store: (self environment organization categoryOfElement: self name) asString.

	^ aStream contents