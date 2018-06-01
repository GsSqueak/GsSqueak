public
nextPutAll: aCollection

	self isBinary ifTrue: [
		^ super nextPutAll: aCollection.
	].
	^aCollection do: [:e | self nextPut: e].
