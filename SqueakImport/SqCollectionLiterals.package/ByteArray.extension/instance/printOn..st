*SqCollectionLiterals-*SqCollectionLiterals-*SqCollectionLiterals-*SqByteArray-printing
printOn: aStream
	self shouldBePrintedAsLiteral ifFalse:
		[super printOn: aStream.
		 aStream space].
	self printAsLiteralOn: aStream
