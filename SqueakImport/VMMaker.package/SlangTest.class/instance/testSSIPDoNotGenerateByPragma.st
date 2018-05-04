testing ssip plugins
testSSIPDoNotGenerateByPragma
	"A <doNotdoNotGenerate> declaration should prevent code generation"

	| stss m |
	stss := SlangTestSupportSSIP inline: false.
	self assert: (SlangTestSupportSSIP canUnderstand: #doNotGenerateByPragma).
	m := stss asCString: #doNotGenerateByPragma.
	self assert: (m includesSubString: 'No source has been generated').
	self deny: (stss asCString includesSubString: 'doNotGenerateByPragma').
	self assert: (stss doNotGenerateByPragma = 4)
