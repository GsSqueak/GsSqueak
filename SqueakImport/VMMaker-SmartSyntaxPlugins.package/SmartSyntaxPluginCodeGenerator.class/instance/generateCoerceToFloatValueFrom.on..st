asOop:/asValue:
generateCoerceToFloatValueFrom: aNode on: aStream

	aStream nextPutAll: 'interpreterProxy->floatValueOf('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: ')'