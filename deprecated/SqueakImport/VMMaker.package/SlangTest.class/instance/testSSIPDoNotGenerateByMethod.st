testing ssip plugins
testSSIPDoNotGenerateByMethod
	"A doNotdoNotGenerate statement should prevent code generation"

	| stss m |
	stss := SlangTestSupportSSIP inline: false.
	self assert: (SlangTestSupportSSIP canUnderstand: #doNotGenerateByMethod).
	m := stss asCString: #doNotGenerateByMethod.
	self assert: (m includesSubString: 'No source has been generated').
	self deny: (stss asCString includesSubString: 'doNotGenerateByMethod').
	self assert: (stss doNotGenerateByMethod = 4)