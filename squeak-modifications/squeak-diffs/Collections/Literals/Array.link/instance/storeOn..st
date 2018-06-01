printing
storeOn: aStream
	"Use the literal form if possible."
	self shouldBePrintedAsLiteral
		ifTrue:  [self printAsLiteralOn: aStream]
		ifFalse: [super storeOn: aStream]
