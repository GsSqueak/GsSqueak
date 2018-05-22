class creation
subclassMessageForType: aSymbol

	aSymbol == #normal ifTrue: [^ 'subclass:'].
	aSymbol == #indexable ifTrue: [^ 'indexableSubclass:'].
	(self byteTypes includes: aSymbol)
		ifTrue: [^ 'byteSubclass:'].
	aSymbol == #weak ifTrue: [^ 'indexableSubclass:'].
	self error: 'subclass type not recognized'