writing
writeCollectionContents:aCollection
	self print:'( '.
		super writeCollectionContents:aCollection.
		self print:')'.
	^self.
