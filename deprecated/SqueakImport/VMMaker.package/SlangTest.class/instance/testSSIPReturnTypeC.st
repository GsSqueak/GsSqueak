testing ssip plugins
testSSIPReturnTypeC
	"Pragma declarations should generate the same C source code as the
	traditional method send declarations"

	| stss m p |
	stss := SlangTestSupportSSIP inline: false.
	m := (stss asCString: #returnTypeByMethod)
			copyReplaceAll: 'returnTypeByMethod'
			with: 'methodName'.
	p := (stss asCString: #returnTypeByPragma)
			copyReplaceAll: 'returnTypeByPragma'
			with: 'methodName'.
	self assert: m = p