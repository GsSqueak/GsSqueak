translating builtins
generateAsCInt: aNode on: aStream indent: anInteger

	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: ' >> 1'.