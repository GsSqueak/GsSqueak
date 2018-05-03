translating builtins
generateAsCBoolean: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->booleanValueOf('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.