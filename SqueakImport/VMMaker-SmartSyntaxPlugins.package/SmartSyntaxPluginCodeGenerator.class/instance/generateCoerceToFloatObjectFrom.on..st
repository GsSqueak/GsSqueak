asOop:/asValue:
generateCoerceToFloatObjectFrom: aNode on: aStream

	aStream nextPutAll: 'interpreterProxy->floatObjectOf('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: ')'