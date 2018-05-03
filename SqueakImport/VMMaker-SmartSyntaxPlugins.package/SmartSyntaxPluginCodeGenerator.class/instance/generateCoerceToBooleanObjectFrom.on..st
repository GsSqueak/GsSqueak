asOop:/asValue:
generateCoerceToBooleanObjectFrom: aNode on: aStream

	aStream nextPutAll: '('.
	self emitCExpression: aNode on: aStream.
	aStream nextPutAll: '? interpreterProxy->trueObject(): interpreterProxy->falseObject())'