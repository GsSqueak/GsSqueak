translating builtins
generateAsSmallIntegerObj: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->integerObjectOf('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.