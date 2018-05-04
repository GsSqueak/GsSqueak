translating builtins
generateAsBooleanObj: aNode on: aStream indent: anInteger

	aStream nextPutAll: '('.
	self emitCExpression: aNode receiver on: aStream.
	aStream nextPutAll: 
		') ? interpreterProxy->trueObject(): interpreterProxy->falseObject()'.