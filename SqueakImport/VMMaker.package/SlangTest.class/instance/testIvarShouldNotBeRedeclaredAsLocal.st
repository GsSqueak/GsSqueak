testing variable declaration
testIvarShouldNotBeRedeclaredAsLocal
	"Document a bug in some versions of the code generator. If an instance variable is
	referenced in the generated code, that variable should not be declared as a local
	in the function."

	| stssi s |
	stssi := SlangTestSupportInterpreter inline: false.
	s := stssi asCString: #setBreakSelector: .
	self deny: (s includesSubString: 'sqInt breakSelector;')
