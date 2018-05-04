testing base plugins
testPluginReturnTypeC
	"Pragma declarations should generate the same C source code as the
	traditional method send declarations"

	| stsp m p |
	stsp := SlangTestSupportPlugin inline: false.
	m := (stsp asCString: #returnTypeByMethod)
			copyReplaceAll: 'returnTypeByMethod'
			with: 'methodName'.
	p := (stsp asCString: #returnTypeByPragma)
			copyReplaceAll: 'returnTypeByPragma'
			with: 'methodName'.
	self assert: m = p