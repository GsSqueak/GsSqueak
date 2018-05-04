testing interpreter
testInterpTypeDeclarations
	"Pragma declarations should generate the same C source code as the
	traditional method send declarations"

	| stssi m p |
	stssi := SlangTestSupportInterpreter inline: false.
	m := (stssi asCString: #varDefByMethod)
			copyReplaceAll: 'varDefByMethod'
			with: 'methodName'.
	p := (stssi asCString: #varDefByPragma)
			copyReplaceAll: 'varDefByPragma'
			with: 'methodName'.
	self assert: m = p