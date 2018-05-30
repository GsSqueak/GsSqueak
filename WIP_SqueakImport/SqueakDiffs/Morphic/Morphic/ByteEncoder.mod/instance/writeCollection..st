writing
writeCollection:aCollection
	^self print:aCollection class name; 
		writeCollectionContents:aCollection.

