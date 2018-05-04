testing interpreter
testInterpDoNotdoNotGenerateByPragma
	"A <doNotdoNotGenerate> declaration should prevent code generation"

	| stssi m |
	stssi := SlangTestSupportInterpreter inline: false.
	self assert: (SlangTestSupportInterpreter canUnderstand: #doNotGenerateByPragma).
	m := stssi asCString: #doNotGenerateByPragma.
	self assert: (m includesSubString: 'No source has been generated').
	self deny: (stssi asCString includesSubString: 'doNotGenerateByPragma').
	self assert: (stssi doNotGenerateByPragma = 4)
