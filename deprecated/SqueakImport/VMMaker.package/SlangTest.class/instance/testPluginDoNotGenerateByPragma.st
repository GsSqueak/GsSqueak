testing base plugins
testPluginDoNotGenerateByPragma
	"A <doNotdoNotGenerate> declaration should prevent code generation"

	| stsp m |
	stsp := SlangTestSupportPlugin inline: false.
	self assert: (SlangTestSupportPlugin canUnderstand: #doNotGenerateByPragma).
	m := stsp asCString: #doNotGenerateByPragma.
	self assert: (m includesSubString: 'No source has been generated').
	self deny: (stsp asCString includesSubString: 'doNotGenerateByPragma').
	self assert: (stsp doNotGenerateByPragma = 4)
