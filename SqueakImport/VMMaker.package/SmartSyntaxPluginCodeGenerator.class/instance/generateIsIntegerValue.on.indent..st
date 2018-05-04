translating builtins
generateIsIntegerValue: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->isIntegerValue('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.