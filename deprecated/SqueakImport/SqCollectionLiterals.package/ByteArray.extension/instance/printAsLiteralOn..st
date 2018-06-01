*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqByteArray-printing
printAsLiteralOn: aStream
	aStream nextPut: $#; nextPut: $[.
	self do: [:each| each storeOn: aStream]
		separatedBy: [aStream nextPut: $ ].
	aStream nextPut: $]
