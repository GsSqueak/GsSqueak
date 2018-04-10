writing
writeCollectionContents: aCollection separator: separator 
	^ self
		writeCollectionContents: aCollection
		separator: separator
		iterationMessage: #do: