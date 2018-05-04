translating builtins
generateAsCharPtr: aNode on: aStream indent: anInteger

	aStream nextPutAll: '(char *) interpreterProxy->firstIndexableField('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ')'.