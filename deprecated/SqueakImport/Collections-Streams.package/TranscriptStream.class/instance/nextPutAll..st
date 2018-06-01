stream extensions
nextPutAll: aCollection
	self target == self ifFalse: [self target nextPutAll: aCollection]. "delegated to stdout"
	^ super nextPutAll: aCollection.