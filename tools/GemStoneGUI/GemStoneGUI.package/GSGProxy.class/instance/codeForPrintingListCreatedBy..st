serialization
codeForPrintingListCreatedBy: collectionCreationCode

	^ '[:collection |
	String streamContents: [:stream |
		| isFirst |
		isFirst := true.
		collection do: [:elem |
			isFirst 
				ifTrue: [isFirst := false]
				ifFalse: [ stream nextPut: Character lf].
			stream nextPutAll: elem asString]]] value: (' , collectionCreationCode , $)