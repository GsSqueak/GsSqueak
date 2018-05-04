testing interpreter
testInterpReturnTypeC
	"Pragma declarations should generate the same C source code as the
	traditional method send declarations"

	| stssi m p |
	stssi := SlangTestSupportInterpreter inline: false.
	m := (stssi asCString: #returnTypeByMethod)
			copyReplaceAll: 'returnTypeByMethod'
			with: 'methodName'.
	p := (stssi asCString: #returnTypeByPragma)
			copyReplaceAll: 'returnTypeByPragma'
			with: 'methodName'.
	self assert: m = p