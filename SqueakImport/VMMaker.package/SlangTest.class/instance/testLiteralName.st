testing variable declaration
testLiteralName
	"sizeOf: #Foo should translated to C function call sizeof(Foo), where Foo is a literal, not a string"

	| stssi s |
	stssi := SlangTestSupportInterpreter inline: false.
	s := stssi asCString: #sizeOfFoo .
	self assert: (s includesSubString: 'sizeOf(Foo)').
	self deny: (s includesSubString: 'sizeOf("Foo")').

