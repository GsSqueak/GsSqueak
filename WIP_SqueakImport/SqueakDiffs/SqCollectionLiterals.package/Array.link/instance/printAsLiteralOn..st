*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqArray-printing
printAsLiteralOn: aStream
	aStream nextPut: $#; nextPut: $(.
	self do: [:each| each printAsLiteralOn: aStream] separatedBy: [aStream space].
	aStream nextPut: $)
