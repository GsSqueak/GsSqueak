printing
printOn: aStream

	aStream nextPutAll: self class name; nextPutAll: ': ('.
	self provider
		ifNotNil: [ aStream nextPutAll: provider printString].
	aStream nextPutAll: ' --- '. 
	self selector
		ifNotNil: [ aStream nextPutAll: selector asString].
	aStream nextPut: $)

