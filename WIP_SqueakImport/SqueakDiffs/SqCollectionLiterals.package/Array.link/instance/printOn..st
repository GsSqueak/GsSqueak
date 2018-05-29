printing
printOn: aStream
	self class == Array ifFalse:
		[^super printOn: aStream].
	self shouldBePrintedAsLiteral
		ifTrue: [self printAsLiteralOn: aStream]
		ifFalse: [self printAsBraceFormOn: aStream]
