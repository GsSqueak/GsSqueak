stream extensions
nextPut: anObject 
	self target == self ifFalse: [self target nextPut: anObject]. "delegated to stdout"
	^ super nextPut: anObject.