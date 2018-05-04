translating builtins
generateIsFloat: aNode on: aStream indent: anInteger

	aStream nextPutAll: 'interpreterProxy->isFloatObject('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.