testing ssip plugins
testSSIPDeclareInline
	"Pragma declarations should generate the same C source code as the
	traditional method send declarations"

	| stss m p |
	stss := SlangTestSupportSSIP inline: true.
	m := ((stss asCString: #inlineByMethod)
			copyReplaceAll: 'inlineByMethod'
			with: 'methodName')
				copyReplaceAll: 'methodThatShouldNotBeInlinedByMethod'
				with: 'calledMethodName'.
	p := ((stss asCString: #inlineByPragma)
			copyReplaceAll: 'inlineByPragma'
			with: 'methodName')
				copyReplaceAll: 'methodThatShouldNotBeInlinedByPragma'
				with: 'calledMethodName'.
	self assert: m = p