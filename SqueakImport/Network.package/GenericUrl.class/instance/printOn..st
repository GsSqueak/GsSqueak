printing
printOn: aStream

	aStream nextPutAll: self schemeName.
	aStream nextPut: $:.
	aStream nextPutAll: self locator.

	self fragment ifNotNil:
		[aStream nextPut: $#.
		aStream nextPutAll: self fragment].