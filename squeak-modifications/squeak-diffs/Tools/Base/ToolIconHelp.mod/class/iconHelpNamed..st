as yet unclassified
iconHelpNamed: aSymbol

	^ (self respondsTo: aSymbol)
		ifTrue: [self helpTexts at: aSymbol ifAbsentPut: [self perform: aSymbol]]
		ifFalse: [String empty]
	