testing ssip plugins
testSSIPMixedMethodAndPragmaDeclarations
	"Pragmas and method declarations should coexist"

	| stss s |
	stss := SlangTestSupportSSIP inline: false.
	s := (stss asCString: #varDefByMethodAndPragma)
			copyReplaceAll: 'varDefByMethod'
			with: 'methodName'.
	self assert: (s includesSubString: 'unsigned int * bar').
	self assert: (s includesSubString: 'char *foo').
	self assert: (s includesSubString: 'float baz').
	self assert: (s includesSubString: 'double fum').
