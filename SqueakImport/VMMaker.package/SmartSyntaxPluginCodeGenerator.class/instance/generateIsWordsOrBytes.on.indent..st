translating builtins
generateIsWordsOrBytes: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->isWordsOrBytes('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.