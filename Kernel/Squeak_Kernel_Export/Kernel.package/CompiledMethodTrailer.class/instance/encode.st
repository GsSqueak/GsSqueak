encoding
encode

	encodedData := nil.
	
	"encode the trailer into byte array"
	self perform: ('encode' , kind) asSymbol.

	self assert: (encodedData notNil and: [encodedData size > 0 ]).
	
	"set the size"
	size := encodedData size.