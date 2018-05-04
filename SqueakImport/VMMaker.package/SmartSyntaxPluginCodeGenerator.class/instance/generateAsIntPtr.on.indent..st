translating builtins
generateAsIntPtr: aNode on: aStream indent: anInteger

	aStream nextPutAll: '(int *) interpreterProxy->firstIndexableField('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.