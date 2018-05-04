testing base plugins
testPluginMixedMethodAndPragmaDeclarations
	"Pragmas and method declarations should coexist"

	| stsp s |
	stsp := SlangTestSupportPlugin inline: false.
	s := (stsp asCString: #varDefByMethodAndPragma)
			copyReplaceAll: 'varDefByMethod'
			with: 'methodName'.
	self assert: (s includesSubString: 'unsigned int * bar').
	self assert: (s includesSubString: 'char *foo').
	self assert: (s includesSubString: 'float baz').
	self assert: (s includesSubString: 'double fum').
