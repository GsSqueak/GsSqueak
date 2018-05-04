translating builtins
generateIsWords: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->isWords('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.