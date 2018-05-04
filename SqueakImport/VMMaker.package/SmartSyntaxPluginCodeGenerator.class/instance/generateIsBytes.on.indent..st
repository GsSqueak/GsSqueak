translating builtins
generateIsBytes: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->isBytes('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.