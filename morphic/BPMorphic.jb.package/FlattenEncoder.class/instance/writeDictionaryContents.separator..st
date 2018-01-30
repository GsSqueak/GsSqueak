writing
writeDictionaryContents: aCollection separator: separator 
	^ self
		writeCollectionContents: aCollection
		separator: separator
		iterationMessage: #associationsDo: