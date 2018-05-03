asOop:/asValue:
generateCoerceToBooleanValueFrom: aNode on: aStream

	aStream nextPutAll: 'interpreterProxy->booleanValueOf('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: ')'